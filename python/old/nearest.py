while 1:
 a=map(int,raw_input().split());f=a.index;_=[]
 for x in a:
  g=f(x);m=min([abs(f(z)-g)for z in a[max(g-10,0):g+10] if z<x]+['_'])
  _.append(str((m>''and m)or((g-m<0or(g+m<len(a)and a[g+m]<a[g-m]))and g+m)or g-m))
 print' '.join(_)