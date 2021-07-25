% Función que permite obtener la función de transferencia del sistema a
% partir del modelo de estados
% Entrada: 4 matrices del modelo de estados
% Salida: función de transferencia del sistema
function [H] = mab(matrix_A, matrix_B, matrix_C, matrix_D)
s = tf ('s');
H = matrix_C * inv(s * eye(2) - matrix_A) * matrix_B - matrix_D;
end