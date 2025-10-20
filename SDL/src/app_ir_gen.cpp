#include "sim.h"
#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"
#include <vector>

using namespace llvm;

// Объявления для проброса функций
extern "C" {
    void simInit(void);
    void simExit(void);
    int sim(const int *particle_color_r, const int *particle_color_g, const int *particle_color_b,
            const int *particle_x, const int *particle_y, const int *particle_radius, int particle_cnt);
}

// Простые реализации для тестирования
void simInit() {
    printf("simInit called\n");
}

void simExit() {
    printf("simExit called\n");
}

int sim(const int* particle_color_r, const int* particle_color_g, const int* particle_color_b,
        const int* particle_x, const int* particle_y, const int* particle_radius, int particle_cnt) {
    printf("sim called with %d particles\n", particle_cnt);
    static int frame_count = 0;
    frame_count++;
    
    // Завершаем после 10 кадров для тестирования
    if (frame_count >= 10) {
        return 1;
    }
    return 0;
}

int main() {
    LLVMContext context;
    Module* module = new Module("app.c", context);
    IRBuilder<> builder(context);

    // Типы
    Type* voidType = Type::getVoidTy(context);
    Type* int32Type = Type::getInt32Ty(context);
    PointerType* int32PtrType = PointerType::get(int32Type, 0); // Исправлено: создаем PointerType правильно
    
    // Объявление функции sim
    std::vector<Type*> simParamTypes = {
        int32PtrType, int32PtrType, int32PtrType,
        int32PtrType, int32PtrType, int32PtrType,
        int32Type
    };
    FunctionType* simType = FunctionType::get(int32Type, simParamTypes, false);
    FunctionCallee simFunc = module->getOrInsertFunction("sim", simType);

    // Объявление функций инициализации и завершения
    FunctionType* simInitType = FunctionType::get(voidType, false);
    FunctionCallee simInitFunc = module->getOrInsertFunction("simInit", simInitType);
    
    FunctionType* simExitType = FunctionType::get(voidType, false);
    FunctionCallee simExitFunc = module->getOrInsertFunction("simExit", simExitType);

    // Создание функции app
    FunctionType* appType = FunctionType::get(voidType, false);
    Function* appFunc = Function::Create(appType, Function::ExternalLinkage, "app", module);

    // Создание базовых блоков
    BasicBlock* entryBB = BasicBlock::Create(context, "entry", appFunc);
    BasicBlock* mainLoopBB = BasicBlock::Create(context, "main_loop", appFunc);
    BasicBlock* updateBB = BasicBlock::Create(context, "update", appFunc);
    BasicBlock* renderBB = BasicBlock::Create(context, "render", appFunc);
    BasicBlock* exitBB = BasicBlock::Create(context, "exit", appFunc);

    // Entry block - инициализация
    builder.SetInsertPoint(entryBB);
    builder.CreateCall(simInitFunc);
    builder.CreateBr(mainLoopBB);

    // Main loop
    builder.SetInsertPoint(mainLoopBB);
    PHINode* loopCounter = builder.CreatePHI(int32Type, 2, "loop_counter");
    loopCounter->addIncoming(builder.getInt32(0), entryBB);
    
    // Условие выхода из цикла
    Value* shouldExit = builder.CreateICmpSGE(loopCounter, builder.getInt32(100), "should_exit");
    builder.CreateCondBr(shouldExit, exitBB, updateBB);

    // Update block - упрощенная логика
    builder.SetInsertPoint(updateBB);
    builder.CreateBr(renderBB);

    // Render block - вызов sim
    builder.SetInsertPoint(renderBB);
    
    // Создаем фиктивные массивы для демонстрации - исправлено использование ConstantPointerNull
    Value* nullPtr = ConstantPointerNull::get(int32PtrType);
    
    std::vector<Value*> simArgs = {
        nullPtr, // particle_color_r
        nullPtr, // particle_color_g  
        nullPtr, // particle_color_b
        nullPtr, // particle_x
        nullPtr, // particle_y
        nullPtr, // particle_radius
        builder.getInt32(50) // particle_cnt
    };
    
    Value* simResult = builder.CreateCall(simFunc, simArgs, "sim_result");
    
    // Обновление счетчика цикла
    Value* nextCounter = builder.CreateAdd(loopCounter, builder.getInt32(1), "next_counter");
    loopCounter->addIncoming(nextCounter, renderBB);
    
    builder.CreateBr(mainLoopBB);

    // Exit block
    builder.SetInsertPoint(exitBB);
    builder.CreateCall(simExitFunc);
    builder.CreateRetVoid();

    // Верификация и вывод IR
    outs() << "=== ГЕНЕРИРОВАННЫЙ LLVM IR ===\n";
    module->print(outs(), nullptr);
    outs() << "\n";
    
    if (verifyModule(*module, &outs())) {
        outs() << "Ошибка верификации модуля!\n";
        return 1;
    }
    outs() << "[VERIFICATION] OK\n\n";

    // Интерпретация с пробросом функций
    outs() << "[EE] Запуск интерпретатора...\n";
    InitializeNativeTarget();
    InitializeNativeTargetAsmPrinter();

    ExecutionEngine* ee = EngineBuilder(std::unique_ptr<Module>(module)).create();
    ee->InstallLazyFunctionCreator([](const std::string& fnName) -> void* {
        if (fnName == "simInit") return reinterpret_cast<void*>(simInit);
        if (fnName == "sim") return reinterpret_cast<void*>(sim);
        if (fnName == "simExit") return reinterpret_cast<void*>(simExit);
        return nullptr;
    });
    
    ee->finalizeObject();

    // Запуск
    ArrayRef<GenericValue> noargs;
    outs() << "[EE] Выполнение функции app...\n";
    GenericValue result = ee->runFunction(appFunc, noargs);
    
    outs() << "[EE] Выполнение завершено\n";
    
    delete ee;
    return 0;
}