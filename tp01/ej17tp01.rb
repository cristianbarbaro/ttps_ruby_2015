# Cada nuevo término en la secuencia de Fibonacci es generado sumando los 2 términos anteriores.
# Los primeros 10 términos son: 1 , 1 , 2 , 3 , 5 , 8 , 13 , 21 , 34 , 55 . Considerando
# los términos en la secuencia de Fibonacci cuyos valores no exceden los 4 millones, encontrá la sumade los términos pares.


def fibonacci (max)
	n = 1
	m = 1
	array = []
	(1..max).each do 
			|x|
			m, n = n, n + m
			array << m
	end
	array
end

def sumar_fib (max)
	array = fibonacci 50
	(array.select {|n| (n < max) and (n % 2 == 0)}).inject :+
end

puts sumar_fib (4000000)

#Duda : cómo puedo hacer para quedarme con los valores fib < 4000000 sin necesidad de calcular valores de más, algo que hago en este problema?


