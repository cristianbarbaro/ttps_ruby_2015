# Dada una cadena cualquiera, y utilizando los métodos que provee la clase String , realizá las
# siguientes operaciones sobre el string :
# 1. Imprimilo con sus caracteres en orden inverso.
# 2. Eliminá los espacios en blanco que contenga.
# 3. Convertí cada uno de sus caracteres por su correspondiente valor ASCII.
# 4. Cambiá las vocales por números ( a por 4 , e por 3 , i por 1 , o por 0 , u por 6 ).

def process_string (str)
	puts "Invierto caracteres: " + str.reverse
	puts "Elimino espacios en blanco: " + str.delete(" ")
	asc = str.each_codepoint {|c| print c, " "}
	#puts "Se convierte los caracteres en sus códigos ASCII correspondientes: " + asc
	puts str.gsub(/[aeiou]/, 'a' => 4, 'e' => 3, 'i' => 1, 'o' => 0, 'u' => 6)
end


process_string "Esto es una cadena de caracteres re loca :)"