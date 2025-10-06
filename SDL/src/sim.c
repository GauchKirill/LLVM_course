#include <SDL2/SDL.h>
#include <stdio.h>
#include <math.h>
#include "sim.h"

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

SDL_Window *window = NULL;
SDL_Renderer *renderer = NULL;

void simInit(void)
{    
    if (SDL_Init(SDL_INIT_VIDEO) != 0) {
        fprintf(stderr, "SDL_Init Error: %s\n", SDL_GetError());
        return;
    }

    window = SDL_CreateWindow("Gas Particle Simulation",
                                         SDL_WINDOWPOS_CENTERED,
                                         SDL_WINDOWPOS_CENTERED,
                                         WINDOW_WIDTH, WINDOW_HEIGHT,
                                         SDL_WINDOW_SHOWN);
    if (!window) {
        fprintf(stderr, "SDL_CreateWindow Error: %s\n", SDL_GetError());
        SDL_Quit();
        return;
    }

    renderer = SDL_CreateRenderer(window, -1, 
                                               SDL_RENDERER_ACCELERATED | 
                                               SDL_RENDERER_PRESENTVSYNC);
    if (!renderer) {
        fprintf(stderr, "SDL_CreateRenderer Error: %s\n", SDL_GetError());
        SDL_DestroyWindow(window);
        SDL_Quit();
        return;
    }
}

int sim(const int *particle_color_r, const int *particle_color_g, const int *particle_color_b,
         const int *particle_x, const int *particle_y, const int *particle_radius, const int particle_cnt) {

    SDL_Event event;
    while (SDL_PollEvent(&event)) {
        if (event.type == SDL_QUIT) {
            return 1;
        }
    }

    SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
    SDL_RenderClear(renderer);

    for (int i = 0; i < particle_cnt; i++) {
        SDL_SetRenderDrawColor(renderer, 
                                particle_color_r[i], 
                                particle_color_g[i], 
                                particle_color_b[i], 255);
        
        // Рисуем заполненный круг вместо квадрата
        draw_filled_circle(renderer, particle_x[i], particle_y[i], particle_radius[i]);
    }

    SDL_RenderPresent(renderer);
    SDL_Delay(16);

    return 0;
}

void simExit(void)
{
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
}
