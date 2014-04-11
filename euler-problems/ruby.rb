class Fixnum
	def prime?
		return true if ((self == 2) or (self == 3))
		return false if ((self < 2) or self.even? or (self % 3 == 0))
		max_divisor = (self**0.5).to_i
		divisor = 5
		while (divisor <= max_divisor)
			return false if ((self % divisor == 0) or (self % (divisor + 2) == 0))
			divisor += 6;
		end
		return true
	end
end

def problem1(n = 1000)
	(0..n-1).inject { |sum, n| ((n % 3 == 0) or (n % 5 == 0)) ? sum + n : sum }
end

def problem2(n = 4000000)
	a = [1, 2]
	a.each_index { |i| a << a[i] + a[i+1] if (a[i] < n) }.select { |e| e.even? and e<n }.inject(:+)
end

def problem3(n = 600851475143)
	max_divisor = (n % 3 == 0) ? 3 : (n % 2 == 0) ? 2 : 1
	inter, divisor = 2, 5
	while (divisor <= n/max_divisor)
		if ((n % divisor == 0) and divisor.prime?)
			max_divisor = divisor
		end
		divisor += inter
		inter = 6 - inter
	end
	max_divisor
end

puts "Problem 1: \n" + problem1.to_s
puts "Problem 2: \n" + problem2.to_s
puts "Problem 3: \n" + problem3.to_s