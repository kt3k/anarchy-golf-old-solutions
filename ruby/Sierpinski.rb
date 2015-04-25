a=' /\ ','/__\\'
_=' '
?2.upto(getc){_*=2;a=a.map{|x|_+x+_}+a.map{|x|x+x}}
puts a.map{|x|x.rstrip}