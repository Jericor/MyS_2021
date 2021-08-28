%Tarea 1 - Modelación y Simulación - 1 -2021

%Integrantes: Juan Arredondo - Flavio Ramos

% 3. (2.0) Sobre el Teorema del Límite Central: Este teorema dice que la distribución de la
% suma de muchas (infinitas) v.a.c con una distribución f(x) se aproxima a una distribución
% normal. Esto lo podemos visualizar aproximando la pdf con un vector discreto con alta
% resolutión.
% Escriba un función en Matlab [f, c, d] = sumuniforme(n, a, b) que entregue la pdf de
% la suma de n v.a.c continuas uniformes definidas en el intervalo [a, b]. La función retorna el
% vector f con los valores de la pdf, y el intervalo [c, d] sobre el cual esta pdf está definida.
% Para escribir esta función, considere lo siguiente
% (a) Utilize la función conv() de Matlab para realizar la convolución de dos vectores.
% (b) Use opción ’full’ en conv()
% DIINF-USACH/10-08-2021 Prof: Fernando R. Rannou 1
% (c) Para calcular la convolución de n v.a., implemente su función como una convolución
% entre la función uniforme en [a, b] y el resultado de la convolución de la convolución n−1
% (d) Note que el intervalo va creciendo cada vez que se aplica convolución ’full’
% (e) Para n = 2, 8, 16, 32, plotee su aproximación, y la distribución normal a la que se aproxima.


function [f, c, d] = sumuniforme(n, a, b)

% Se crean los subintervalos
x = linspace(a,b,100);
% Se crea la distribución uniforme
pdff = pdf('Uniform',x,a,b);

% Se calculan las convoluciones entre n-1 y n
acum = pdff;
for i = 2:n
    acum = conv(acum, pdff, 'full').*0.01;
end

% Se definen los nuevos intervalos de la funcion
c = a;
d = length(acum)*0.01;
f = acum;

end