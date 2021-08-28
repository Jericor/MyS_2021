%Tarea 1 - Modelación y Simulación - 1 -2021

%Integrantes: Juan Arredondo - Flavio Ramos

% Parte 3 
% Main

% Suma de 2 v.a.c. Uniforme U[0,1]
[f_1, c_1, d_1] = sumuniforme(2, 0, 1);
x_1 = linspace(c_1,d_1,length(f_1));
figure(1)
plot(x_1,f_1);
title("n=2");

% Suma de 8 v.a.c. Uniforme U[0,1]
[f_2, c_2, d_2] = sumuniforme(8, 0, 1);
x_2 = linspace(c_2,d_2,length(f_2));
figure(2)
plot(x_2,f_2);
title("n=8");

% Suma de 16 v.a.c. Uniforme U[0,1]
[f_3, c_3, d_3] = sumuniforme(16, 0, 1);
x_3 = linspace(c_3,d_3,length(f_3));
figure(3)
plot(x_3,f_3);
title("n=16");

% Suma de 32 v.a.c. Uniforme U[0,1]
[f_4, c_4, d_4] = sumuniforme(32, 0, 1);
x_4 = linspace(c_4,d_4,length(f_4));
figure(4)
plot(x_4,f_4);
title("n=32");
