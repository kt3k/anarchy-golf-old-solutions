N=input()
R=range(1,N)
g=lambda n:(n<N)*chr(n%N+48+(n>9)*7)or g(n/N)+g(n%N)
for i in R:print''.join('%3s'%g(j*i)for j in R)