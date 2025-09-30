#include <SDL2/SDL.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include "sim.h"

#define WINDOW_WIDTH 800
#define WINDOW_HEIGHT 600
#define PARTICLE_COUNT 50

// Параметры случайных величин
#define MIN_RADIUS 5
#define MAX_RADIUS 15
#define MIN_SPEED 1
#define MAX_SPEED 6
#define MIN_COLOR 50
#define MAX_COLOR 255

extern void app(void);

int particle_x[PARTICLE_COUNT];
int particle_y[PARTICLE_COUNT];
int particle_vx[PARTICLE_COUNT];
int particle_vy[PARTICLE_COUNT];
int particle_radius[PARTICLE_COUNT];
int particle_color_r[PARTICLE_COUNT];
int particle_color_g[PARTICLE_COUNT];
int particle_color_b[PARTICLE_COUNT];

// Функция для получения случайного числа в диапазоне
int random_range(int min, int max) {
    return min + rand() % (max - min + 1);
}

// Функция для рисования заполненного круга
void draw_filled_circle(SDL_Renderer* renderer, int center_x, int center_y, int radius) {
    for (int y = -radius; y <= radius; y++) {
        for (int x = -radius; x <= radius; x++) {
            if (x * x + y * y <= radius * radius) {
                SDL_RenderDrawPoint(renderer, center_x + x, center_y + y);
            }
        }
    }
}

void run_app(void) {
    // Инициализация генератора случайных чисел
    srand(time(NULL));
    
    if (SDL_Init(SDL_INIT_VIDEO) != 0) {
        fprintf(stderr, "SDL_Init Error: %s\n", SDL_GetError());
        return;
    }

    SDL_Window *window = SDL_CreateWindow("Gas Particle Simulation",
                                         SDL_WINDOWPOS_CENTERED,
                                         SDL_WINDOWPOS_CENTERED,
                                         WINDOW_WIDTH, WINDOW_HEIGHT,
                                         SDL_WINDOW_SHOWN);
    if (!window) {
        fprintf(stderr, "SDL_CreateWindow Error: %s\n", SDL_GetError());
        SDL_Quit();
        return;
    }

    SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, 
                                               SDL_RENDERER_ACCELERATED | 
                                               SDL_RENDERER_PRESENTVSYNC);
    if (!renderer) {
        fprintf(stderr, "SDL_CreateRenderer Error: %s\n", SDL_GetError());
        SDL_DestroyWindow(window);
        SDL_Quit();
        return;
    }

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
    while (running) {
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                running = 0;
            }
        }

        app();

        SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
        SDL_RenderClear(renderer);

        for (int i = 0; i < PARTICLE_COUNT; i++) {
            SDL_SetRenderDrawColor(renderer, 
                                 particle_color_r[i], 
                                 particle_color_g[i], 
                                 particle_color_b[i], 255);
            
            // Рисуем заполненный круг вместо квадрата
            draw_filled_circle(renderer, particle_x[i], particle_y[i], particle_radius[i]);
        }

        SDL_RenderPresent(renderer);
        SDL_Delay(16);
    }

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
}
