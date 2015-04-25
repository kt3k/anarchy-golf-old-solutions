def w(s):
 if s[1:]:x=s[-1];k,l,u,v=map(w,q(s[:-1]));return[u,'('+u+')'][x in'*/'and k in'+-']+x+[v,'('+v+')'][x in'*-'and l in'+-'or x>'.'and'X'>l]
 return s
def q(s):
 i=c=1
 while c:c+=2*(s[-i]<'Z')-1;i+=1
 return s[-i],s[-1],s[:-i+1],s[-i+1:]
while 1:print w(raw_input())