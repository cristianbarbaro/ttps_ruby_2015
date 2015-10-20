# Extendé la clase Array con el método randomly que funcione de la siguiente manera:
#
#   Si recibe un bloque, debe invocar ese bloque con cada uno de los elementos del arreglo en orden aleatorio.
#   Si no recibe un bloque, debe devolver un enumerador que va arrojando, de a uno, los elementos del arreglo en orden aleatorio.

class Array
  def randomly
    if block_given?
      #Si digo expicitamente que recibo un bloque podría usar: #call.
      self.shuffle.each {|ele| yield ele}
    else
      #En el caso que no reciba un bloque, debo devolver un enumerador y arrojar de a uno los valores del array.

      # @enum ||= self.shuffle.to_enum do |yielder|
      #   loop do
      #     yielder.yield
      #   end
      # end
      # @enum.next

      #La solución de arriba es por si me pide que retorne cada uno de los elementos, pero llamando a randomly en vez de hacerlo afuera.
      #Queda para consultarlo.

      self.shuffle.each
    end
  end
end

# arr = [2,5,7,1,0,10,-2]
arr = [2,5,7]

en = arr.randomly #{ |x| puts "Elemento: #{x}"}
puts en.next
puts en.next
puts en.next
