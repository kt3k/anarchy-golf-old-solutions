N=input()
R=range(1,N)
g=lambda n,h=0:chr(n+48+(n>9)*7-(n<1)*h)
for i in R:print''.join(' '+g(j*i/N,16)+g(j*i%N)for j in R)