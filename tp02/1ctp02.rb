# Escribí un método da_nil? que reciba un bloque, lo invoque y retorne si el valor de retorno del
# bloque fue nil.

def da_nil?
  if block_given?
    return yield.nil?
  else
    puts "No se ha recibido ningún bloque."
    return nil
  end
end
