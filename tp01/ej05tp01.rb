# Escribí una función llamada contar que reciba como parámetro dos string y que retorne la
# cantidad de veces que aparece el segundo string en el primero, sin importar mayúsculas y
# minúsculas.

def contar(str, word)
	str.downcase.scan(word.downcase).size 
end

puts contar("La casa de la esquina tiene la puerta roja y la de ventana blanca.", "De")