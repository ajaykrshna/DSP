#include <stdio.h>

void convolve(int signal[], int impulse[], int signal_length, int impulse_length, int result[]) {
    int i, j, k;

    for (i = 0; i < signal_length + impulse_length - 1; i++) {
        result[i] = 0;
        for (j = 0; j <= i && j < signal_length; j++) {
            k = i - j;
            if (k < impulse_length) {
                result[i] += signal[j] * impulse[k];
            }
        }
    }
}