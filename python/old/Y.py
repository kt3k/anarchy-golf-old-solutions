import os
n=0
for i in os.read(0,1e4):
 if'Y'==i:print n
 n+=1