# Dado un color expresado en notación RGB, debés calcular su representación entera y hexadecimal,
#	donde la notación entera se define como red + green*256 + blue*256*256 y la hexadecimal
# como el resultado de expresar en hexadecimal el valor de cada color y concatenarlos en orden.

def notacion_hexadecimal (red, green, blue)
	puts "Notación hexadecimal: #{red.to_s(16) + green.to_s(16) + blue.to_s(16)}"
	puts "Notación entera: #{red + green*256 + blue*256*256}"
end

notacion_hexadecimal 0, 128, 255
