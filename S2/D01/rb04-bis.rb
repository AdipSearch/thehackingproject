def jean_michel_data(corpus, dictionary)
	string = corpus.split;
	i = 0;

	dictionary.each do |key|
		string.each do |var|
			if var == key
				i = i + 1;
			end
		end
		print "'#{key}' == #{i}, ";
		i = 0;
	end
	print string;
end

dictionary = ["les", "et", "Salut"]

jean_michel_data("Salut les nazes et les marouales", dictionary)