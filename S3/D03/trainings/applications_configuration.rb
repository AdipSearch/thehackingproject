require 'pry'

class ApplicationConfiguration
		@@all_objects = []

  def self.set(property_name, value)
  	@@all_objects.push(property_name)
  end

  def self.get(property_name)
		return property_name
  end
end


# make it so the following methods work as expected
ApplicationConfiguration.set("name", "Demo Application")
ApplicationConfiguration.set("version", "0.1")

binding.pry
 #puts ApplicationConfiguration.get("name")
 #puts ApplicationConfiguration.get("version")


puts "exercise complete" # fixes a bug in pry

