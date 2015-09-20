# Escribí una función que encuentre la suma de todos los números naturales múltiplos de 3 ó 5
# menores que un número tope que reciba como parámetro.

def sum_multiple (number)
	# sum = 0
	(1..number).inject(0) do |sum, n| 
		if ((n.modulo(2) == 0) || (n.modulo(3) == 0)) 
			sum + n
		else 
			sum	
		end
	end
end

#Esta es una manera más elegante de resolver el mismo problema:
def sum_multiple2 (number)
	(1..number).select {|n| (n.modulo(2)==0) ||(n.modulo(3)==0)}.inject :+
end

puts sum_multiple2 (5)
