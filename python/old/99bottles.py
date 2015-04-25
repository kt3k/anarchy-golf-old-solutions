a='.\n%s, %s bottle%s of beer on the wall.\n'
e=a[6:-2]+a[4:25]+a
i=99
s='s'
while i-1:print e%(i,s,i,s,'Take one down and pass it around',i-1,(i>2)*s);i-=1
print e%(1,'',1,'','Go to the store and buy some more',99,s)