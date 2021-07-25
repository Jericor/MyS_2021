% Se desarrolla el modelo de estados a partir de un diagrama de bloques

% Se ingresan los seis valores numéricos por consola
a = input("Ingresar el valor de A: ");
b = input("Ingresar el valor de B: ");
c = input("Ingresar el valor de C: ");
d = input("Ingresar el valor de D: ");
e = input("Ingresar el valor de E: ");
f = input("Ingresar el valor de F: ");

% Se definen las funciones de transferencia intermedia y el ciclo de
% realimentación
s = tf ('s');
f1 = a/(b*s - c);
f2 = d/(e*s - f);
loop = feedback(f1, f2);

% Se obtiene el modelo de estados
[matrix_A, matrix_B, matrix_C, matrix_D] = bam(a, b, c, d, e, f);

% Se obtiene la función de transferencia
[H] = mab(matrix_A, matrix_B, matrix_C, matrix_D);

loop_plot = step(loop);
H_plot = step(H);
% Se grafica la respuesta al impulso de ambas funciones de transferencia
figure(1)
plot(loop_plot, ':','LineWidth',2)
title("Comparación de las funciones de transferencias del diagrama de bloques.");
hold on
plot(H_plot, '--','LineWidth',2)
hold off
legend('feedback','mab')