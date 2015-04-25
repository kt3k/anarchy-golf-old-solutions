b=''
for i in raw_input()[::-1]:i='\n'+i;b+=(i+b.replace('\n',i))*-~-(i in b)
print b