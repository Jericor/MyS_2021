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

%Se llama a la función mycdf
%Internamente al elegir el tipo de distribución, asigna la media y sigma
%correspondiente, así que no importa que se ingrese por parámetro.
[x, F] = mycdf(str, a, b, 0, 0);


