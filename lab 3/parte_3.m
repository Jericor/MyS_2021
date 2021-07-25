% Se define el modelo de estados del sistema de la parte 2 para luego ser
% discretizado

% || Definición del modelo de estados || %
% Se definen los parámetros del sistema
a_1 = 2;
a_2 = 4;
r_i1 = 0.25;
r_i2 = 0.0625;
r_s1 = 0.1;
r_s2 = 0.1;

% Se definen los valores de la matriz A
A11 = -((r_i1 * r_s1 + r_i1 * r_i2 + r_i2 * r_s1)/(r_i1 * r_i2 * r_s1 * a_1));
A12 = (r_i1 + r_i2)/(r_i1 * r_i2 * a_1);
A21 = (r_i1 + r_i2)/(r_i1 * r_i2 * a_2);
A22 = -((r_i2 * r_s2 + r_i1 * r_i2 + r_i1 * r_s2)/(r_i1 * r_i2 * r_s2 * a_2));

% Se definen las matrices
% Tomar en cuenta que la variable de salida es la altura del liquido en los
% contenedores
matrix2_A = [A11, A12; A21, A22];
matrix2_B = [(1/a_1); (1/a_2)];
matrix2_C = [1, 0; 0, 1];
matrix2_D = [0; 0];

% Se define el modelo del sistema
M = ss(matrix2_A, matrix2_B, matrix2_C, matrix2_D);

% || Fin de la definición del modelo de estados || %

% Se discretiza el sistema anterior 
% Con un bloqueador de orden cero
Mz_1 = c2d(M , 0.001, 'zoh');
Mz_2 = c2d(M , 0.1, 'zoh');
Mz_3 = c2d(M , 2, 'zoh');

% Se grafica el sistema discretizado
figure(4)
impulse(Mz_1, 'r-*');
hold on
impulse(Mz_2, 'b:o');
impulse(Mz_3, 'g--x');
hold off
title("Discretización con Zero-order hold");
legend('T=0.001','T=0.1','T=2')

% Se discretiza el sistema anterior 
% Con un bloqueador de orden uno
Mf_1 = c2d(M , 0.001, 'foh');
Mf_2 = c2d(M , 0.1, 'foh');
Mf_3 = c2d(M , 2, 'foh');

% Se grafica el sistema discretizado
figure(5)
impulse(Mf_1, 'r-*');
hold on
impulse(Mf_2, 'b:o');
impulse(Mf_3, 'g--x');
hold off
title("Discretización con First-order hold");
legend('T=0.001','T=0.1','T=2')