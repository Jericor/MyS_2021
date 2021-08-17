% No se que pasa aqui :| 

%function [f, c, d] = sumuniforme(n, a, b)
n = 2;
a = 0;
b = 1;

pdf = 1/(b-a);

acum = pdf;
for i = 2:n
    acum = conv(acum, pdf, 'full');
end

