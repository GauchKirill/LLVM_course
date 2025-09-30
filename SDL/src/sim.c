#include <SDL2/SDL.h>
#include <stdio.h>
#include <stdlib.h>

#define WINDOW_WIDTH 800
#define WINDOW_HEIGHT 600

#define PARTICLE_COUNT 50

// Внешняя декларация функции приложения
extern void app(void);

// Глобальные данные для связи с app()
int particle_x[PARTICLE_COUNT];
int particle_y[PARTICLE_COUNT];
int particle_vx[PARTICLE_COUNT];
int particle_vy[PARTICLE_COUNT];
int particle_radius = 8;
int particle_color_r[PARTICLE_COUNT];
int particle_color_g[PARTICLE_COUNT];
int particle_color_b[PARTICLE_COUNT];

void run_app(void) {
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

    // Инициализация начальных значений
    for (int i = 0; i < PARTICLE_COUNT; i++) {
        particle_x[i] = 100 + (i * 15) % 600;
        particle_y[i] = 100 + (i * 20) % 400;
        particle_vx[i] = 1 + (i % 3);
        particle_vy[i] = 1 + ((i + 1) % 3);
        particle_color_r[i] = 100 + (i * 50) % 155;
        particle_color_g[i] = 100 + (i * 30) % 155;
        particle_color_b[i] = 100 + (i * 70) % 155;
    }

    int running = 1;
    while (running) {
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                running = 0;
            }
        }

        // Вызов логики приложения
        app();

        // Отрисовка
        SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
        SDL_RenderClear(renderer);

        for (int i = 0; i < PARTICLE_COUNT; i++) {
            SDL_SetRenderDrawColor(renderer, 
                                 particle_color_r[i], 
                                 particle_color_g[i], 
                                 particle_color_b[i], 255);
            
            SDL_Rect rect = {
                particle_x[i] - particle_radius,
                particle_y[i] - particle_radius,
                particle_radius * 2,
                particle_radius * 2
            };
            SDL_RenderFillRect(renderer, &rect);
        }

        SDL_RenderPresent(renderer);
        SDL_Delay(16); // ~60 FPS
    }

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
}
