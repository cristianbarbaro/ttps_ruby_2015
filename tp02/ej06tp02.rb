# Este es el ejemplo que se da en la práctica:

# Tira un dado virtual de 6 caras
def tirar_dado
	rand 1..6
end

# Mueve la ficha de un jugador tantos casilleros como indique el dado en un tablero virtual de 40 posiciones.
# Si no se recibe la cantidad de casilleros, aprovecho el valor por defecto para ese parámetro para evitar tener que
# llamar a #tirar_dado dentro del cuerpo del método.
def mover_ficha(fichas, jugador, casilleros = tirar_dado)
	fichas[jugador] += casilleros
	if fichas[jugador] > 40
		puts "Ganó #{jugador}!!"
		true
	else
		puts "#{jugador} ahora está en el casillero #{fichas[jugador]}"
		fichas[jugador]
	end
end

posiciones = { azul: 0, rojo: 0, verde: 0 }

finalizado = false
until finalizado
	['azul', 'rojo', 'verde'].shuffle.each do |jugador|
		puts jugador
		finalizado = mover_ficha(posiciones, jugador)
	end
end

# Indicar los problemas que pudiera tener este código.
# RESPUESTA:
# 1. Nunca recibe la cantidad de casilleros que debe avanzar, por lo tanto, siempre llama a tirar_dado.
# 2. finalizado se va a quedar con el último valor que se le asigne en cada each, por lo tanto si uno antes que verde 
# finalizó y retornó true, este sería pisado por el otro valor. Por el momento uso un break si es true, así salgo del loop.
# 3. El acceso al hash dentro de mover_ficha no es correcto, al ser un selector debe accederse de la sig manera: :azul.
# 4. Ruby solo considera false si el valor recibido es cero, cualquier otra cosa la pasa como true, y en until esto genera error.
# 5. Hay que ver la forma de no recorrer esto con un while. 