require 'rubygems'
require 'nokogiri'   
require 'open-uri'

def exchange_price(nom)
	final_hash = []
	exchange_price = []
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	doc.xpath('.//*[@class="price"]').each do |node|
		exchange_price << node.text
	end
	final_hash = nom.zip(exchange_price).map { |nom, price| {crypto: nom, price: price} }
	print final_hash
end

def get_all_the_infos
	nom_crypto = []
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	doc.xpath('.//*[@class="no-wrap currency-name"]//a').each do |node|
		nom_crypto << node.text
	end
	exchange_price(nom_crypto)
end


get_all_the_infos()