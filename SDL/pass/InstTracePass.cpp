#include <llvm-18/llvm/IR/Function.h>
#include <llvm/IR/Function.h>
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include <string>

using namespace llvm;

class InstTracePass : public PassInfoMixin<InstTracePass> {
public:
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM) {
    // Пропускаем объявленные функции (без тела)
    if (F.isDeclaration()) {
      return PreservedAnalyses::all();
    }

    Module *M = F.getParent();
    LLVMContext &Context = M->getContext();

    // Объявляем функцию __log_inst, если ее нет
    FunctionCallee logFunc = M->getOrInsertFunction(
      "__log_inst", 
      Type::getVoidTy(Context), 
      PointerType::getUnqual(Type::getInt8Ty(Context))
    );

    // Пропускаем функцию __log_inst
    if (F.getName() == "__log_inst") {
      return PreservedAnalyses::all();
    }

    bool modified = false;

    for (auto &BB : F) {
      for (auto &I : BB) {
        // Пропускаем phi-инструкции
        if (isa<PHINode>(I)) {
          continue;
        }

        // Получаем строковое представление инструкции
        std::string instStr;
        raw_string_ostream os(instStr);
        I.print(os);
        os.flush();

        // Используем IRBuilder для создания глобальной строки
        IRBuilder<> builder(&I);
        Value *strValue = builder.CreateGlobalString(instStr, "inst_str");
        
        // Вставляем вызов __log_inst перед инструкцией
        Value *args[] = {strValue};
        builder.CreateCall(logFunc, args);
        
        modified = true;
      }
    }

    return modified ? PreservedAnalyses::none() : PreservedAnalyses::all();
  }
};

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
  return {
    LLVM_PLUGIN_API_VERSION, "InstTracePass", "v0.1",
    [](PassBuilder &PB) {
      PB.registerPipelineParsingCallback(
        [](StringRef Name, FunctionPassManager &FPM,
           ArrayRef<PassBuilder::PipelineElement>) {
          if (Name == "insttrace") {
            FPM.addPass(InstTracePass());
            return true;
          }
          return false;
        });
    }};
}