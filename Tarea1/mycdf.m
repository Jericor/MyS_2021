%Tarea 1 - Modelación y Simulación - 1 - 2021

%) Simulando la CDF: Hemos visto en clases que la cdf de una v.a.c es FX(x) = P(X ≤
%x), pero en el caso de la distribuci´on normal, la cdf no tiene una expresi´on cerrada. Luego,
%queremos estimar la cdf usando una aproximaci´on.
%Escriba un programa en Matlab [x, F] = mycdf(distname, a, b, mean, sigma) que
%entrege dos vectores x y F, tal que F(x) sea una aproximaci´on a la cdf de una ditribuci´on, en
%el intervalo [a, b]. En este caso, solo permitiremos dos distribuciones: ’Uniform’ y ’Normal’
%Ejemplos:

%[x, F] = mycdf(’Uniform’, -0.5, 0.5, 0, 0);
%plot(x, F);
%[x, F] = mycdf(’Normal, -4, 4, 0, 1);
%plot(x, F);
%Para escribir esta funci´on, considere lo siguiente
%(a) Utilice la funci´on random() de Matlab para generar valores de la variable aleatoria con
%la distribuci´on elegida. Es decir, random() muestrea la pdf.
%(b) Discretize apropiadamente el intervalo [a, b], que es el intervalo donde la cdf debe estar
%definida
%(c) La idea es que genere muchas muestras x de la distribuci´on (pdf), y con ellas acumule
%repetidamente la frecuencia tal que F = P(X ≤ x).

function[x, F] = mycdf(distname, a, b, mean, sigma)

if distname == 'U'
    x = linspace(a,b,500);
    F = uniform(x);
    
elseif distname == 'N'
    
    x = linspace(a,b,500);
    mean = rand;
    sigma = rand;
    F = normal(x,mean,sigma);
else
    disp('Mal escrito')
end


end
 

