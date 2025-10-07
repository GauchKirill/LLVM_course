#!/usr/bin/env python3
import re
from collections import Counter, defaultdict
from itertools import islice

def normalize_instruction(line):
    """Нормализует инструкцию, заменяя имена переменных на метки"""
    if not line.strip():
        return None
        
    # Удаляем лишние пробелы
    line = re.sub(r'\s+', ' ', line.strip())
    
    # Пропускаем пустые строки
    if not line:
        return None
        
    # Разбиваем на токены
    tokens = line.split()
    if not tokens:
        return None
        
    # Удаляем имя результата, если есть (например, %1 = ...)
    if len(tokens) >= 3 and tokens[1] == '=':
        tokens = tokens[2:]
    
    if not tokens:
        return None
        
    # Первый токен - опкод
    opcode = tokens[0]
    
    # Нормализуем остальные токены
    normalized_tokens = [opcode]
    
    for token in tokens[1:]:
        # Обрабатываем типы
        if token in ['i32', 'i64', 'i8', 'i1', 'i16', 'float', 'double', 'void', 'label']:
            normalized_tokens.append(token)
        # Обрабатываем переменные
        elif token.startswith('%'):
            normalized_tokens.append('var')
        # Обрабатываем глобальные переменные
        elif token.startswith('@'):
            normalized_tokens.append('global')
        # Обрабатываем числовые константы
        elif re.match(r'^-?[0-9]+$', token) or re.match(r'^0x[0-9a-fA-F]+$', token):
            normalized_tokens.append('const')
        # Обрабатываем строковые константы
        elif token.startswith('"') or token.startswith("'"):
            normalized_tokens.append('const')
        # Обрабатываем другие токены
        elif token in ['align', 'nuw', 'nsw', 'exact', 'inbounds', 'to']:
            normalized_tokens.append(token)
        else:
            normalized_tokens.append(token)
    
    return ' '.join(normalized_tokens)

def sliding_window(seq, n):
    """Генерирует скользящие окна размера n"""
    it = iter(seq)
    result = tuple(islice(it, n))
    if len(result) == n:
        yield result
    for elem in it:
        result = result[1:] + (elem,)
        yield result

def analyze_patterns(trace_file, max_length=5):
    """Анализирует паттерны в трассе исполнения"""
    print(f"Анализ трассы из файла: {trace_file}")
    
    # Читаем и нормализуем инструкции
    with open(trace_file, 'r') as f:
        instructions = [line.strip() for line in f if line.strip()]
    
    print(f"Всего инструкций в трассе: {len(instructions)}")
    
    normalized = []
    for inst in instructions:
        norm_inst = normalize_instruction(inst)
        if norm_inst:
            normalized.append(norm_inst)
    
    print(f"Нормализованных инструкций: {len(normalized)}")
    
    if not normalized:
        print("Нет инструкций для анализа!")
        return
    
    # Собираем статистику по паттернам разной длины
    patterns_stats = defaultdict(Counter)
    
    for length in range(1, max_length + 1):
        patterns = Counter()
        
        # Собираем все последовательности заданной длины
        for window in sliding_window(normalized, length):
            pattern = " → ".join(window)
            patterns[pattern] += 1
        
        patterns_stats[length] = patterns
        
        # Выводим топ-10 паттернов для этой длины
        print(f"\n=== Паттерны длины {length} (топ-10) ===")
        if patterns:
            for pattern, count in patterns.most_common(10):
                print(f"{count:6d} раз: {pattern}")
        else:
            print("Нет паттернов")
    
    # Сохраняем полную статистику в файл
    with open("pattern_stats.txt", "w") as f:
        f.write("Статистика паттернов инструкций\n")
        f.write("================================\n\n")
        
        for length in range(1, max_length + 1):
            f.write(f"Паттерны длины {length}:\n")
            f.write("-" * 50 + "\n")
            
            patterns = patterns_stats[length]
            if patterns:
                for pattern, count in patterns.most_common(20):
                    f.write(f"{count:6d} | {pattern}\n")
            else:
                f.write("Нет паттернов\n")
            f.write("\n")
    
    # Анализ отдельных инструкций
    print(f"\n=== Статистика отдельных инструкций (топ-20) ===")
    single_instructions = Counter(normalized)
    for inst, count in single_instructions.most_common(20):
        print(f"{count:6d} раз: {inst}")

if __name__ == "__main__":
    analyze_patterns("trace.log", max_length=5)