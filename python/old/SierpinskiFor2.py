a=['/\\','/__\\']
_=2
j=2**input()
while len(a)<j:
 m=_;_=_*2+2
 for x in a*1:a+=[x+' '*m+x];m-=2
for x in a:j-=1;print' '*j+x