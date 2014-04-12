class Book
	attr_reader :title

	def title=(val)
		little_words = ['and', 'the', 'of', 'over', 'in', 'a', 'an']
		@title = val.capitalize.split.map{ |str| little_words.include?(str) ? str : str.capitalize }.join(' ')
	end
end