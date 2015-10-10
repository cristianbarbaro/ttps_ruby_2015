# Implementá el método cuanto_falta? que opcionalmente reciba como parámetro un objeto
# Time y que calcule la cantidad de minutos que faltan para ese momento. Si el parámetro de fecha
# no es provisto, asumí que la consulta es para la medianoche de hoy.

def cuanto_falta? (date = Time.new(Time.new.year, Time.new.month, Time.new.day, "+24:00"))
	now = Time.now
	date.to_i - now.to_i
end


puts cuanto_falta?

puts cuanto_falta? (Time.new(2015, 10, 31, 23, 59, 59))