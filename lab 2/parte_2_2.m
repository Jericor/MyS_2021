% Se definen las seis funciones del diagrama
s = tf ('s');
f_1 = 4*s / (10*s^2 + 4);
f_2 = 3 / (6*s + 16);
f_3 =(4*s + 10) / (4*s^3 + 9*s^2 + 5*s);
f_4 = 1 / (7*s + 10);
f_5 = (8*s + 8) / (s^3 + 2*s^2 + 3*s);
f_6 = (3*s + 2) / (5*s^2 + 7*s + 10);

% Se define el lazo cerrado con retorno positivo 
% De la función f_3
H_1 = feedback(f_3, 1, +1);

% Se define la conexión en paralelo
% De las funciones f_4 y f_5
H_2 = f_4 + f_5;

% Se define la conexión en serie de la parte inferior del diagrama
% Con las funciones H_1, H_2 y f_6
H_low = H_1 * H_2 * f_6;

% Se define la conexión en paralelo final
% Con las funciones f_1, f_2 y H_low
H_final = f_1 + f_2 + H_low;

% Se grafica la respuesta al escalón del diagrama de bloque
step(H_final);


