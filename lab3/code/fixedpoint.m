% Fixed point arithmetic

float_num1 = 3.1425;
float_num2 = 4.2357;
float_sum = float_num1 + float_num2;
float_prod = float_num1 * float_num2;

q_format = 2^12;
fixed_num1 = fix(float_num1 * q_format);
fixed_num2 = fix(float_num2 * q_format);

fixed_sum = (fixed_num1  + fixed_num2 )/ q_format;
fixed_prod = (fixed_num1  * fixed_num2 )/ q_format^2;


disp('Floating-point sum:');
disp(float_sum);

disp('Fixed-point sum:');
disp(fixed_sum);

error_sum = abs(float_sum - fixed_sum);
disp(['Error sum: ', num2str(error_sum)]);  

disp('Floating-point prod:');
disp(float_prod);

disp('Fixed-point prod:');
disp(fixed_prod);

error_prod = abs(float_prod - fixed_prod);
disp(['Error Prod: ', num2str(error_prod)]);  