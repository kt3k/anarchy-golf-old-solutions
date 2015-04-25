f=lambda n:n<2and(' /\\ ','/__\\')or[n*' '+x+n*' 'for x in f(n/2)]+[x*2for x in f(n/2)]
for x in f(2**input()/2):print x.rstrip()