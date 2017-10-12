require 'rubygems'
require 'nokogiri'   
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage(url, mairie)
	my_emails = []
	final_hash = []
	url.each do |page_url|
		doc = Nokogiri::HTML(open(page_url))
		a = doc.xpath('.//*[@class="Style22"]')
		my_emails << a[11].text[1..-1]
	end
	final_hash = mairie.zip(my_emails).map { |ville, email| {ville: ville, email: email} }
	#finished = Hash[mairie.zip(my_urls.map {|i| i.include?(',') ? (i.split /, /) : i})]
	#print finished
	puts final_hash
end

def get_all_the_urls_of_val_doise_townhalls
	
	2.upto(29) do |pagenum|
	  # Create a local variable named `url`
	  url = "http://www.alloweb.org/annuaire-startups/annuaire-incubateurs/incubateurs-startups/page/#{pagenum}/?tevolution_sortby=alphabetical"
	end

	doc = Nokogiri::HTML(open(url))
	tabl = []
	#mairie = Hash.new
	mairie = []
	
	doc.xpath('.//*[@class="entry-title"]//a').each do |node|
		tabl << "http://annuaire-des-mairies.com/#{node.text[1..-1]}"
	end
	
	doc.xpath('.//*[@class="lientxt"]').each do |node|
		#mairie["name"] = node.text
		mairie << node.text
	end
	#print mairie
	get_the_email_of_a_townhal_from_its_webpage(tabl, mairie)

end

get_all_the_urls_of_val_doise_townhalls()