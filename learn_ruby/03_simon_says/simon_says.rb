def echo(msj)
	msj
end

def shout(msj)
	msj.upcase
end

def repeat(msj, n=2)
	("#{msj} "*n).chop
end

def start_of_word(msj, n)
	msj[0..n-1]
end

def first_word(msj)
	msj[/\w+/]
end

def titleize(msj)
	little_words = ['and', 'the', 'of', 'over']
	msj.capitalize.split.map{ |str| little_words.include?(str) ? str : str.capitalize }.join(' ')
end