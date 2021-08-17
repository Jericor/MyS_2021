function [f, c, d] = sumuniforme(n, a, b)

x = linspace(a,b,100);
pdff = pdf('Uniform',x,a,b);

acum = pdff;
for i = 2:n
    acum = conv(acum, pdff, 'full').*0.01;
    %acum = [acum 0];
end

c = a;
d = length(acum)*0.01;
f = acum;

end