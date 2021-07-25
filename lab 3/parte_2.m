% Se desarrolla un modelo de estados a partir de un sistema de vasos
% comunicantes.

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

% Se crean los gráficos
figure(2)
step(M, 'r--*')
title("Respuesta de las salidas del sistema (altura del líquido en los contenedores)");
hold on
impulse(M, 'b:o')
hold off
legend('step','impulse')

figure(3)
t = linspace (0, 12*pi ,5000);
u = 100* sin(t/4);
u(u<0) = 0.;
lsim(M,u,t, 'g--x')
title("Respuesta de las salidas del sistema (altura del líquido en los contenedores)");
legend('lsim')
