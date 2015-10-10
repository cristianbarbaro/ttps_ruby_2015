# Implementá el módulo Reverso para utilizar como Mixin e incluilo en alguna clase para probarlo.
# Reverso debe contener los siguientes métodos:
# 1. #di_tcejbo : Imprime el object_id del receptor en espejo (en orden inverso).
# 2. #ssalc : Imprime el nombre de la clase del receptor en espejo.

module Reverso
  def di_tcejbo
    puts "#{self.object_id.to_s.reverse}"
  end

  def ssalc
    puts "#{self.class.to_s.reverse}"
  end
end

# ---------------------------------> Ejemplo:

class String
  include Reverso
end

puts "hola".ssalc

puts "hola".di_tcejbo
