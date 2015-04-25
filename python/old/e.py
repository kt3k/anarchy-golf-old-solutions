f=lambda x:x<2or x*f(x-1)
print sum(10**100/f(i)for i in range(70))+36