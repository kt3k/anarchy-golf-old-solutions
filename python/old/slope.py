d=''
p='	'*99
t=[p]*89
r=range(99)
try:
 while 1:t+=[d+raw_input()+p,p];d+=' '
except:
 t+=[p]*199
 for x in['	'.join(t[i+j][j]for j in r).rstrip('	')for i in r]:
  if x>p:print x.replace('	',' ')