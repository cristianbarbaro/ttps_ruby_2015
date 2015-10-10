# Suponé que se te da el método que implementaste en el ejercicio anterior para que
# lo uses a fin de ordenar un arreglo de números que te son provistos en forma de arreglo.
# ¿Cómo podrías invocar el método?

def ordenar (*elements)
	elements.sort
end

entrada = [1, 4, 6, 2, 3, 5, 0, 10, 9]

puts ordenar(*entrada)
