# Analizar el siguiente script:

VALUE = 'global'

module A
  VALUE = 'A'             #Valor que toma el módulo, es decir, debería ser el mismo para cualquier clase que lo incluya.
                          #Podría probar si esto es así con algún ejemplo.
  class B
    VALUE = 'B'

    def self.value        #Este es un método de clase, debería devolver 'B'
      VALUE
    end

    def value             #Método de instancia que devuelve 'iB'.
      'iB'
    end
  end                     #Aquí finaliza la clase B.

  def self.value          #Esto no sé cómo lo tiene en cuenta el módulo, ya que está fuera de ClassMethods, dentro de Module.
    VALUE                 #Digamos que es un método del módulo A. Y que debería ser llamado A::B.value. Queda por ver si es así.
  end
end

class C
  class D                 #Digamos que a esto lo llamamos una clase privada. Existe una fuerte dependencia entre ambas.
    VALUE = 'D'

    def self.value        #Debería devolver 'D'.
      VALUE
    end
  end

  module E
    def self.value        #Esto se está poniendo muy turbio. ¿VALUE está definido?
      VALUE
    end
  end

  def self.value          #Método de la clase C. ¿Si no está definido, retorna el valor 'global'? En apariencia, así es.
    VALUE
  end
end

class F < C               #Al fin que sé lo que dará. Una hermosa herencia.
  VALUE = 'F'             #Si acá definí VALUE, no entiendo por qué me sigue retornando 'global'.
end                       #Ahí me explicó Bruno: yo no redefiní el valor de la variable ya que estamos hablando de otro scope.
                          #Estamos hablando de constantes, pensar en el valor PI.
# Responder:
# i) ¿Qué imprimen cada una de las siguientes sentencias? ¿De dónde está obteniendo el valor?

# puts A.value                    # => Debe retornar 'A'. Sí.
# puts A::B.value                 # => Debe retornar 'B'. Sí.
# puts C::D.value                 # => Debe retornar ¿'D'? Esto me tiene algo mareado. Sí.
# puts C::E.value                 # => Esto es un concepto inverso: un módulo dentro de una clase. Debería retornar ¿'nil'?
#                                 # Retornó 'global'.
# puts F.value                    # => retornar 'F'. Retornó 'global'. ¿Por qué si se ha definido?

# ii) ¿Qué pasaría si ejecutases las siguientes sentencias? ¿Por qué?

# puts A::value                   # => Debería retornar 'A'
# puts A.new.value                # => Debería retornar 'nil'. No hay un value definido para la instancia. De hecho, no está definido
                                # el método #new para el módulo A. Así que directamente explota (excepción).
# puts B.value                    # => ¿Puedo llamarlo pasando por alto que está dentro del módulo? Ahí está el asunto,
                                # tira una excepción y me dice que la constante B no está inicializada.
# puts C::D.value                 # => ¿Retorna 'D'? Sí.
# puts C.value                    # => ¿'global'? Sí. Debería averiguar si esto ocurre porque no seteé value dentro de cada clase.
# puts F.superclass.value         # => Debería retornar 'global'. Sí


class R
  VALUE = 'Rconstant'
  def initialize
    @VALUE = 'Rinstance'
  end

  def value
    VALUE
  end
end

class T < R
  VALUE = 'Tconstant'
  def initialize
    @VALUE = 'Tinstance'
  end
end

puts T.new.value      #Si no está definida, retornará 'global', si la defino me retorna el valor que le dé dentro de la clase.

#Ahora bien, estaba medio perdido porque no estaba pensando en VALUE como una constante, la idea es que a estos valores no los pueda
# pisar o no tendría sentido el hecho de que son constantes. Pensá qué pasaría si pudiera modificar el valor PI de una librería que
# pudiera usar para hacer cálculos matemáticos, alto desastre haría.
