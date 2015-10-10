# Modificá el método anterior para que en lugar de recibir un arreglo como único parámetro, reciba
# todos los números como parámetros separados.
#

def ordenar (*elements)
	elements.sort
end


puts ordenar(1, 4, 6, 2, 3, 5, 0, 10, 9)
