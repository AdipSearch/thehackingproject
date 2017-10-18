=begin
class Group
  attr_accessor :people

  def initialize(initial_people = [])
    @people = initial_people
  end

  def add_person(person)
    @people.push(person)
  end
end
=end
class Person
  attr_accessor :name
  attr_reader :age
  @@number = 0
  #@@people = []

  def initialize(initial_name, initial_age)
    @@number += 1
    @name = initial_name
    @age = initial_age
    #@@people.push(self)
  end

  def say_name
    puts "Hi, my name is #{@name}."
  end

  def can_vote?
    if @age >= 18
      return self.name + " can vote!"
    else
      return self.name + " can't vote!"
    end
  end

  def self.count_users
    return @@number
  end

  def self.compare_ages(person1, person2)
      if person1.age == person2.age
        puts "#{person1.name} and #{person2.name} have the same age"
      elsif person1.age > person2.age
        puts "#{person1.name} is older than #{person2.name}"
      else person1.age < person2.age
        puts "#{person2.name} is older than #{person1.name}"
      end   
  end

end

# Create instances of Group and Person
andy = Person.new("Andy", 16)
james = Person.new("James", 17)

# To check out all the current instructors we can run this...
puts james.can_vote?
puts andy.can_vote?

puts Person.count_users

Person.compare_ages(andy,james)
