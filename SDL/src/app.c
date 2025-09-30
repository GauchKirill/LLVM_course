// Логика приложения - только вычисления, без графики
#define WINDOW_WIDTH 800
#define WINDOW_HEIGHT 600
#define PARTICLE_COUNT 50

// Внешние массивы для связи с графикой
extern int particle_x[PARTICLE_COUNT];
extern int particle_y[PARTICLE_COUNT];
extern int particle_vx[PARTICLE_COUNT];
extern int particle_vy[PARTICLE_COUNT];
extern int particle_radius;

void app(void) {
    // Обновление позиций
    for (int i = 0; i < PARTICLE_COUNT; i++) {
        particle_x[i] += particle_vx[i];
        particle_y[i] += particle_vy[i];
    }

    // Столкновения со стенками
    for (int i = 0; i < PARTICLE_COUNT; i++) {
        // Левая и правая стенки
        if (particle_x[i] < particle_radius) {
            particle_x[i] = particle_radius;
            particle_vx[i] = -particle_vx[i];
        }
        if (particle_x[i] > WINDOW_WIDTH - particle_radius) {
            particle_x[i] = WINDOW_WIDTH - particle_radius;
            particle_vx[i] = -particle_vx[i];
        }
        
        // Верхняя и нижняя стенки
        if (particle_y[i] < particle_radius) {
            particle_y[i] = particle_radius;
            particle_vy[i] = -particle_vy[i];
        }
        if (particle_y[i] > WINDOW_HEIGHT - particle_radius) {
            particle_y[i] = WINDOW_HEIGHT - particle_radius;
            particle_vy[i] = -particle_vy[i];
        }
    }

    // Столкновения между частицами (упрощенная версия без sqrt)
    for (int i = 0; i < PARTICLE_COUNT; i++) {
        for (int j = i + 1; j < PARTICLE_COUNT; j++) {
            int dx = particle_x[i] - particle_x[j];
            int dy = particle_y[i] - particle_y[j];
            int distance_squared = dx * dx + dy * dy;
            int min_distance = particle_radius * 2;
            int min_distance_squared = min_distance * min_distance;

            if (distance_squared < min_distance_squared && distance_squared > 0) {
                // Обмен скоростями (упрощенная модель упругого столкновения)
                int temp_vx = particle_vx[i];
                int temp_vy = particle_vy[i];
                
                particle_vx[i] = particle_vx[j];
                particle_vy[i] = particle_vy[j];
                
                particle_vx[j] = temp_vx;
                particle_vy[j] = temp_vy;

                // Простое раздвигание частиц чтобы избежать залипания
                // Используем фиксированное смещение вместо вычисления точного расстояния
                int overlap_fix = 2; // фиксированное смещение
                
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
}
