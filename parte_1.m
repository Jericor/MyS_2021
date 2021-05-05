% Puntos en X
x_1 = 0: .01: 15*pi;
% Funcion de logaritmo en base X
log_x = @(y,x) log(y)/log(x);

% Valores en Y de la primera funcion
a_x = 6*log_x(5*x_1 + 15, 4)- log_x(2*x_1, 2);
% Grafico de la funcion a
figure();
plot(x_1, a_x, 'r *');
title('a(x) = 6log_4(5x + 15)- log_1(2x)');
xlabel('x');
ylabel('a(x)');

% Valores en Y de la segunda funcion
b_x = sin(6*log10(2*x_1+9)) + cos(2*log(x_1 + 16));
% Grafico de la funcion b
figure();
plot(x_1, b_x, 'g +');
title('b(x) = sin(6log_{10}(2x+9)) + cos(2ln(x + 16))');
xlabel('x');
ylabel('b(x)');

% Grafico de ambas funciones
figure()
plot(x_1, a_x, 'r *', x_1, b_x, 'g +');
title('Funciones a(x) y b(x)');
xlabel('x');
ylabel('y');
legend({'a(x) = 6log_4(5x + 15)- log_1(2x)','b(x) = sin(6log_{10}(2x+9)) + cos(2ln(x + 16))'},'Location','southeast');

% Valores de X
x_2 = -10: .05: 10;

% Tercera funcion
c_x = 2*exp(2*x_2 + 3);
% Grafico funcion c
figure();
plot(x_2, c_x, 'b -');
title('2e^{(2x + 3)}');
xlabel('x');
ylabel('c(x)');
grid on;

% Grafico logaritmico funcion c
figure();
semilogy(x_2, c_x, 'b -');
title('2e^{(2x + 3)}');
xlabel('x');
ylabel('c(x)');
grid on;