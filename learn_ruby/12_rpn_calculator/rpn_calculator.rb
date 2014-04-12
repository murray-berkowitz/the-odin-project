class RPNCalculator

	attr_reader :value

	def initialize
		@values = []
	end

	def push(val)
		@values << val
	end

	def plus
		raise "calculator is empty" if @values.empty?
		@values[-1] = @value = @values[-2] + @values.pop
	end

	def minus
		raise "calculator is empty" if @values.empty?
		@values[-1] = @value = @values[-2] - @values.pop
	end

	def divide
		raise "calculator is empty" if @values.empty?
		@values[-1] = @value = @values[-2].to_f / @values.pop
	end

	def times
		raise "calculator is empty" if @values.empty?
		@values[-1] = @value = @values[-2] * @values.pop
	end

	def tokens(str)
		str.split.map { |x| x[/\d+/] ? x.to_i : x.to_sym }
	end

	def evaluate(str)
		result = 0
		vals = []
		tokens(str).each do |val|
			if val.is_a?(Fixnum)
				vals << val
			else
				vals[-1] = vals[-2].send(val, vals.pop.to_f)
			end
		end
		vals[-1]
	end
end