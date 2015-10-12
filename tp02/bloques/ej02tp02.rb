# Implementá un método que reciba como parámetros un Hash y Proc, y que
# devuelva un nuevo Hash cuyas claves sean los valores del Hash recibido
# como parámetro, y cuyos valores sean el resultado de invocar el Proc con cada
# clave del Hash original.
#
# hash = { 'clave' => 1, :otra_clave => 'valor' }
# procesar_hash(hash, ->(x) { x.to_s.upcase })
# => { 1 => 'CLAVE', 'valor' => 'OTRA_CLAVE' }
#También pueden crearse a partir de lambda {|x| x.to_s.upcase}

def procesar_hash(hash, a_proc)
  new_hash = Hash.new
  hash.each do
    |key, value|
    new_hash[value] = a_proc.call key
  end
  new_hash
end

hash = { 'clave' => 1, :otra_clave => 'valor' }

puts procesar_hash(hash, ->(x) { x.to_s.upcase })
