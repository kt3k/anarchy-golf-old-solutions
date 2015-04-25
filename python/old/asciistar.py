s=input()
t=range(s)
for p in t[:0:-1]+t:print' '*p+'*'*(s+s-p+~p)