class XHeader

	def initialize(app)
		@app = app
	end

	def call(env)
		status, headers, body = @app.call(env)
		x_counts = body.inject(0) { |sum, line| sum + line.count("xX") }
		headers["X-Xs-Xount"] = x_counts.to_s
		[status, headers, body]
	end

end