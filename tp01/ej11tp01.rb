# Escribí una función llamada rot13 que encripte un string recibido como parámetro utilizando
# el algoritmo ROT13.

def rot13 str
	return str.tr('N-ZA-Mn-za-m', 'A-MN-Za-mn-z')
end

puts rot13 ("¡Bienvenidos a la cursada 2015 de TTPS Opción Ruby!")