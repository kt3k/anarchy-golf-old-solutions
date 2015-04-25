b=['']
for i in raw_input():b=(i in b)*b or zip(('',i)*99,b)
print'\n'.join(map(str,b))