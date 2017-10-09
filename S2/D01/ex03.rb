=begin
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
=end

def trader_du_lundi(shares)
	i = 0;
	share_names = shares.flat_map { |day_table| day_table.keys }.uniq
	tabl_ord = share_names.map { |name| shares.map { |day_table| day_table[name] } }

	while i < tabl_ord.length
		trader_du_dimanche(tabl_ord[i], i, share_names);
		i = i + 1
	end
end

def trader_du_dimanche(tabl_ord, i, share_names)
	maxprofit = 0;
	best_buy = nil;
	best_sell = nil;

	#naviguer un range de jours où l'on peut acheter
	(0..(tabl_ord.length - 2)).each do |date_buy|
		#établir un range de jours où l'on peut vendre
		((date_buy + 1).. tabl_ord.length - 1).each do |date_sell|
			#regarder le profit entre les 2 jours
			price_difference = tabl_ord[date_sell] - tabl_ord[date_buy];

			if price_difference > maxprofit
				best_buy = date_buy;
				best_sell = date_sell;
				maxprofit = price_difference;
			end
		end
	end

	puts "#{share_names[i]} : [#{best_buy},#{best_sell}]   # $#{tabl_ord[best_sell]} - $#{tabl_ord[best_buy]} == $#{maxprofit}";
end

shares = [{ :GOO => 15, :MMM => 14, :ADBE => 12, :EA=> 13, :BA => 8, :KO => 10, :XOM => 20, :GPS => 7, :MCD => 11, :DIS => 15, :CRM => 6, :JNJ => 10 },
	{ :GOO => 8, :MMM => 20, :ADBE => 3, :EA=> 10, :BA => 5, :KO => 19, :XOM => 12, :GPS => 6, :MCD => 15, :DIS => 9, :CRM => 10, :JNJ => 17 },
	{ :GOO => 3, :MMM => 8, :ADBE => 15, :EA=> 5, :BA => 10, :KO => 5, :XOM => 15, :GPS => 13, :MCD => 10, :DIS => 18, :CRM => 5, :JNJ => 14 },
	{ :GOO => 17, :MMM => 3, :ADBE => 6, :EA=> 9, :BA => 15, :KO => 6, :XOM => 8, :GPS => 1, :MCD => 10, :DIS => 15, :CRM => 18, :JNJ => 3 },
	{ :GOO => 8, :MMM => 18, :ADBE => 4, :EA=> 6, :BA => 15, :KO => 18, :XOM => 3, :GPS => 12, :MCD => 19, :DIS => 3, :CRM => 7, :JNJ => 9 },
	{ :GOO => 10, :MMM => 12, :ADBE => 8, :EA=> 3, :BA => 18, :KO => 20, :XOM => 5, :GPS => 11, :MCD => 3, :DIS => 9, :CRM => 8, :JNJ => 15 },
	{ :GOO => 17, :MMM => 14, :ADBE => 2, :EA=> 17, :BA => 7, :KO => 13, :XOM => 1, :GPS => 15, :MCD => 15, :DIS => 10, :CRM => 9, :JNJ => 17 }];

	trader_du_lundi(shares);