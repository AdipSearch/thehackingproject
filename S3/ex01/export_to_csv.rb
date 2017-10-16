require 'google_drive'
require 'rubygems'
require 'nokogiri'   
require 'open-uri'
require 'csv'


def export_csv(hashes)
  CSV.open("data.csv", "w", headers: hashes.first.keys) do |csv|
    hashes.each do |h|
      csv << h.values
    end
  end
end

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
	export_csv(final_hash)
end


def get_all_the_urls_of_val_doise_townhalls

	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	tabl = []
	#mairie = Hash.new
	mairie = []
	
	doc.xpath('.//*[@class="lientxt"]/@href').each do |node|
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