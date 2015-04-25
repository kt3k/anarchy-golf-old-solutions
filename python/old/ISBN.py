while 1:
 a=raw_input()
 if len(a)<15:
  i=10
  sum=0
  ch=0
  for x in a[4:-1]:
   if':'>x:
    sum+=int(x)*i
   else:ch=i
   i-=1
  if ch:
   d=a[-1]>'9'and 10or int(a[-1])
   i=0
   while-(sum+i*ch)%11!=d:i+=1
   print a[:14-ch]+`i`+a[15-ch:]
  else:X=-sum%11;print a[:-1]+(X/10*'X'or`X`)
 else:
  i=4
  sum=0
  ch=0
  for x in a[4:-1]:
   if':'>x:
    sum+=int(x)*(1+i%2*2)
   else:ch=i
   i+=1
  i=0
  while-(sum+i*(1+ch%2*2))%10!=int(a[-1]):i+=1
  print a[:ch]+`i`+a[ch+1:]
  