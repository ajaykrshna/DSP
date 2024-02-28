#include <stdio.h>

void upsampleSignal(float input[], int inputSize, float output[], int n)
{
    int outputSize = inputSize * n;
    int index = 0;

    for (int i = 0; i < inputSize; i++)
    {
        output[index++] = input[i];
        for (int j = 1; j < n; j++)
        {
            output[index++] = 0.0;
        }
    }
}

int main()
{
    int inputSize = 20;
    float input[20] = {0.5377, 1.8339, -2.2588, 0.8622, 0.3188, -1.3077, -0.4336, 0.3426, 3.5784, 2.7694, -1.3499, 3.0349, 0.7254, -0.0631, 0.7147, -0.2050, -0.1241, 1.4897, 1.4090, 1.4172};
    int upsampleSignal2 = 2;
    int upsampleSignal3 = 3;
    int outputSize2 = inputSize * upsampleSignal2;
    int outputSize3 = inputSize * upsampleSignal3;
    float output2[outputSize2];
    float output3[outputSize3];

    upsampleSignal(input, inputSize, output2, upsampleSignal2);
    upsampleSignal(input, inputSize, output3, upsampleSignal3);

    printf("Input Signal: ");
    for (int i = 0; i < inputSize; i++)
    {
        printf("%f ", input[i]);
    }

    printf("\nUpsampled Signal by 2: ");
    for (int i = 0; i < outputSize2; i++)
    {
        printf("%f ", output2[i]);
    }

    printf("\nUpsampled Signal by 3: ");
    for (int i = 0; i < outputSize3; i++)
    {
        printf("%f ", output3[i]);
    }

    return 0;
}
