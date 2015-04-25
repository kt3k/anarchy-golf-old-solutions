exec"""a=raw_input();_=''
while a:
 l='1';b=a.find(l)*2;s=b+int(a[:b+1],2);n=int(l+a[b+1:s],2);a=a[s:];x=y=c=-1;m=0
 while n:
	x,y=y,x+y;c+=1
	if-n>y:n+=x;m+=10**c;x=y=c=-1
 _+=str(m)[::-1]+l
print _;"""*15