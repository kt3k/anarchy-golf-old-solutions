i=input()
h=-i%4
s=range(i+1)+['_']*h
j=1
for n in range(i+h):print s[~n/2*j],;j*=-1