#include <stdio.h>
#include <math.h>

int main()
{
    float float_num1 = 3.1425;
    float float_num2 = 4.2357;
    float float_result_add = float_num1 + float_num2;

    int q_format = pow(2, 12);
    int fixed_num1 = (int)(float_num1 * q_format);
    int fixed_num2 = (int)(float_num2 * q_format);

    float fixed_result_add = floor(fixed_num1 + fixed_num2) / q_format;

    printf("Floating-point addition result: %f\n", float_result_add);
    printf("Fixed-point addition result: %f\n", fixed_result_add);
    printf("Addition Error: %f\n", fabs(float_result_add - fixed_result_add));

    float fixed_result_multiply = floor(fixed_num1 * fixed_num2) / pow(q_format, 2);

    float float_result_multiply = float_num1 * float_num2;
    printf("Floating-point multiplication result: %f\n", float_result_multiply);
    printf("Fixed-point multiplication result: %f\n", fixed_result_multiply);
    printf("Multiplication Error: %f\n", fabs(float_result_multiply - fixed_result_multiply));

    return 0;
}
