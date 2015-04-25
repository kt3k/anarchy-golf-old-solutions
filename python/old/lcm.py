g=lambda m,n:n==0and m or g(n,m%n)
while 1:
 c,d=a,b=[int(x)for x in raw_input().split()]
 print a*b/g(a,b)