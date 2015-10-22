require 'minitest/autorun'
require 'minitest/spec'

require_relative '../../tp01/ej04tp01.rb'
require_relative '../../tp01/ej05tp01.rb'
require_relative '../../tp01/ej06tp01.rb'
require_relative '../../tp01/ej09tp01.rb'

require_relative '../../tp02/metodos/ej01tp02.rb'
require_relative '../../tp02/metodos/ej02tp02.rb'
require_relative '../../tp02/metodos/ej04tp02.rb'
require_relative '../../tp02/clases y modulos/ej07tp02.rb'
require_relative '../../tp02/bloques/ej01tp02.rb'

#Bueno, hagamos algunos tests para romper las bolas:
#
# describe '#en_palabras' do
#   describe 'Si recibe como argumento la hora' do
#     it 'retorna el horario en palabras' do
#       #08:37:48 en GTM -03:00 (Bs. As.)
#       time = Time.new(2007,11,19,8,37,48,"-03:00")
#       hour = time.hour
#       min = time.min
#       assert_equal("Son las 9 menos veinticinco.", en_palabras)
#     end
#   end
# end
# Acá me encuentro con el problema de que nunca le pasé un parámetro, de hecho la cuenta la hago dentro. Y ya no estoy para refactoring.
# (al menos por ahora.)


# Ejercicio 05 de tp01: contar(str, word)
# Cuenta la cantidad de veces que aparece word en str.
describe '#contar' do
  describe 'Cuando se le manda un string' do
    describe 'y una palabra que debe contar' do

      it 'es nulo, debería explotar con una Exception' do
        assert_raises(ArgumentError) {contar('anda a la concha de tu hermana')}
      end

      it 'es un string vacio, debería retornar 0' do
        assert_equal(0, contar('esto es cualquier cosa', ''))
      end

      it 'es un string válido' do
        assert_equal(5, contar("La casa de la esquina tiene la puerta roja y la de ventana blanca.", "la"))
      end

    end
  end
end

# Ejercicio 06 de tp01: contar_palabra(str, word).
# Bueno, este problema cuenta en sí palabras completas dentro de str.
describe '#contar_palabra' do
  describe 'Cuando se le mande un string largo' do
    describe 'y la palabra corta' do

      it 'sea nulo, debería lanzar una excepción' do
        assert_raises(ArgumentError) {contar_palabra('Acá envío el string más largo pero nada más')}
      end

      it 'es un string vacío, debería retornar cero' do
        assert_equal(0, contar_palabra('Envío el string largo', ''))
      end

      it 'es un string válido' do
        assert_equal(4, contar_palabra("La casa de la esquina tiene la puerta roja y la de ventana blanca.", "la"))
      end

      it 'sea más largo que el string principal, debería retornar cero.' do
        assert_equal(0, contar_palabra('larga', 'esta es más larga'))
      end

    end

    describe 'se envíe algo distinto a un string' do

      it 'sea un entero, debería lanzar una excepción de tipo' do
        assert_raises(TypeError) {contar_palabra('sarasa a morir', 999)}
      end
    end
  end
end

# Resolvamos ahora el ej 09 de tp01. Este dice que recibe un arreglo de strings y retorna otro arreglo con la longitud de estos
# strings, respetando el orden de los mismos
describe '#elements_size' do
  describe 'este recibe el primer parámetro' do

    it 'es algo distinto a un arreglo, debería lanzar una excepción de TypeError' do
      assert_raises(TypeError) {elements_size('Hola, soy un string')}
    end

    it 'es un arreglo, debe retornar el otro arreglo' do
      assert_equal([4, 6, 4, 12, 8], elements_size(['TTPS', 'Opción', 'Ruby', 'Cursada 2015', 'Cristian']))
    end

    it 'es un arreglo vacío, debería retornar otro vacío' do
      assert_equal([], elements_size([]))
    end

  end
end

# Ahora resolveremos el ejercicio 1 de métodos.
# Este recibe un arreglo y retorna el mismo con sus elementos ordenados.
describe '#ordenar_arreglo' do
  describe 'Veamos esos casos infelices' do

    it 'recibe otra cosa distinta a un arreglo, debería lanzar una excepción de TypeError' do
      assert_raises(TypeError) {ordenar_arreglo('Hola, soy un string :)')}
    end
  end

  describe 'Ahora casos felices' do
    it 'recibe un arreglo vacío, debe retornar otro vacío' do
      assert_equal([], ordenar_arreglo([]))
    end

    it 'recibe un arreglo válido, debe ordenarlo' do
      assert_equal([0, 1, 2, 3, 4, 6, 10], ordenar_arreglo([1, 4, 6, 2, 3, 0, 10]))
    end

    it 'recibe distintos tipos de elementos, lanzar un ArgumentError' do
      assert_raises(ArgumentError) {ordenar_arreglo([1, 4, 6, 2, nil, 'hola'])}
    end
  end
end


# Ahora resolveremos el problema 02 de métodos.
# Este recibe un conjunto de valores numéricos y los retorna en un arreglo.

describe '#ordenar' do
  describe 'Si recibe algo que no se puede comparar' do
    it 'Si recibe dos tipos distintos, debe lanzar una excepción' do
      assert_raises(ArgumentError) { ordenar(nil, 4, 5, 'hola') }
    end
  end

  describe 'Si recibe argumentos válidos' do
    it 'debe retornarlos en un array ordenado' do
      assert_equal([0, 1, 2, 3, 4, 5, 6, 9, 10], ordenar(1, 4, 6, 2, 3, 5, 0, 10, 9))
    end
  end
end

# El 4 de metodos no lo voy a hacer, me da alta paja modificar algunas cuestiones que no creo que valga la pena. Capaz más adelante y con tiempo lo haga.

# Vamos a hacer el 7 de clases y módulos.
# Acá tenemos las clases TrueClass y FalseClass, y yo debía implementar los métodos opposite en ambas clases. Ahora vamos a testearlas.
describe '#opposite' do
  describe 'En TrueClass' do
    it 'debería darnos false' do
      assert_equal(false, true.opposite)
    end

    it 'aplicar dos veces, debería darnos el mismo objeto' do
      assert_equal(true, true.opposite.opposite)
    end
  end

  describe 'En FalseClass' do
    it 'debería darnos true' do
      assert_equal(true, false.opposite)
    end

    it 'aplicar dos veces debería darnos el mismo objeto' do
      assert_equal(false, false.opposite.opposite)
    end
  end
end

# da_nil? es un método que recibe un bloque y retorna true si este bloque retorna nil o false en caso contrario.
# y si no recibe ningún bloque retorna nil.
describe '#da_nil?' do
  describe 'Si recibe un bloque' do
    it 'Si el bloque retorna nil, el método retorna true' do
      assert_equal(true, da_nil? {puts 'hola :)'})
    end

    it 'Si el bloque no retorna nil, el método retorna false' do
      assert_equal(false, da_nil? { 100 })
    end
  end

  describe 'Si no recibe un bloque' do
    it 'Debe retornar nil' do
      assert_equal( nil, da_nil? )
    end
  end
end
