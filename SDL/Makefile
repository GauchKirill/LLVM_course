# Компилятор и флаги
CC = clang
CXX = clang++
CFLAGS = -Wall -Wextra -std=c99 -pedantic -O2 -Iinclude -fPIC
CXXFLAGS = -Wall -Wextra -std=c++14 -fno-rtti -fPIC -w
SDL_FLAGS = -lSDL2 -lm
LDFLAGS = -no-pie

# Пути LLVM
LLVM_CONFIG = llvm-config
LLVM_CXXFLAGS = $(shell $(LLVM_CONFIG) --cxxflags) -w
LLVM_LDFLAGS = $(shell $(LLVM_CONFIG) --ldflags --libs --system-libs)

# Структура папок
SRC_DIR = src
INC_DIR = include
OBJ_DIR = obj
BIN_DIR = bin
IR_DIR = ir
PASS_DIR = pass
PASS_BUILD_DIR = pass_build

# Целевые файлы
TARGET = $(BIN_DIR)/gas_simulation.out
SOURCES = $(wildcard $(SRC_DIR)/*.c)
OBJECTS = $(SOURCES:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

# Pass файлы
PASS_SOURCE = $(PASS_DIR)/InstTracePass.cpp
PASS_TARGET = $(PASS_BUILD_DIR)/InstTracePass.so

# Файлы IR генератора
APP_IR_GEN = $(BIN_DIR)/app_ir_gen.out
SRC_IR_GEN = $(SRC_DIR)/app_ir_gen.cpp

# Правило по умолчанию
all: $(TARGET) $(APP_IR_GEN)

# Сборка исполняемого файла
$(TARGET): $(OBJECTS)
	@mkdir -p $(BIN_DIR)
	$(CC) $(OBJECTS) -o $(TARGET) $(SDL_FLAGS) $(LDFLAGS)

# Компиляция объектных файлов
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Сборка инструментирующего Pass
$(PASS_TARGET): $(PASS_SOURCE)
	@mkdir -p $(PASS_BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(LLVM_CXXFLAGS) -shared -o $(PASS_TARGET) $< $(LLVM_LDFLAGS)

# Инструментирование app.c
instrument: $(PASS_TARGET) $(OBJ_DIR)/logger.o
	@echo "Инструментирование app.c..."
	@mkdir -p $(IR_DIR)
	# Компилируем app.c в LLVM IR
	$(CC) $(CFLAGS) -S -emit-llvm $(SRC_DIR)/app.c -o $(IR_DIR)/app.ll
	# Конвертируем в bitcode
	$(CC) $(CFLAGS) -c -emit-llvm $(SRC_DIR)/app.c -o $(IR_DIR)/app.bc
	# Инструментируем с помощью Pass
	opt -load-pass-plugin $(PASS_TARGET) -passes="insttrace" $(IR_DIR)/app.bc -o $(IR_DIR)/app_instrumented.bc
	# Компилируем обратно в объектный файл
	llc $(IR_DIR)/app_instrumented.bc -o $(IR_DIR)/app_instrumented.s
	$(CC) $(CFLAGS) -c $(IR_DIR)/app_instrumented.s -o $(OBJ_DIR)/app_instrumented.o
	# Собираем финальный исполняемый файл
	$(CC) $(OBJ_DIR)/app_instrumented.o $(OBJ_DIR)/sim.o $(OBJ_DIR)/start.o $(OBJ_DIR)/logger.o -o $(BIN_DIR)/app_instrumented.out $(SDL_FLAGS) $(LDFLAGS)

# Анализ трасс
analyze:
	@echo "Анализ трасс..."
	python3 analyze_trace.py

# Сборка IR генератора
$(APP_IR_GEN): $(SRC_IR_GEN)
	@mkdir -p $(BIN_DIR)
	$(CXX) $(CXXFLAGS) $(LLVM_CXXFLAGS) -I$(INC_DIR) $< -o $@ $(LLVM_LDFLAGS) $(SDL_FLAGS) $(LDFLAGS)

# Запуска генератора
run_ir_gen: $(APP_IR_GEN)
	./$(APP_IR_GEN)

# Очистка
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR) $(IR_DIR) $(PASS_BUILD_DIR) trace.log pattern_stats.txt

# Пересборка
rebuild: clean all

# Запуск программы
run: $(TARGET)
	./$(TARGET)

# Запуск инструментированной программы
run-instrumented: instrument
	./$(BIN_DIR)/app_instrumented.out

# Проверка зависимостей
check-deps:
	@echo "=== Проверка зависимостей ==="
	@which $(CC) > /dev/null && echo "✓ $(CC) найден" || echo "✗ $(CC) не найден"
	@which $(CXX) > /dev/null && echo "✓ $(CXX) найден" || echo "✗ $(CXX) не найден"
	@which $(LLVM_CONFIG) > /dev/null && echo "✓ llvm-config найден" || echo "✗ llvm-config не найден"
	@pkg-config --exists sdl2 && echo "✓ SDL2 найден" || echo "✗ SDL2 не найден"

# Установка зависимостей
install-deps:
	@echo "Установка зависимостей..."
	@if [ -f /etc/debian_version ]; then \
		sudo apt-get update && sudo apt-get install -y clang llvm python3 libsdl2-dev; \
	elif [ -f /etc/arch-release ]; then \
		sudo pacman -S --noconfirm clang llvm python libsdl2-dev; \
	elif [ -f /etc/redhat-release ]; then \
		sudo dnf install -y clang llvm python3 libsdl2-dev; \
	else \
		echo "Неизвестный дистрибутив. Установите clang, llvm, libsdl2-dev и python3 вручную."; \
	fi

# Информация о структуре проекта
info:
	@echo "=== Структура проекта ==="
	@echo "Исходные коды:      $(SRC_DIR)/"
	@echo "Заголовочные файлы: $(INC_DIR)/"
	@echo "Объектные файлы:    $(OBJ_DIR)/"
	@echo "Исполняемые файлы:  $(BIN_DIR)/"
	@echo "LLVM IR файлы:      $(IR_DIR)/"
	@echo "Pass исходники:     $(PASS_DIR)/"
	@echo "Pass бинарники:     $(PASS_BUILD_DIR)/"

# Справка
help:
	@echo "Доступные цели:"
	@echo "  all              - сборка проекта"
	@echo "  instrument       - инструментирование app.c"
	@echo "  run-instrumented - запуск инструментированного приложения"
	@echo "  analyze          - анализ собранных трасс"
	@echo "  clean            - удаление скомпилированных файлов"
	@echo "  rebuild          - пересборка проекта"
	@echo "  run              - запуск обычной программы"
	@echo "  check-deps       - проверка зависимостей"
	@echo "  install-deps     - установка зависимостей"
	@echo "  info             - информация о структуре проекта"
	@echo "  help             - справка"

.PHONY: all clean rebuild run check-deps install-deps instrument run-instrumented analyze info help