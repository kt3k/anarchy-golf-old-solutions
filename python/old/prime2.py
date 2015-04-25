p=lambda x,n:[1for i in range(2,x)if x%i<1]or[x]+(n<0and[]or p(x+1,n-1))and p(x+1,n)
print p(2,25)