def jean_michel_data(corpus, dictionary)
	string = corpus.split;
	dictionary1 = dictionary.split
	i = 0;

	dictionary1.each do |key|
		string.each do |var|
			if var == key
				i = i + 1;
			end
		end
		print "'#{key}' == #{i}, ";
		i = 0;
	end
end

file = File.open("shakespeare.txt", "rb")
contents = file.read;

file = File.open("bad_words.txt", "rb")
dictionary = file.read;

jean_michel_data(contents, dictionary)
