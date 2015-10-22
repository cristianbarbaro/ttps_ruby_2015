# Implementá un método que reciba como parámetro un arreglo de números, los ordene y devuelva el
# resultado.
#
#
def ordenar_arreglo (array)
	if array.is_a?(Array)
		array.sort
	else
		raise TypeError
	end
end

puts ordenar_arreglo [1, 4, 6, 2, 3, 0, 10]
