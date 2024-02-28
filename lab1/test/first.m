clc
clear
close all

array1 = [1 2 3 4 5 6 7 8 9 10];
array2 = [1 3 1 2 1 7 8 9 10 11];

array3 = add_arrays(array1, array2);

function [array3] = add_arrays(array1, array2)
    array3 = array1 + array2;
end
