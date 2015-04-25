a=input()
b=''
while a:b=chr(a&127)+b;a>>=7
print b