# Escribí un método que dado un número variable de parámetros que pueden ser de cualquier tipo,
#	imprima en pantalla la cantidad de caracteres que tiene su representación como String y la
# representación que se utilizó para contarla.

def longitud (*str)
	#Cuidado con poner el * o no funcionará correctamente el programa, arrojando un error (por esa boudez, estuve mucho tiempo colgado)
	str.each { |s| puts "#{s.to_s} --> #{s.to_s.size}"}
end

longitud(9,Time.now,'Hola',{un: 'hash'},:ruby)
