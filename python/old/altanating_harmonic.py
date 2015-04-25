i=j=k=1
exec"print`i`+'/'+`j`;k+=1;i=i*k+j*(k%2*2-1);j*=k;m=j;n=i\nwhile n:m,n=n,m%n\ni/=m;j/=m;"*20