a='.\n%s, %s shinichiro%s of hamaji on the wall.\n'
e=a[6:-2]+a[4:31]+a
i=99
s='es'
while i-1:print e%(i,s,i,s,'Take one down and pass it around',i-1,s*(i>2));i-=1
print e%(1,'',1,'','Go to the store and buy some more',99,s)