# Escribí una función llamada a_ul que reciba un Hash y retorne un String con los pares de
# clave/valor del hash formateados en una lista HTML <ul>.

def a_ul hsh
	str = ""
	hsh.each_pair {|key, value| str +=  "<li>#{key}: #{value}<li>"}
	"<ul>"+ str + "</ul>"
end

puts a_ul ({ perros: 1, gatos: 1, peces: 0, vacas: 28})
