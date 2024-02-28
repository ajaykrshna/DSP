#include <stdio.h>

void convolve(float signal[], float impulse[], int signal_length, int impulse_length, float result[]) {
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

int main() {
    int signal_length, impulse_length, i;
    printf("Enter the size of the first array: ");
    scanf("%d", &signal_length);
    float signal[signal_length];
    printf("Enter the elements of the first array: ");
    for (i = 0; i < signal_length; i++) {
        scanf("%f", &signal[i]);
    }

    printf("Enter the size of the second array: ");
    scanf("%d", &impulse_length);
    float impulse[impulse_length];
    printf("Enter the elements of the second array: ");
    for (i = 0; i < impulse_length; i++) {
        scanf("%f", &impulse[i]);
    }

    float result[signal_length + impulse_length - 1];
    convolve(signal, impulse, signal_length, impulse_length, result);

    printf("The convolution of the two arrays is: ");
    for (i = 0; i < signal_length + impulse_length - 1; i++) {
        printf("%0.3f ", result[i]);
    }
    printf("\n");

    return 0;
}
