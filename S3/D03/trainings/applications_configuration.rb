require 'pry'

class ApplicationConfiguration
  def self.set(property_name, value)
  end

  def self.get(property_name)
  end
end

binding.pry

# make it so the following methods work as expected
# ApplicationConfiguration.set("name", "Demo Application")
# ApplicationConfiguration.set("version", "0.1")
#
# puts ApplicationConfiguration.get("name")
# puts ApplicationConfiguration.get("version")


puts "exercise complete" # fixes a bug in pry