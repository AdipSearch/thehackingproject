#puts 'hello world'.bytes
#def h("string", 5)
#	@string = string
#end
def chiffre_de_cesar(a, b)
	d = 0;
	a.each_byte do |c|
		if c >= 65 && c <= 90
			if c+b <= 90
			d = c + b;
			print d.chr;
			else
			d = 65 + (c + b - 90) -1;
			print d.chr;
			end
		elsif c >= 97 && c <= 122
			if c+b <= 122
			d = c + b;
			print d.chr;
			else
			d = 97 + (c + b - 122) -1;
			print d.chr;
			end
		else
			d = c;
			print d.chr;
		end
	end
end

chiffre_de_cesar("What a string!", 5)

