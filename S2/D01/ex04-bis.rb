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
end

file = File.open("shakespeare.txt", "rb")
contents = file.read;

dictionary = ["the", "of", "and", "to", "a", "in", "for", "is", "on", "that", "by", "this", "with", "i", "you", "it", "not", "or", "be", "are"];
jean_michel_data(contents, dictionary)
