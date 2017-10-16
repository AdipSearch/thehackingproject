require 'watir'
require 'nokogiri'
require 'open-uri'
=begin
def get_names()
    names=[]
    doc = Nokogiri::HTML(open("https://www.facebook.com/groups/582287395160914/members"))
        doc.xpath('.//*[@class="fsl fwb fcb"]//a').each do |node|
            names << node.text
    	end
    puts names
end
=end
browser = Watir::Browser.new(:firefox)

browser.goto "https://www.facebook.com/groups/582287395160914/"

browser.text_field(:id, "email").set("mail")
browser.text_field(:id, "pass").set("mdp")
browser.button(:value,"Connexion").click
browser.link(:text, "159 members").click

    browser.link(:text =>"See more").wait_until_present.click
