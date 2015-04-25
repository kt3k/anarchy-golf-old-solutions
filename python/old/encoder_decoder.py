t=open('/dev/fd/0').read()[7:]
print((''.join(x+y for x,y in zip(t,t[::-1])))[:len(t)],t[::2]+t[-2::-2])[id('')%3]