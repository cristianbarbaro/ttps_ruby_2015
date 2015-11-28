require 'rack'

app = Proc.new do |env|
  number = rand (1..42)
  body = "Number: #{number} \n"
  content_type = {'Content-Type' => 'text/html'}
  number == 42 ? ['200', content_type , [body]] : ['404', content_type, [body]]
end

Rack::Handler::WEBrick.run app

#Se puede ejecutar usando el comando rackup. Ver en http://rack.github.io/ para más información. Se usa el comando run. El archivo debe llamarse config.ru.
