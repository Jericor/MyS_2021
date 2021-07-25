% Función que permite obtener las matrices del modelo de estados del
% sistema denotado en el laboratorio
% Entrada: 6 valores numéricos
% Salida: 4 matrices del modelo de estados
function [matrix_A, matrix_B, matrix_C, matrix_D] = bam(A,B,C,D,E,F)
matrix_A = [C/B, -A/B; D/E, F/E];
matrix_B = [A/B; 0];
matrix_C = [1, 0];
matrix_D = [0];
end