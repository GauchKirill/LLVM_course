# Компилятор и флаги
CC = clang
CFLAGS = -Wall -Wextra -std=c99 -pedantic -O2 -Iinclude
SDL_FLAGS = -lSDL2

# Структура папок
SRC_DIR = src
INC_DIR = include
OBJ_DIR = obj
BIN_DIR = bin

# Целевые файлы
TARGET = $(BIN_DIR)/gas_simulation
SOURCES = $(wildcard $(SRC_DIR)/*.c)
OBJECTS = $(SOURCES:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

# Правило по умолчанию
all: $(TARGET)

# Сборка исполняемого файла
$(TARGET): $(OBJECTS) | $(BIN_DIR)
	$(CC) $(OBJECTS) -o $(TARGET).out $(SDL_FLAGS)

# Компиляция объектных файлов
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Создание папок
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# Зависимости для конкретных файлов
$(OBJ_DIR)/start.o: $(INC_DIR)/sim.h
$(OBJ_DIR)/sim.o: $(INC_DIR)/sim.h

# Очистка
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)

# Пересборка
rebuild: clean all

# Запуск программы
run: $(TARGET)
	./$(TARGET).out

# Отладочная сборка
debug: CFLAGS += -g -DDEBUG
debug: rebuild

# Статический анализ
analyze: clean
	clang-tidy $(SRC_DIR)/*.c -- $(CFLAGS) -I$(INC_DIR)

# Показать информацию о структуре
info:
	@echo "Source files: $(SOURCES)"
	@echo "Object files: $(OBJECTS)"
	@echo "Target: $(TARGET).out"
	@echo "Include dir: $(INC_DIR)"

# Помощь
help:
	@echo "Доступные цели:"
	@echo "  all      - сборка проекта (по умолчанию)"
	@echo "  clean    - удаление скомпилированных файлов"
	@echo "  rebuild  - пересборка проекта"
	@echo "  run      - сборка и запуск программы"
	@echo "  debug    - отладочная сборка"
	@echo "  analyze  - статический анализ"
	@echo "  info     - показать информацию о файлах"
	@echo "  help     - показать эту справку"

.PHONY: all clean rebuild run debug analyze info help