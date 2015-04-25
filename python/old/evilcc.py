import os as s
a=''
while 1:
 try:a+=raw_input()+'\n'
 except:break
print a
open('test_.c','w').write(a)
print s.popen('cc -o a.out test_.c;a.out').read()