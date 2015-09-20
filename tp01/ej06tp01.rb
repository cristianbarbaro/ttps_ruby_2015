def contar_palabra(str, word)
	#scan devuelve las palabras dentro de un array, luego cuento la cantidad de veces que aparece mi palabra dentro del mismo:  
	str.downcase.scan(/\w+/).count(word.downcase)
end

puts contar_palabra("La casa de la esquina tiene la puerta roja y la de ventana blanca.", "la")