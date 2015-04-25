r=raw_input
s=r()
exec len(s)%80%45*"s=''.join(chr(ord(x)-ord(y)%6+2)for x,y in zip(s,r()));"
r(s)