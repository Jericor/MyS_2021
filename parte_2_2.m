poly = input("Ingrese el polinomio: ");

iter = input("Ingrese el limite de iteraciones: ");

error = input("Ingrese el error máximo de la raiz a encontrar: ");

initial = input("Ingrese el valor inicial a utilizar: ");

root = newton_raphson(poly, iter, error, initial);