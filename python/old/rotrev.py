a=list(open('/dev/fd/0'))
print''.join([a.pop()]+a)