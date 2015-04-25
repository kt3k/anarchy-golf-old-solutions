r=input()
d=range(-r,r+1)
for y in d:print''.join(" *"[x*x+y*y<=r*r]for x in d)