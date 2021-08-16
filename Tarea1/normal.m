%definimos nuestra distribución normal
function[F] = normal(x)

pdf = random('Normal', 0,1);
antecesor = min(x);
F = [];
cdf = 0;
for X = x
    
    if X - antecesor ~= 0
    cdf = cdf +pdf;
    F = [F cdf];
    end
    
    antecesor = X;
    pdf = random('Normal', 0,1);
end
pdf = random('Normal', 0,1);
cdf = cdf +pdf;
F = [F cdf];
end


