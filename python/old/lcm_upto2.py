while 1:
 n=1
 r=range(1,1+input())
 for i in r:n*=[x for x in r if i%x<1][n%i>0]
 print n