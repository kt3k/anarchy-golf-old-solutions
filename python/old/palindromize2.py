def p(n):
 while len(n)>1:
	if n[0]!=n[-1]:return 1
	n=n[1:-1]
while 1:
 y=_=raw_input();s=''
 while p(_+s):s=y[0]+s;y=y[1:]
 print _+s