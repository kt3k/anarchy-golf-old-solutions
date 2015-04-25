while 1:
 a=raw_input()
 i=4;s=0;c=0
 if a[15:]:
	for x in a[4:-1]:s+=x<':'and int(x)*(1+i%2*2);c+=i*(':'<x);i+=1
	i=0
	while-(s+i*(1+c%2*2))%10!=int(a[-1]):i+=1
	print a[:c]+`i`+a[c+1:]
 else:
	for x in a[4:-1]:s+=x<':'and int(x)*(14-i);c+=i*(':'<x);i+=1
	if c:
	 d=(a[-1]>'9')*10or int(a[-1]);i=0
	 while-(s+i*(14-c))%11!=d:i+=1
	 print a[:c]+`i`+a[c+1:]
	else:X=-s%11;print a[:-1]+(X/10*'X'or`X`)
