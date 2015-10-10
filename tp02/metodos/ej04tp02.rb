# Escribí un método que dado un número variable de parámetros que pueden ser de cualquier tipo,
#	imprima en pantalla la cantidad de caracteres que tiene su representación como String y la
# representación que se utilizó para contarla.

def longitud (*str)
	str.each { |s| puts "#{s.to_s} --> #{s.to_s.size}"}
end

longitud(9,Time.now,'Hola',{un: 'hash'},:ruby, :unBruno)
