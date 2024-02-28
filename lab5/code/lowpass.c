#include <stdio.h>
#include <math.h>

#define N 39  
#define PI 3.14159265358979323846

void hammingWindow(float h[]) {
    for (int n = 0; n < N; n++) {
        float window = 0.54 - 0.46 * cos(2 * PI * n / (N - 1));
        h[n] *= window;
    }
}

void LPF(float fc, float fs, float h[]) {
    float omega_c = 2 * PI * fc / fs;

    for (int n = -N / 2; n <= N / 2; n++) {
        if (n == 0) {
            h[n + N / 2] = omega_c / PI;
        } else {
            h[n + N / 2] = sin(omega_c * n) / (PI * n);
        }
    }
    hammingWindow(h);
}

int main() {
    float fs = 6000;   
    float fc = 400;
    float h[N];

    LPF(fc, fs, h);

    printf("Impulse Response after Hamming Window:\n");
    for (int i = 0; i < N; i++) {
        printf("%f\n", h[i]);
    }

    return 0;
}
