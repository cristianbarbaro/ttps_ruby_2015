require 'sinatra'

require_relative '../ej06/ej06.rb'
require_relative '../ej07/ej07.rb'

use XNumber
use XHeader

NUMBERS_REG = /^[0-9]*$/

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
	a = params[:a]
	b = params[:b]
	if (a =~ NUMBERS_REG && b =~ NUMBERS_REG)
		"The least common multiple between #{a} and #{b} is: " + a.to_i.lcm(b.to_i).to_s + "\n"
	else
		status 400
	end
end

get '/mcd/:a/:b' do
	a = params['a']
	b = params['b']
	if (a =~ NUMBERS_REG && b =~ NUMBERS_REG)
		"The greatest common divisor between #{a} and #{b} is: " + a.to_i.gcd(b.to_i).to_s + "\n"
	else
		status 400
	end
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
	"A random number: #{rand} \n"
end

post '/random/:lower/:upper' do
	low = params[:lower]
	up = params[:upper]
	if (low =~ NUMBERS_REG) && (up =~ NUMBERS_REG) && (low.to_i <= up.to_i)
		"A number between #{low} and #{up}: " + rand(low.to_i..up.to_i).to_s + "\n" 
	else
		status 400
	end
end