while 6:
 a=raw_input();m=s=[]
 while a:
  x=a[0];a=a[1:]
  if x in'{[<(':s+=[x]
  elif 0<ord(x)-ord(s[-1])<3:s.pop()
  else:m=x+a;s=a=0
 print([]==s)*'yes'or'failed at: '+(s and'EOL'or m)