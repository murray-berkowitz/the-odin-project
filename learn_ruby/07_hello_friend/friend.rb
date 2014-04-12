class Friend
	def greeting(who="")
		who.empty? ? "Hello!" : "Hello, #{who}!"
	end
end