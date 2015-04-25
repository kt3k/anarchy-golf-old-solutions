i=j=k=1
f=lambda m,n:m*(n<1)or f(n,m%n)
while k<21:l=f(i,j);print'%s/%s'%(i/l,j/l);k+=1;i=i*k+j*(k%2*2-1);j*=k