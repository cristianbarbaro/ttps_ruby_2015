require 'sinatra'

get '/'  do
	body = [
		"'/' => Endpoints list \n",
		"'/mcm/:a/:b' => Returns lcm between :a and :b \n",
		"'/mcd/:a/:b' => Returns gcd between :a and :b \n",
		"'/sum/*' => Returns sum of splat's numbers \n",
		"'/even/*' => Returns amount of evens in splat \n",
		"'/random' => Returns a random number \n",
		"'/random/:lower/:upper' => Returns a random number between :lower and :upper \n"						
	]
	#Rack based
	[200, {}, body]
end

get '/mcm/:a/:b' do 
	a = params[:a].to_i
	b = params[:b].to_i
	"The least common multiple between #{a} and #{b} is: " + a.lcm(b).to_s + "\n"
end

get '/mcd/:a/:b' do
	a = params['a'].to_i
	b = params['b'].to_i
	"The greatest common divisor between #{a} and #{b} is: " + a.gcd(b).to_s + "\n"
end

get '/sum/*' do
	sum = params['splat'].first.split('/').inject(0) do |sum, n|
		sum + n.to_i
	end
	"The sum is: #{sum} \n"
end

get '/even/*' do
	amount = params['splat'].first.split('/').inject(0) do |sum, n|
		n.to_i.even? ? sum + 1 : sum
	end
	"Amount of evens in parameters: #{amount} \n"
end

post '/random' do
	"Returns a random number: #{rand} \n"
end

post '/random/:lower/:upper' do
	low = params[:lower].to_i
	up = params[:upper].to_i
	"Returns a random number between #{low} and #{up}: " + rand(low..up).to_s + "\n" 
end