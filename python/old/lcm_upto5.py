f=lambda m,n:n and f(n,m%n)or m
while 1:
 i=n=1;r=input()
 while r/i:n*=i/f(n,i);i+=1
 print n