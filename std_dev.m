% Función que permite obtener la desviación estandar de un arreglo de datos
% Entrada: Arreglo de datos
% Salida: Desviación Estandar
function [deviation] = std_dev(array)

% Se obtiene la cantidad de datos del arreglo
n = length(array);

% Se obtiene la media de los datos del arreglo
poly_mean = (sum(array) / n);

% Se obtiene la suma de las desviaciones cuadradas
square_sum = sum( abs( (array - poly_mean) ).^ 2 );

% Se calcula la desviación estándar
deviation = sqrt(square_sum / n);
end