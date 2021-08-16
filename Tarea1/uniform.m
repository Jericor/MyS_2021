%definimos nuestra distribución uniforme
function[F] = uniform(x, a, b)
pdf = random('Uniform', a,b); %Se adquiere valor de la distribución uniforme
antecesor = min(x);
F = [];
cdf = 0;
for X = x
    
    if X - antecesor ~= 0
    cdf = cdf +pdf;
    F = [F cdf];
    end
    
    antecesor = X;
    pdf = random('Uniform', a,b);
end
pdf = random('Uniform', a,b);
cdf = cdf +pdf;
F = [F cdf]; %Se retorna arreglo con cdf
end
