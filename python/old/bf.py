t=[0]*1000
i=0
l=0
p=open('/dev/fd/0').read()
#print p
bf=''
n='\n'
s=' '
o=''
while p:
 h=1
 if p[0]=='+':
  while p[h]=='+':h+=1
  bf+=n+s*l+'t[i]+=%s'%h
 elif p[0]=='-':bf+=n+s*l+'t[i]-=1'
 elif p[0]=='[':bf+=n+s*l+'while t[i]:';l+=1
 elif p[0]==']':bf+=n+s*l+'';l-=1
 elif p[0]=='>':bf+=n+s*l+'i+=1'
 elif p[0]=='<':bf+=n+s*l+'i-=1'
 elif p[0]=='.':bf+=n+s*l+'o+=chr(t[i])'
 elif p[0]==',':bf+=n+s*l+'input'
 p=p[h:]

#print bf

exec bf
print o