# Escribí una función llamada contar que reciba como parámetro dos string y que retorne la
# cantidad de veces que aparece el segundo string en el primero, sin importar mayúsculas y
# minúsculas.

def contar(str, word)
	if (str.size > 0 && word.size > 0)
		str.downcase.scan(word.downcase).size
	else
		0
	end
end

puts contar("La casa de la esquina tiene la puerta roja y la de ventana blanca.", "De")
