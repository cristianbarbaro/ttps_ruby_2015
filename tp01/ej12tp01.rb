# Escribí una función más genérica, parecida a la del ejercicio anterior, que reciba como parámetro un
# string y un número n , y que realice una rotación de n lugares de las letras del string y
# retorne el resultado.

def rot (str, n)
  str2 = str
  n.times do
    str2 = str2.tr('A-Za-z', 'B-ZAb-za')
  end
  str2
end

puts rot("¡Bienvenidos a la cursada 2015 de TTPS Opción Ruby!", 27)
