# Escribí una función llamada reemplazar que reciba un String y que busque y reemplace en
# el mismo cualquier ocurrencia de { por do\n y cualquier ocurrencia de } por \nend , de
# modo que convierta los bloques escritos con llaves por bloques multilínea con do y end.

def reemplazar (str)
	str2 = str.gsub('{', 'do\n')
	str2.gsub('}', '\nend')
end

puts (reemplazar("3.times { |i| puts i }"))