def trader_du_dimanche(price)
	maxprofit = 0;
	best_buy = nil;
	best_sell = nil;

	#naviguer un range de jours où l'on peut acheter
	(0..(price.length - 2)).each do |date_buy|
		#établir un range de jours où l'on peut vendre
		((date_buy + 1).. price.length - 1).each do |date_sell|
			#regarder le profit entre les 2 jours
			price_difference = price[date_sell] - price[date_buy];

			if price_difference > maxprofit
				best_buy = date_buy;
				best_sell = date_sell;
				maxprofit = price_difference;
			end
		end
	end

	puts "[#{best_buy},#{best_sell}]   # $#{price[best_sell]} - $#{price[best_buy]} == $#{maxprofit}";
end

trader_du_dimanche([17,3,6,9,15,8,6,1,10])