% No se que pasa aqui :| 

%function [f, c, d] = sumuniforme(n, a, b)
n = 2;
a = 0;
b = 10;

x = linspace(a,b,100);
pdff = pdf('Uniform',x,a,b);

acum = pdff;
for i = 2:n
    acum = conv(acum, pdff, 'full');
    acum = [acum 0];
end
x = linspace(a,b,length(acum));

plot(x,acum)

