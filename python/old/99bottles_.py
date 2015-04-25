a='.\n%s, %s bottle%s of beer on the wall.\n'
e=a[6:-2]+a[4:25]+a
i=99
s='s'
while i:b=i>1;print e%(i,b*s,i,b*s,b*'Take one down and pass it around'or'Go to the store and buy some more',i-1or 99,s[:i^2]);i-=1