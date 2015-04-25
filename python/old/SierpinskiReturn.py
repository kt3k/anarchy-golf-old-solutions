def f(n):return n<2and(' /\\ ','/__\\')or[n*' '+x+n*' 'for x in f(n/2)]+[x+x for x in f(n/2)]
for x in f(2**input()/2):print x.rstrip()