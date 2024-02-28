#include <stdio.h>
#include <math.h>

#define ARRAY_LENGTH 7
#define IMPULSE_LENGTH 5
#define Q_FORMAT pow(2, 12)

void correlation(float *signal, float *impulse, float *corr);
float meanSquareError(float *array1, float *array2);
void absoluteDifferenceSquare(float *array1, float *array2, float *abs_diff);
void floatToFixed(float *input_array, float *fixed_array);

int main() {
    float input_x[ARRAY_LENGTH] = {0.3426, 3.5784, 2.7694, -1.3499, 3.0349, 0.7254, -0.0631};
    float fixed_input_x[ARRAY_LENGTH];
    float h_array[IMPULSE_LENGTH] = {0.7147, -0.2050, -0.1241, 1.4897, 1.4090};
    float fixed_h_array[IMPULSE_LENGTH];
    float fixed_corr[ARRAY_LENGTH + IMPULSE_LENGTH - 1];
    float float_corr[ARRAY_LENGTH + IMPULSE_LENGTH - 1];
    float float_fix_diff[ARRAY_LENGTH + IMPULSE_LENGTH - 1];
    float float_fix_mse;

    floatToFixed(input_x, fixed_input_x);
    floatToFixed(h_array, fixed_h_array);

    correlation(fixed_input_x, fixed_h_array, fixed_corr);
    correlation(input_x, h_array, float_corr);

    for (int i = 0; i < ARRAY_LENGTH + IMPULSE_LENGTH - 1; i++) {
        fixed_corr[i] /= pow(Q_FORMAT, 2);
    }

    printf("fixed correlation:\n");
    for (int i = 0; i < ARRAY_LENGTH + IMPULSE_LENGTH - 1; i++) {
        printf("%f ", fixed_corr[i]);
    }
    printf("\n");

    printf("float correlation:\n");
    for (int i = 0; i < ARRAY_LENGTH + IMPULSE_LENGTH - 1; i++) {
        printf("%f ", float_corr[i]);
    }
    printf("\n");

    absoluteDifferenceSquare(fixed_corr, float_corr, float_fix_diff);

    printf("absolute error Square:\n");
    for (int i = 0; i < ARRAY_LENGTH + IMPULSE_LENGTH - 1; i++) {
        printf("%e ", float_fix_diff[i]);
    }
    printf("\n");

    float_fix_mse = meanSquareError(fixed_corr, float_corr);
    printf("mean square: %e\n", float_fix_mse);

    return 0;
}

void correlation(float *signal, float *impulse, float *corr) {
    int L = ARRAY_LENGTH + IMPULSE_LENGTH - 1;
    for (int n = 0; n < L; n++) {
        for (int k = 0; k < IMPULSE_LENGTH; k++) {
            int m = n - k ;
            if (m >= 0 && m < ARRAY_LENGTH) {
                corr[n] += signal[m] * impulse[IMPULSE_LENGTH - 1 - k];
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
