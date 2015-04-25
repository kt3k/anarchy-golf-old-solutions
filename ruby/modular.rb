#!ruby -pa
a,b,c=$F.map{|x|x.to_i}
$_=a**(b%~-c)%c