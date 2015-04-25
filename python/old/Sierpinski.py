def f(n):
 if n<2:return' /\\ ','/__\\'
 return[n*' '+x+n*' 'for x in f(n/2)]+[x+x for x in f(n/2)]
for x in f(2**input()/2):print x.rstrip()