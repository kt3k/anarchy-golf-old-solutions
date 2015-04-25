def f(*a):x,y,z=a;t[a]=t.get(a,(x<=y)*z)or f(f(x-5,y,z),f(y-5,z,x),f(z-5,x,y));return t[a]
t={}
while 1:print f(*map(int,raw_input().split()))