import sys
f=lambda x,y:int(x[1])-int(y[1])
for i,(j,k) in enumerate(sorted(dict(sorted([(' '.join(x.split()[:-1]),x.split()[-1])for x in sys.stdin],f)).items(),f)[::-1]):print i+1,j,k