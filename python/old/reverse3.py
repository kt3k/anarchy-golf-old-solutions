a=''
for i in open('/dev/fd/0'):a=i.rstrip()+'\n'+a
print a