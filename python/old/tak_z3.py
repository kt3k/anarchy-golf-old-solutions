s="f(%r+'-5',%r,%r)"
def f(x,y,z):return eval(x)<=eval(y)and eval(z) or f(s%(x,y,z),s%(y,z,x),s%(z,x,y))
for i in range(2):print f(*raw_input().split())