% Función que permite obtener la raiz de un polinomio a través del
% algoritmo de Newton Raphson de manera recursiva
% Entradas: Polinomio, limite de iteraciones, error de la raiz, valor inicial 
% Salida: Raiz del polinomio
function [root] = newton_raphson(poly, iter, error, initial)

% Se define el valor inicial como posible raiz
root = initial;

% Se obtiene la derivada del polinomio
derivate = polyder(poly);

% Se obtiene la evaluación del polinomio en el valor inicial
current = polyval(poly, initial);

% Se sigue el proceso mientras no se llegue al limite de iteraciones
if(iter > 0)
    
    % Se sigue el proceso si la evaluación actual del polinomio no cumple
    % con el error solicitado
    if(abs(current) > error)
        
        % Se obtiene la evaluación de la derivada del polinomio en el valor
        % inicial
        derivate_current = polyval(derivate, initial);

        % Se calcula el valor inicial de la siguiente recursión
        new_value = initial - (current / derivate_current);
        
        % Se hace el llamado recursivo con el nuevo valor e iteracion - 1
        root = newton_raphson(poly, (iter - 1), error, new_value);

    % Si la evaluación del polinomio cumple con el error solicitado se
    % informa a través de la consola
    else
        fprintf("La raiz del polinomio es %d.\n", initial);
    end

% Si se llega al limite de iteraciones sin llegar a una raiz que cumpla con
% el error solicitado se informa por consola y se entrega la ultima raiz
% calculada
else
    fprintf("Se han concluido las iteraciones sin encontrar una raiz que cumpla con el error.\n");
    fprintf("El ultimo valor encontrado ha sido %d.\n", initial);    
end

end
