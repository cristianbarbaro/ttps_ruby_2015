# Implementá el Mixin Countable que te permita hacer que cualquier clase cuente la cantidad de
# veces que los métodos de instancia definidos en ella es invocado. Utilizalo en distintas clases, tanto
# desarrolladas por vos como clases de la librería standard de Ruby, y chequeá los resultados. El Mixin
# debe tener los siguientes métodos:
# 1. count_invocations_of(sym) : método de clase que al invocarse realiza las tareas
# necesarias para contabilizar las invocaciones al método de instancia cuyo nombre es sym (un símbolo).
# 2. invoked?(sym) : método de instancia que devuelve un valor booleano indicando si el método
# llamado sym fue invocado al menos una vez en la instancia receptora.
# 3. invoked(sym) : método de instancia que devuelve la cantidad de veces que el método
# identificado por sym fue invocado en la instancia receptora.


module Countable

  module ClassMethods
    def count_invocations_of(*syms)
      @@hash = Hash.new
      syms.each { |sym| @@hash[sym] = 0 }
    end

    def hash
      @@hash
    end
  end

  def invoked?(sym)
    invoked(sym) != 0
  end

  def invoked(sym)
    self.class.hash.values_at(sym)
  end

  #Incluyo los métodos de clase a mi módulo
  def self.included(base)
    base.extend(ClassMethods)
  end
end

#NOTA: algo que falta hacer es ver cómo contabilizar la cantidad de veces que se llama al método que me interesa.

class Greeter
  include Countable
  def hi
    puts 'hola'
  end
  count_invocations_of :hi
end

a = Greeter.new

b = Greeter.new

puts a.invoked? :hi
puts b.invoked? :hi

puts a.hi

puts a.invoked? :hi

puts a.invoked :hi

puts b.invoked :hi
