t=lambda s:lambda:s()-5
def f(x,y,z):return x()<=y()and z or f(f(t(x),y,z),f(t(y),z,x),f(t(z),x,y))
while 1:print f(*[lambda:eval(i)for i in raw_input().split()])()