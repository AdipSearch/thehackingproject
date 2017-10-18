class OrangeTreeOrchard

	class OrangeTree < OrangeTreeOrchard

		attr_accessor :height, :age, :oranges

		def initialize(height)
			@height = height
			@age = 0
			@oranges = 0
		end

		def one_year_passes
			if @age > 4 && @age < 49
				@age += 1
				@oranges = 20 + @age
				@height += 1
			elsif @age <= 4
				@age += 1
				@height += 1
			else
				@height = 0
				@age = 0
				@oranges = 0
			end
		end

		def pick_an_orange
			if @oranges > 0
				@oranges -= 1
			else 
				@oranges = 0
			end
		end

		def count_the_oranges
			return @oranges
		end

	end

end

monbeau = OrangeTreeOrchard.new(2)
7.times do 
	monbeau.one_year_passes
end
#15.times do 
#	monbeau.pick_an_orange
#end
puts monbeau.height
puts monbeau.age
puts monbeau.count_the_oranges