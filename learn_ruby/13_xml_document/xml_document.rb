class XmlDocument

	def initialize(indent=false)
		@indent = indent
		@level = 0
	end

	def method_missing(meth, *args, &block)
		method(meth.to_s, *args, &block)
	end

	def method(name, options={})
		if @indent
			@level += 1
			close_tag = block_given? ? ">\n" + "  "*@level + yield + "  "*(@level - 1) + "</#{name}>\n" : "/>\n"
			@level -= 1
		else
			close_tag = block_given? ? ">" + yield + "</#{name}>" : "/>"
		end
		"<#{(name + ' ' + options.inject("") { |memo, v| memo + "#{v[0].to_s}='#{v[1]}' " }).chop }" + close_tag
	end
end