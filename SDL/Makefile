# Компилятор и флаги
CC = clang
CFLAGS = -Wall -Wextra -std=c99 -pedantic -O2 -Iinclude
SDL_FLAGS = -lSDL2 -lm

# Структура папок
SRC_DIR = src
INC_DIR = include
OBJ_DIR = obj
BIN_DIR = bin
IR_DIR = ir

# Целевые файлы
TARGET = $(BIN_DIR)/gas_simulation
SOURCES = $(wildcard $(SRC_DIR)/*.c)
OBJECTS = $(SOURCES:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
IR_FILES = $(SOURCES:$(SRC_DIR)/%.c=$(IR_DIR)/%.ll)

# Правило по умолчанию
all: $(TARGET) ir

# Сборка исполняемого файла
$(TARGET): $(OBJECTS)
	@mkdir -p $(BIN_DIR)
	$(CC) $(OBJECTS) -o $(TARGET).out $(SDL_FLAGS)

# Компиляция объектных файлов
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Генерация LLVM IR
$(IR_DIR)/%.ll: $(SRC_DIR)/%.c
	@mkdir -p $(IR_DIR)
	$(CC) $(CFLAGS) -S -emit-llvm $< -o $@

# Генерация оптимизированного IR
ir: $(IR_FILES)
	@echo "LLVM IR файлы сгенерированы в папке $(IR_DIR)/"

# Зависимости для конкретных файлов
$(OBJ_DIR)/start.o: $(INC_DIR)/sim.h
$(OBJ_DIR)/sim.o: $(INC_DIR)/sim.h

# Очистка
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR) $(IR_DIR)

# Пересборка
rebuild: clean all

# Запуск программы
run: $(TARGET)
	./$(TARGET).out

# Отладочная сборка
debug: CFLAGS += -g -DDEBUG
debug: rebuild

# Проверка стиля кода
style:
	@echo "=== Проверка стиля кода ==="
	@for file in $(SOURCES); do \
		echo "Проверка $$file:"; \
		grep -n "TODO\|FIXME" $$file || echo "  No TODOs/FIXMEs"; \
	done

# Проверка зависимостей
check-deps:
	@echo "=== Проверка зависимостей ==="
	@which $(CC) > /dev/null && echo "✓ $(CC) найден" || echo "✗ $(CC) не найден"
	@pkg-config --exists sdl2 && echo "✓ SDL2 найден" || echo "✗ SDL2 не найден"

# Установка зависимостей
install-deps:
	@echo "Установка зависимостей..."
	@if [ -f /etc/debian_version ]; then \
		sudo apt-get update && sudo apt-get install -y clang libsdl2-dev; \
	elif [ -f /etc/arch-release ]; then \
		sudo pacman -S --noconfirm clang sdl2; \
	elif [ -f /etc/redhat-release ]; then \
		sudo dnf install -y clang SDL2-devel; \
	else \
		echo "Неизвестный дистрибутив. Установите clang и libsdl2-dev вручную."; \
	fi

# Информация о проекте
info:
	@echo "Source files: $(SOURCES)"
	@echo "Object files: $(OBJECTS)"
	@echo "Target: $(TARGET)"
	@echo "Include dir: $(INC_DIR)"
	@echo "IR files: $(IR_FILES)"

# Справка
help:
	@echo "Доступные цели:"
	@echo "  all         - сборка проекта и генерация IR (по умолчанию)"
	@echo "  ir          - генерация LLVM IR файлов"
	@echo "  clean       - удаление скомпилированных файлов"
	@echo "  rebuild     - пересборка проекта"
	@echo "  run         - сборка и запуск программы"
	@echo "  debug       - отладочная сборка"
	@echo "  style       - проверка стиля кода"
	@echo "  check-deps  - проверка зависимостей"
	@echo "  install-deps- установка зависимостей"
	@echo "  info        - информация о файлах"
	@echo "  help        - справка"

.PHONY: all clean rebuild run debug style check-deps install-deps info help ir