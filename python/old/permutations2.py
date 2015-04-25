i=1
while i<8**6:
 j='76%06o'%i;i+=7
 if len(set(j))>7:print' '.join(j[2:])