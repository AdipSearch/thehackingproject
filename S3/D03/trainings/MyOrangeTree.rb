class OrangeTreeOrchard
	attr_accessor :tree

  def initialize(initial_OrangeTree = [])
  @tree = initial_OrangeTree
	end

	def add_tree(orangeTree)
    @tree.push(orangeTree)
  end

	def age_all_trees_by_one_year
		@tree.each do |solo|
			solo.one_year_passes
		end
	end

	def show_age
		age_trees = []
		@tree.each do |i|
			age_trees << i.age
		end
		return age_trees
	end

end

class OrangeTree
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


new_orchard = OrangeTreeOrchard.new

orange1 = OrangeTree.new (30)
orange2 = OrangeTree.new (10)
orange3 = OrangeTree.new (15)
orange4 = OrangeTree.new (25)

orange1.one_year_passes
orange1.one_year_passes

new_orchard.add_tree(orange1)
new_orchard.add_tree(orange2)
new_orchard.add_tree(orange3)
new_orchard.add_tree(orange4)

10.times do
	new_orchard.age_all_trees_by_one_year
end

#puts new_orchard.tree

print new_orchard.show_age


