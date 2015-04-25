n=b='\n'
for i in raw_input()[::-1]:b+=b.replace(n,n+i)*-~-(i in b)
print b[1:]