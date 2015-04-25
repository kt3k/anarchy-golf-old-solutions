def t(x,y,z):return x>y and t(t(x-1,y,z),t(y-1,z,x),t(z-1,x,y))or y
while 1:
 _=t(*[float(x)for x in raw_input().split()])
 try:_=int(_)
 except:pass
 print _