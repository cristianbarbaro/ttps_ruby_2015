require 'bundler'

Bundler.require #Para traer lo necesario para ejecutar la aplicación.

set(:number) { |val| condition { rand(1..42) == val } }

get '/' , :number => 42 do
  status 200
  "Number: es igual a 42 \n"
end

get '/' do
  status 404
  "Number: distinto de 42 \n"
end
