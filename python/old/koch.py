a=[[0,0,0,1],[1,2,0,2]]
b=[[2,1,2,0],[0,0,1,0]]
p=lambda x:[i[::-1]for i in x[::-1]]
a+=p(a)
b+=p(b)
c=[''.join(" /\\"[i]for i in x+y)for x,y in zip(a,b)]
for s in c+p(c):print s
