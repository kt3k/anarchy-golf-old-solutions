def w(s):
 if s[1:]:
  x=s[-1];u,v=q(s[:-1]);u,v,k,l=w(u),w(v),u[-1],v[-1]
  if x in'*/'and k in'+-':u='('+u+')'
  if x in'*-'and l in'+-'or x=='/'and l in'+-/*':v='('+v+')'
  return u+x+v
 return s
def q(s):
 i=c=1
 while 1:
  if not c:return s[:-i+1],s[-i+1:]
  if s[-i]in'+-*/':c+=1
  else:c-=1
  i+=1
while 1:print w(raw_input())