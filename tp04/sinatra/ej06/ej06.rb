class XNumber
	def initialize(app)
		@app = app
	end

	def call(env)
		status, headers, body = @app.call(env)
		body = body.map do |line|
			line.tr('[0-9]', 'X')
		end
		#Esta linea no es necesaria. Se necesita llamar a cada uno de las variables del entorno.
		#Se supone que se sigue el orden detallado arriba.
		[status, headers, body]
	end

end