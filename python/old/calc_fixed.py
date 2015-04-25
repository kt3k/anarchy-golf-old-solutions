while 1:
 a=r=''
 for e in raw_input():
  if'.'>e:r='(%s)'%r;e=' %s '%e
  r+=e;a+=e
 print a,'=',eval(r)