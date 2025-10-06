#include <time.h>
#include <stdlib.h>
#include <SDL2/SDL.h>
#include "sim.h"

#define PARTICLE_COUNT 50

// Параметры случайных величин
#define MIN_RADIUS 5
#define MAX_RADIUS 15
#define MIN_SPEED 1
#define MAX_SPEED 6
#define MIN_COLOR 50
#define MAX_COLOR 255
#define PARTICLE_COUNT 50

// Функция для получения случайного числа в диапазоне
int random_range(int min, int max) {
    return min + rand() % (max - min + 1);
}

void app(void) {
    // Инициализация генератора случайных чисел
    srand(time(NULL));

    int particle_x[PARTICLE_COUNT];
    int particle_y[PARTICLE_COUNT];
    int particle_vx[PARTICLE_COUNT];
    int particle_vy[PARTICLE_COUNT];
    int particle_radius[PARTICLE_COUNT];
    
    int particle_color_r[PARTICLE_COUNT];
    int particle_color_g[PARTICLE_COUNT];
    int particle_color_b[PARTICLE_COUNT];

    // Инициализация случайных значений для частиц
    for (int i = 0; i < PARTICLE_COUNT; i++) {
        // Случайный радиус
        particle_radius[i] = random_range(MIN_RADIUS, MAX_RADIUS);
        
        // Случайная позиция (учитывая радиус, чтобы не выходить за границы)
        particle_x[i] = random_range(particle_radius[i], WINDOW_WIDTH - particle_radius[i]);
        particle_y[i] = random_range(particle_radius[i], WINDOW_HEIGHT - particle_radius[i]);
        
        // Случайная скорость (может быть положительной или отрицательной)
        particle_vx[i] = random_range(MIN_SPEED, MAX_SPEED) * (rand() % 2 ? 1 : -1);
        particle_vy[i] = random_range(MIN_SPEED, MAX_SPEED) * (rand() % 2 ? 1 : -1);
        
        // Случайный цвет
        particle_color_r[i] = random_range(MIN_COLOR, MAX_COLOR);
        particle_color_g[i] = random_range(MIN_COLOR, MAX_COLOR);
        particle_color_b[i] = random_range(MIN_COLOR, MAX_COLOR);
    }

    int running = 1;
    while (running)
    {
        // Обновление позиций
        for (int i = 0; i < PARTICLE_COUNT; i++) {
            particle_x[i] += particle_vx[i];
            particle_y[i] += particle_vy[i];
        }

        // Столкновения со стенками
        for (int i = 0; i < PARTICLE_COUNT; i++) {
            // Левая и правая стенки
            if (particle_x[i] < particle_radius[i]) {
                particle_x[i] = particle_radius[i];
                particle_vx[i] = -particle_vx[i];
            }
            if (particle_x[i] > WINDOW_WIDTH - particle_radius[i]) {
                particle_x[i] = WINDOW_WIDTH - particle_radius[i];
                particle_vx[i] = -particle_vx[i];
            }
            
            // Верхняя и нижняя стенки
            if (particle_y[i] < particle_radius[i]) {
                particle_y[i] = particle_radius[i];
                particle_vy[i] = -particle_vy[i];
            }
            if (particle_y[i] > WINDOW_HEIGHT - particle_radius[i]) {
                particle_y[i] = WINDOW_HEIGHT - particle_radius[i];
                particle_vy[i] = -particle_vy[i];
            }
        }

        // Столкновения между частицами
        for (int i = 0; i < PARTICLE_COUNT; i++) {
            for (int j = i + 1; j < PARTICLE_COUNT; j++) {
                int dx = particle_x[i] - particle_x[j];
                int dy = particle_y[i] - particle_y[j];
                int distance_squared = dx * dx + dy * dy;
                int min_distance = particle_radius[i] + particle_radius[j];
                int min_distance_squared = min_distance * min_distance;

                if (distance_squared < min_distance_squared && distance_squared > 0) {
                    // Обмен скоростями, упрощенная модель упругого столкновения)
                    int temp_vx = particle_vx[i];
                    int temp_vy = particle_vy[i];
                    
                    particle_vx[i] = particle_vx[j];
                    particle_vy[i] = particle_vy[j];
                    
                    particle_vx[j] = temp_vx;
                    particle_vy[j] = temp_vy;

                    // Простое раздвигание частиц чтобы избежать залипания
                    int overlap_fix = 2;
                    
                    // Сдвигаем частицы в противоположные стороны по осям
                    if (dx > 0) {
                        particle_x[i] += overlap_fix;
                        particle_x[j] -= overlap_fix;
                    } else {
                        particle_x[i] -= overlap_fix;
                        particle_x[j] += overlap_fix;
                    }
                    
                    if (dy > 0) {
                        particle_y[i] += overlap_fix;
                        particle_y[j] -= overlap_fix;
                    } else {
                        particle_y[i] -= overlap_fix;
                        particle_y[j] += overlap_fix;
                    }
                }
            }
        }

        running = !sim(particle_color_r, particle_color_g, particle_color_b,
                       particle_x, particle_y, particle_radius, PARTICLE_COUNT);
    }
}
