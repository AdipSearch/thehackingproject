
require 'rubygems'
require 'nokogiri'   
require 'open-uri'
PAGE_URL = "http://ruby.bastardsbook.com/files/hello-webpage.html"
#selectionner un  
page = Nokogiri::HTML(open(PAGE_URL))
links = page.css.css("div#references a")
puts links.length   # => 6
puts links[0].text   # => Click here
puts links[0]["href"] # => http://www.google.com