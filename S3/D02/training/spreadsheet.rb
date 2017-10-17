require 'google_drive'
require 'rubygems'
require 'nokogiri'   
require 'open-uri'

def send_it_to_drive(hash_list)
	# Authenticate a session with your Service Account
	session = GoogleDrive::Session.from_service_account_key("client_secret.json")

	#Get the spreadsheet by its title
	spreadsheet = session.spreadsheet_by_title("Mairies_du_88")
	# Get the first worksheet
	worksheet = spreadsheet.worksheets.first
	#add a row
	hash_list.each do |row|
		worksheet.insert_rows(worksheet.num_rows + 1, [[row[:ville], row[:email]]])
	end
	#delete from the first row 1 row
	#worksheet.delete_rows(1, 1)
	worksheet.save
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
	send_it_to_drive(final_hash)
end


def get_all_the_urls_of_first_page(url)

	doc = Nokogiri::HTML(open(url))

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

get_all_the_urls_of_first_page("http://www.annuaire-des-mairies.com/vosges.html")
get_all_the_urls_of_first_page("http://www.annuaire-des-mairies.com/vosges-2.html")
