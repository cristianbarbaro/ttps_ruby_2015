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


#Included (mod) lo que hace esto es incluir este módulo en otra clase o módulo.
# por ejemplo:

# module A
#   def A.included(mod)
#     puts "#{self} included in #{mod}"
#   end
# end
# module Enumerable
#   include A           //Aquí se llama a ese método de arriba.
# end
# => prints "A included in Enumerable"
# Esto es útil por si deseo realizar alguna acción al incluir este módulo en la clase o módulo mod.


#Ahora un poco de alias_method:
#El uso del alias_method me sirve para renombrar el método que quiero modificar y no perder su referencia, de
#esta manera podré contabilizar sus invocaciones, es decir, redefinir el método en tiempo de ejecución y luego llamarlo
#Aquí podré llevar la cuenta del mismo y luego invocarlo sin perderlo.

# module Mod
#   alias_method :orig_exit, :exit
#   def exit(code=0)
#     puts "Exiting with code #{code}"
#     orig_exit(code)
#   end
# end
# include Mod
# exit(99)

# produces:
# Exiting with code 99


module Countable

  #Incluyo los métodos de clase a mi módulo cuando se llama al include que incluirá este módulo.
  #El included se ejecuta siempre que se hace include y lleva a cabo altas tareas de locuras.
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def count_invocations_of(*syms)

      define_method(:hash) do
        @hash ||= Hash.new 0 #
      end

      syms.each do |sym|

        sym_old = ("#{sym}"+"_old")

        # hash[sym] = 0

        alias_method(sym_old ,sym)

        define_method(sym) do |*args|
          #Esto inicializa el hash en el caso que no lo esté.
          @hash[sym] += 1
          send sym_old, *args
        end

      end
    end

  end

  #Métodos de instancia
  def invoked?(sym)
    self.invoked(sym) > 0
  end

  def invoked(sym)
    hash[sym]
  end

end
