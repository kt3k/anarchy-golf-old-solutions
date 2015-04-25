while 1:
 n=1
 for i in range(1,1+input()):
  if n%i:
   x=2
   while i%x:x+=1
   n*=x
 print n