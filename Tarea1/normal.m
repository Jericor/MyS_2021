%definimos nuestra distribución normal
function[y] = normal(x, mu, sigma)

y = 1/(sigma*sqrt(2*pi))*exp(-0.5*((x-mu)/sigma).^2);
end


