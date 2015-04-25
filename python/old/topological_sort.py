b=set()
a=[set(map(int,l[3:].split()))for l in open('/dev/fd/0')]
while 1:l=min(i+1for i,k in enumerate(a)if not(k-b or i+1in b));b.add(l);print l