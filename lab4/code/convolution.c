#include <stdio.h>
#include <math.h>

#define ARRAY_LENGTH 7
#define IMPULSE_LENGTH 5
#define Q_FORMAT pow(2, 12)

void conv_taker(float *signal, float *impulse, float *conv);
float meanSquareError(float *array1, float *array2);
void absoluteDifferenceSquare(float *array1, float *array2, float *abs_diff);
void floatToFixed(float *input_array, float *fixed_array);

int main() {
    float input_x[ARRAY_LENGTH] = {0.3426, 3.5784, 2.7694, -1.3499, 3.0349, 0.7254, -0.0631};
    float fixed_input_x[ARRAY_LENGTH];
    float h_array[IMPULSE_LENGTH] = {0.7147, -0.2050, -0.1241, 1.4897, 1.4090};
    float fixed_h_array[IMPULSE_LENGTH];
    float fixed_conv[ARRAY_LENGTH + IMPULSE_LENGTH - 1];
    float float_conv[ARRAY_LENGTH + IMPULSE_LENGTH - 1];
    float float_fix_diff[ARRAY_LENGTH + IMPULSE_LENGTH - 1];
    float float_fix_mse;

    floatToFixed(input_x, fixed_input_x);
    floatToFixed(h_array, fixed_h_array);

    conv_taker(fixed_input_x, fixed_h_array, fixed_conv);
    conv_taker(input_x, h_array, float_conv);

    for (int i = 0; i < ARRAY_LENGTH + IMPULSE_LENGTH - 1; i++) {
        fixed_conv[i] /= pow(Q_FORMAT, 2);
    }

    printf("fixed convolution:\n");
    for (int i = 0; i < ARRAY_LENGTH + IMPULSE_LENGTH - 1; i++) {
        printf("%f ", fixed_conv[i]);
    }
    printf("\n");

    printf("float convolution:\n");
    for (int i = 0; i < ARRAY_LENGTH + IMPULSE_LENGTH - 1; i++) {
        printf("%f ", float_conv[i]);
    }
    printf("\n");

    absoluteDifferenceSquare(fixed_conv, float_conv, float_fix_diff);

    printf("absolute error Square:\n");
    for (int i = 0; i < ARRAY_LENGTH + IMPULSE_LENGTH - 1; i++) {
        printf("%e ", float_fix_diff[i]);
    }
    printf("\n");

    float_fix_mse = meanSquareError(fixed_conv, float_conv);
    printf("mean square: %e\n", float_fix_mse);

    return 0;
}

void conv_taker(float *signal, float *impulse, float *conv) {
    int L = ARRAY_LENGTH + IMPULSE_LENGTH - 1;
    for (int n = 0; n < L; n++) {
        for (int k = 0; k < IMPULSE_LENGTH; k++) {
            int m = n - k;
            if (m >= 0 && m < ARRAY_LENGTH) {
                conv[n] += signal[m] * impulse[k];
            }
        }
    }
}

float meanSquareError(float *array1, float *array2) {
    float mse = 0;
    for (int i = 0; i < ARRAY_LENGTH + IMPULSE_LENGTH - 1; i++) {
        mse += pow(array1[i] - array2[i], 2);
    }
    mse /= ARRAY_LENGTH + IMPULSE_LENGTH - 1;
    return mse;
}

void absoluteDifferenceSquare(float *array1, float *array2, float *abs_diff) {
    for (int i = 0; i < ARRAY_LENGTH + IMPULSE_LENGTH - 1; i++) {
        abs_diff[i] = fabs(array1[i] - array2[i]) * fabs(array1[i] - array2[i]);
    }
}

void floatToFixed(float *input_array, float *fixed_array) {
    for (int i = 0; i < ARRAY_LENGTH; i++) {
        fixed_array[i] = (int)(input_array[i] * Q_FORMAT);
    }
}
