%Tarea 1 - Modelación y Simulación - 1 -2021

%Integrantes: Juan Arredondo - Flavio Ramos

%definimos nuestra distribución uniforme
function[x, F] = uniform(a, b)

% Se crean 100 puntos por cada unidad del intervalo
sample = (b-a) * 100;
x = linspace(a,b,sample);

% Se crea la pdf de la distribución uniforme
pdf = repelem((1 / (b - a)), sample);

% Se aproxima la cdf de la distribución uniforme
F = [];
value = 0;
for i = 1:sample
    value = value + pdf(i)*0.01;
    F = [F value];
end

end
