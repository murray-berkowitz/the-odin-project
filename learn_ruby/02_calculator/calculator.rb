def add(a, b)
	a + b
end

def subtract(a, b)
	a - b
end

def sum(array)
	array.inject(0, :+)
end

def multiply(a, *b)
	a*b.inject(1, :*)
end

def power(a,b)
	a**b
end

def factorial(n)
	return 1 if ((n == 0) or (n == 1))
	(1..n).inject(1, :*)
end