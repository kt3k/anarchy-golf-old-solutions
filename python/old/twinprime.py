t=a=b=1
while a<2000:
 b*=a;a+=1
 if~b%a<1:
  if a-t==2:print`t`+','+`a`
  t=a