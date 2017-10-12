require 'rubygems'
require 'nokogiri'   
require 'open-uri'

def collect_their_infos(url, names)

	my_website = []
	postal_code = []
	final_hash = []

	#Go collect the postal code of each incubator, we go to each of them through the collected URLs in the previous method
	url.each do |page_url|
		doc = Nokogiri::HTML(open(page_url))
		a = doc.xpath('.//*[@id="frontend_address"]')
		postal_code << a.text.split(',',3)[1]
	end
	#Same here but for their personal websites
	url.each do |page_url|
		doc = Nokogiri::HTML(open(page_url))
		b = doc.xpath('//*[@id="website"]/@href')
		my_website << b.text
	end
	#We take the 3 arrays : mywebsite, postal_code and names, and we create an array of hash called final_hash :-)
	final_hash = names.zip(postal_code, my_website).map { |names, postal, website| {name: names, postal_code: postal, url: website} }
	#Let's contemplate our work :-)
	puts final_hash
end


		#Collect on every page available on the website - from the second one
def get_all_the_incubators_and_their_names
	my_urls = []
	name_incubator = []

	doc = Nokogiri::HTML(open("http://www.alloweb.org/annuaire-startups/annuaire-incubateurs/incubateurs-startups/?tevolution_sortby=alphabetical"))

				#get the urls of each page to collect more info later
			doc.xpath('.//*[@class="entry-title"]//a/@href').each do |node|
				my_urls << node.text
			end

				#get the names of the incubators
			doc.xpath('.//*[@class="entry-title"]//a').each do |node|
				name_incubator << node.text
			end
				collect_their_infos(my_urls, name_incubator)

	#up to the 29th page
	2.upto(29) do |pagenum|

			url = "http://www.alloweb.org/annuaire-startups/annuaire-incubateurs/incubateurs-startups/page/#{pagenum}/?tevolution_sortby=alphabetical"
			doc = Nokogiri::HTML(open(url))

			#get the urls of each page to collect more info later
			doc.xpath('.//*[@class="entry-title"]//a/@href').each do |node|
				my_urls << node.text
			end
			#get the names of the incubators
			doc.xpath('.//*[@class="entry-title"]//a').each do |node|
				name_incubator << node.text
			end
				collect_their_infos(my_urls, name_incubator)

			#send the tabs to the other method to collect additional info
	end
end


	#initialize the program
	get_all_the_incubators_and_their_names()