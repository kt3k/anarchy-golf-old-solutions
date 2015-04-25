import sys
print''.join(reduce(lambda x,y:chr(ord(x)-ord(y)%6+2),z)for z in zip(*sys.stdin)[:-1])