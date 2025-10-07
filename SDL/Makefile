# Компилятор и флаги
CC = clang
CXX = clang++
CFLAGS = -Wall -Wextra -std=c99 -pedantic -O2 -Iinclude -fPIE
CXXFLAGS = -Wall -Wextra -std=c++14 -fno-rtti -fPIC -w
SDL_FLAGS = -lSDL2 -lm
LDFLAGS = -pie

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
TARGET = $(BIN_DIR)/gas_simulation
SOURCES = $(wildcard $(SRC_DIR)/*.c)
OBJECTS = $(SOURCES:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

# Pass файлы
PASS_SOURCE = $(PASS_DIR)/InstTracePass.cpp
PASS_TARGET = $(PASS_BUILD_DIR)/InstTracePass.so

# Правило по умолчанию
all: $(TARGET)

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

# Инструментирование app.c (упрощенная версия)
instrument: $(PASS_TARGET) logger.o
	@echo "Инструментирование app.c..."
	@mkdir -p $(IR_DIR)
	# Компилируем app.c в LLVM IR
	$(CC) -Wall -Wextra -std=c99 -O2 -Iinclude -fPIC -S -emit-llvm $(SRC_DIR)/app.c -o $(IR_DIR)/app.ll
	# Конвертируем в bitcode
	$(CC) -Wall -Wextra -std=c99 -O2 -Iinclude -fPIC -c -emit-llvm $(SRC_DIR)/app.c -o $(IR_DIR)/app.bc
	# Инструментируем с помощью Pass
	opt -load-pass-plugin $(PASS_TARGET) -passes="insttrace" $(IR_DIR)/app.bc -o $(IR_DIR)/app_instrumented.bc
	# Компилируем обратно в объектный файл
	llc $(IR_DIR)/app_instrumented.bc -o $(IR_DIR)/app_instrumented.s
	$(CC) -Wall -Wextra -std=c99 -O2 -Iinclude -fPIC -c $(IR_DIR)/app_instrumented.s -o $(OBJ_DIR)/app_instrumented.o
	# Собираем финальный исполняемый файл
	$(CC) -no-pie $(OBJ_DIR)/app_instrumented.o $(OBJ_DIR)/sim.o $(OBJ_DIR)/start.o logger.o -o $(BIN_DIR)/app_instrumented $(SDL_FLAGS)
# Компиляция логгера
logger.o: logger.c
	$(CC) $(CFLAGS) -c logger.c -o logger.o

# Анализ трасс
analyze:
	@echo "Анализ трасс..."
	python3 analyze_trace.py

# Очистка
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR) $(IR_DIR) $(PASS_BUILD_DIR) *.o trace.log pattern_stats.txt

# Пересборка
rebuild: clean all

# Запуск программы
run: $(TARGET)
	./$(TARGET)

# Запуск инструментированной программы
run-instrumented: instrument
	./$(BIN_DIR)/app_instrumented

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
		sudo apt-get update && sudo apt-get install -y clang llvm python3; \
	elif [ -f /etc/arch-release ]; then \
		sudo pacman -S --noconfirm clang llvm python; \
	elif [ -f /etc/redhat-release ]; then \
		sudo dnf install -y clang llvm python3; \
	else \
		echo "Неизвестный дистрибутив. Установите clang, llvm и python3 вручную."; \
	fi

.PHONY: all clean rebuild run debug check-deps install-deps instrument run-instrumented analyze