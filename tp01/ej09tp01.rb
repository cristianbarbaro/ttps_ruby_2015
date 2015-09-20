# Escribí una función que dado un arreglo que contenga varios string cualesquiera, retorne un
# nuevo arreglo donde cada elemento es la longitud del string que se encuentra en la misma
# posición del arreglo recibido como parámetro.


def elements_size arr
	arr.collect { |s| s.size}
end

puts elements_size ['TTPS', 'Opción', 'Ruby', 'Cursada 2015', 'Cristian']