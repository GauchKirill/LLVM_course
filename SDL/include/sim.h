#ifndef SIM_H
#define SIM_H

#ifdef __cplusplus
extern "C" {
#endif

#define WINDOW_WIDTH 800
#define WINDOW_HEIGHT 600

void simInit(void);
int sim(const int *particle_color_r, const int *particle_color_g, const int *particle_color_b,
         const int *particle_x, const int *particle_y, const int *particle_radius, const int particle_cnt);
void simExit(void);
extern void app(void);

#ifdef __cplusplus
}
#endif

#endif
