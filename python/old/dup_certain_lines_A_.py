a=file('/dev/fd/0')
b=a.readline().split()
print''.join(x+x*(`i+1`in b)for i,x in enumerate(a))
