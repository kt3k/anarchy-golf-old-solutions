i=input()
h=-i%4
s=range(i+1)+['_']*h
for n in s[1:i+h>>1:2]:print s[-n],n,n+1,s[~n],