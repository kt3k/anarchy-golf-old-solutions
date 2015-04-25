i=list(raw_input()+'  ')
a=b=c=d=''
while i:a,b,c=i.pop(0),a,b;d+=' #'[5>(a>'!')+(b>'!')*2+(c>'!')*4>0]
print d