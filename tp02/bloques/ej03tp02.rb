# Implementá un método que reciba un número variable de parámetros y un bloque,
# y que al ser invocado ejecute el bloque recibido pasándole todos los parámetros
# que se recibieron encapsulando todo esto con captura de excepciones de manera
# tal que si en la ejecución del bloque se produce alguna excepción, proceda de la
# siguiente forma:
#
#   Si la excepción es de clase RuntimeException, debe imprimir en pantalla "Algo salió mal...", y retornar :rt.
#   Si la excepción es de clase NoMethodError, debe imprimir "No encontré un método: "
#     más el mensaje original de la excepción que se produjo, y retornar :nm.
#   Si se produce cualquier otra excepción, debe imprimir en pantalla "¡No sé qué hacer!",
#     y relanzar la excepción que se produjo.
#   En caso que la ejecución del bloque sea exitosa, deberá retornar :ok.

def metodo_lanzador(*args, &block)
  begin
    args.sort
    block.call(*args)
    :ok
  rescue RuntimeError
    puts "Algo salió mal..."
    return :rt
  rescue NoMethodError => exception
    puts "No encontré un método: \n"
    puts exception.message #$!.backtrace.last
    #raise
    #puts $!.result
    return :nm
  rescue
    puts "¡No sé qué hacer!"
    raise
  end
end

puts metodo_lanzador(2, 3, 4, 5)#{|x| x*2}
