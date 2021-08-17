%function[x, F] = cdf(distname, a, b, mean, sigma)

% Definición de parámetros para distribución normal
a = -4;
b = 4;
mean = 0;
sigma= 1;

% Se crean 1000 puntos por cada unidad del intervalo
sample = (b-a) * 1000;
x = linspace(a,b,sample);

% Se crea el arreglo de variables aleatorias con distribución normal
vac_normal = random('normal', mean, sigma, [1 sample 1 1]);
vac_normal = sort(vac_normal);

% Se obtiene la probabilidad de ocurrencia de cada vac
probs = (1 / (sigma * sqrt(2 * pi))) * exp((-1/2) * ((vac_normal - mean) / sigma).^2); 

% Se definen los parámetros para la pdf
pdf = [];
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

% Se crea la aproximación de la cdf
F = [];
acum = 0;
for i = 1:sample
    % El valor de la pdf se multiplica por 0.0005 en lugar de 0.001
    % Con el objetivo de amortiguar el efecto de frecuencias
    % Que se disparan en el eje Y
    acum = acum + pdf(i)*0.001;
    F = [F acum];
end

% Definición de parámetros para distribución normal
a = -0.5;
b = 0.5;

% Se crean 100 puntos por cada unidad del intervalo
sample = (b-a) * 100;
x = linspace(a,b,sample);

% Se crean las variables aleatorias con distribución uniforme
vac_uniform = random('uniform', a, b, [1 sample 1 1]);

% Se crea la pdf de la distribución uniforme
pdf = repelem((1 / (b - a)), sample);

% Se aproxima la cdf de la distribución uniforme
F = [];
value = 0;
for i = 1:sample
    value = value + pdf(i)*0.01;
    F = [F value];
end

