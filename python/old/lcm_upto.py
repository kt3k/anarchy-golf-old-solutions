while 1:
 n=1
 for i in range(1,1+input()):
  c=n;n*=i
  while i:c,i=i,c%i
  n/=c
 print n