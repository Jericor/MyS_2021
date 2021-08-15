%Main
%Primera parte
disp('Bienvenido a Tarea1 Modelación y Simulación');
disp('Primera parte del programa')

prompt = 'Elija el tipo de distribución? Uniforme/Normal [U/N]: ';
str = input(prompt,'s');

prompt = 'Ingrese el valor mínimo (a) ';
a = input(prompt);
prompt = 'Ingrese el valor máximo (b) ';
b = input(prompt);
[x, F] = mycdf(str, a, b, 0, 1);
plot(x,F)


%Segunda parte


