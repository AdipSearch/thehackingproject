class Group
  attr_accessor :people

  def initialize(initial_people = [])
    @people = initial_people
  end

  def add_person(person)
    @people.push(person)
  end
end

class Person
  attr_accessor :name
  attr_reader :age

  def initialize(initial_name, initial_age)
    @name = initial_name
    @age = initial_age
  end

  def say_name
    puts "Hi, my name is #{@name}."
  end
end

instructors = Group.new
andy = Person.new("Andy", 25)
james = Person.new("James", 31)

# Keep track of instructors by adding `andy` (Person) to `instructors` (Group)
instructors.add_person(andy)
instructors.add_person(james)

# To check out all the current instructors we can run this...
print instructors.people
# => [andy, james]