for s in range(4,763):
 c=t=u=1
 for x in range(1,s/5):
	if~t%x+s%x<1:c+=1;u*=x
	t*=x
 if u/s*c==5:print s