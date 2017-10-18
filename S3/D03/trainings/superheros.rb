class Person
	attr_accessor :name, :age

	def initialize(name, age)
		@name = name
		@age = age
	end

	def to_s
		puts @name
		puts @age
	end
end

class Superhero < Person
	def initialize(name, age, superpower)
		@name = name
		@age = age
		@superpower = superpower
	end

	def to_s
		puts @superpower
	end
end


jill = Person.new("Jill", 10)
bob = Superhero.new("Bob", 20, "Flies")

jill.to_s
bob.to_s