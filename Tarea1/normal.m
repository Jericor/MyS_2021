%Tarea 1 - Modelación y Simulación - 1 -2021

%Integrantes: Juan Arredondo - Flavio Ramos

%definimos nuestra distribución normal
function[x, F] = normal(a,b,mean,sigma)

% Se crean 1000 puntos por cada unidad del intervalo
sample = (b-a) * 1000;
x = linspace(a,b,sample);

% Se crea el arreglo de variables aleatorias con distribución normal
vac_normal = random('normal', mean, sigma, [1 sample 1 1]);
vac_normal = sort(vac_normal);

% Se obtiene la probabilidad de ocurrencia de cada vac
probs = (1 / (sigma * sqrt(2 * pi))) * exp((-1/2) * ((vac_normal - mean) / sigma).^2); 

% Se definen los parámetros para la pdf
pdf = [0];
value = a + 0.001;
frequency = 0;
i = 1;

% Pequeño cambio, se deja solo una probabilidad
% En lugar de sumarlas
while value < b
    % Si ya se revisaron todas las vac se rellena con 0
    if i == sample + 1
        pdf = [pdf frequency];
        value = value + 0.001;
        frequency = 0;
    % Si quedan vac
    else
        % Si la vac es menor al valor actual (la vac está dentro del subintervalo)
        if vac_normal(i) < value
            frequency = probs(i); 
            i= i + 1;
        % Si la vac es mayor que el valor actual
        else
            % Se añade la frecuencia a la pdf y se restaura a 0
            pdf = [pdf frequency];
            value = value + 0.001;
        end
    end
end

pdf = pdf(1:sample);

% Se crea la aproximación de la cdf
F = [];
acum = 0;
for i = 1:sample
    acum = acum + pdf(i)*0.001;
    F = [F acum];
end

end


