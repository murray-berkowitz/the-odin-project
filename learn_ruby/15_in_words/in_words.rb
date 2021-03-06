class Integer
	def in_words
		words = { 0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 
				  7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten", 11 => "eleven", 12 => "twelve", 
				  13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 
				  18 => "eighteen", 19=>"nineteen", 20 => "twenty", 30 => "thirty", 40 => "forty", 
				  50 => "fifty", 60 => "sixty", 70 => "seventy", 80 => "eighty", 90 => "ninety" }
		scale = [[100, "hundred"], [1000, "thousand"], [1000000, "million"], [1000000000, "billion"], 
				 [1000000000000, "trillion"], [1000000000000000]]
		return words[self] if words.has_key?(self)
		return ((self / 10 * 10).in_words + ' ' + (self % 10).in_words) if (self < 100)
		scale.each_index do |i|
			return ((self / scale[i][0]).in_words + " #{scale[i][1]}") if ((self % scale[i][0] == 0) and (self < scale[i+1][0]))
			return ((self / scale[i][0]).in_words + " #{scale[i][1]} " + (self % scale[i][0]).in_words) if (self < scale[i+1][0])
		end
	end
end