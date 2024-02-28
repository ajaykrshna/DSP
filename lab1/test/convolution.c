#include <stdio.h>
#include <convolution.h>


int main() {
    int signal_length, impulse_length, i;
    printf("Enter the size of the first array: ");
    scanf("%d", &signal_length);
    int signal[signal_length];
    printf("Enter the elements of the first array: ");
    for (i = 0; i < signal_length; i++) {
        scanf("%d", &signal[i]);
    }

    printf("Enter the size of the second array: ");
    scanf("%d", &impulse_length);
    int impulse[impulse_length];
    printf("Enter the elements of the second array: ");
    for (i = 0; i < impulse_length; i++) {
        scanf("%d", &impulse[i]);
    }

    int result[signal_length + impulse_length - 1];
    convolve(signal, impulse, signal_length, impulse_length, result);

    printf("The convolution of the two arrays is: ");
    for (i = 0; i < signal_length + impulse_length - 1; i++) {
        printf("%d ", result[i]);
    }
    printf("\n");

    return 0;
}
