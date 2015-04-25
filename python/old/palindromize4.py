f=lambda n,s='':s.find(y)and f(n+1,y[:n]+y[::-1])or s
while 1:y=raw_input();print f(0)