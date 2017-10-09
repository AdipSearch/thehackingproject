i = 1;
b = 0;
while i < 1000 do
   if(i%3==0 || i%5==0)
   	b += i;
   end
   i = i + 1; 
end
puts b;