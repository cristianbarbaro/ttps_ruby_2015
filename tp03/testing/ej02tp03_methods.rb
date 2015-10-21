def incrementar(x, delta= 1)
  x + delta
  #Esto que sigue puede ser medio chancho, pero funciona. Rescato para lanzar excepción (CHANCHO!!!)
  rescue
    raise RuntimeError
end

def concatenar(*args)
  #Primero hago join de los elementos mediante un espacio, luego lo hago todo string, los separo por espacio y los vuelvo a unir por espacios.
  args.join(' ').to_s.split(' ').join(' ')
end
