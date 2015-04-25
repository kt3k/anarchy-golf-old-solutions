s=9
exec"""c=t=1;s+=1;k=s
for x in range(2,s/5):
 if~t%x+k%x<1:k/=x;c+=1
 t*=x
if k*c==4:print s
"""*753