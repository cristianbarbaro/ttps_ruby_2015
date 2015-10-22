# #expansor cual recibe un string (conformado únicamente con letras) y devuelve
# otro string donde cada letra aparezca tantas veces según su lugar en el abecedario.

def expansor(str)

  if str.size == 0
    raise StandardError, 'El string es vacío'
  end

  if !str.instance_of?(String)
    raise StandardError, 'La entrada no es un string'
  end

  ran = "a".."z"
  res = ''
  str.each_char do |chr|
    #Qué pasa con las mayúsculas, esto no está funcionando correctamente si recibe alguna mayúscula.
    if ran.include?(chr)
      (chr.downcase.ord - 96).times { res.concat(chr) }
    else
      #Lanzar excepción porque el caracter no es válido.
      raise StandardError, 'El formato del string es incorrecto'
    end
  end

  res
end
