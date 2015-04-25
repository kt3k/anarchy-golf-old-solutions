def d(n,*v):
 if()==v:return n[0]
 else:return sum((-1)**k*i*d(*([x[:k]+x[k+1:]for x in v]))for k,i in enumerate(n))
def g(n,m):return m==0and n or g(m,n%m)
a=[[int(j)for j in raw_input().split()]for i in[2]*9]
b=[[j==i and 1or 0for j in range(9)]for i in range(9)]
for i in a: print i
for i in b: print i