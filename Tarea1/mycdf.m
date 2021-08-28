%Tarea 1 - Modelación y Simulación - 1 -2021

%Integrantes: Juan Arredondo - Flavio Ramos

%) Simulando la CDF: Hemos visto en clases que la cdf de una v.a.c es FX(x) = P(X ≤
%x), pero en el caso de la distribución normal, la cdf no tiene una expresión cerrada. Luego,
%queremos estimar la cdf usando una aproximación.
%Escriba un programa en Matlab [x, F] = mycdf(distname, a, b, mean, sigma) que
%entrege dos vectores x y F, tal que F(x) sea una aproximaci´on a la cdf de una ditribución, en
%el intervalo [a, b]. En este caso, solo permitiremos dos distribuciones: ’Uniform’ y ’Normal’

%Para escribir esta función, considere lo siguiente
%(a) Utilice la funci´on random() de Matlab para generar valores de la variable aleatoria con
%la distribución elegida. Es decir, random() muestrea la pdf.
%(b) Discretize apropiadamente el intervalo [a, b], que es el intervalo donde la cdf debe estar
%definida
%(c) La idea es que genere muchas muestras x de la distribuci´on (pdf), y con ellas acumule
%repetidamente la frecuencia tal que F = P(X ≤ x).

function[x, F] = mycdf(distname, a, b, mean, sigma)

if distname == 'U'
    [x, F] = uniform(a,b); %Se llama a la distribución uniforme cdf
    plot(x,F)
    
elseif distname == 'N'
    [x, F]= normal(a,b,mean,sigma); %Se llama a la distribución uniforme cdf
    plot(x,F)
else
    disp('Mal escrito')
end

end
 

