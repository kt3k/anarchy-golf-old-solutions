t=open('/dev/fd/0').read()[7:]
print''.join(t[-(id('')%-3)**i*~i/2or min(i*2,4021-i*2)]for i in range(2011))