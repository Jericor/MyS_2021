%definimos nuestra distribución uniforme
function[y] = uniform(x)
antecesor = min(x);
y = [];
for X = x
    
    if X - antecesor ~= 0
    result = 1/(X-antecesor);
    y = [y round(result, 5)];
    end
    
    antecesor = X;
  
end
result = 1/(max(x)-antecesor);
y = [y round(result, 5)];
end
