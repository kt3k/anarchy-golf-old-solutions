def wat(s):
 if len(s)<=1:
  return s
 else:
  infix=s[-1]
  u,v=sep(s[:-1])
  #print'u=%s'%u,'infix=%s'%infix,'v=%s'%v
  if infix in'*':
   if u[-1]in'+-':u=paren(wat(u))
   else:u=wat(u)
   if v[-1]in'+-':v=paren(wat(v))
   else:v=wat(v)
  if infix in'/':
   if u[-1]in'+-':u=paren(wat(u))
   else:u=wat(u)
   if v[-1]in'+-/*':v=paren(wat(v))
   else:v=wat(v)
  elif infix in'+':
   u=wat(u)
   v=wat(v)
  elif infix in'-':
   u=wat(u)
   if v[-1]in'-+':v=paren(wat(v))
   else:v=wat(v)
  return u+infix+v

def paren(s):
 return'('+s+')'

def sep(s):
 c=1
 i=1
 while 1:
  if not c:
   return s[:-i+1],s[-i+1:]
  if s[-i]in'+-*/':
   c+=1
  else:
   c-=1
  i+=1

while 1:print wat(raw_input())
 