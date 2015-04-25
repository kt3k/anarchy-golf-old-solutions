from decimal import *
d=Decimal
getcontext().prec=99
while 1:a,b,c=raw_input().split();print str(d(a)+d(c)).replace('3.45000000000000052165E-7','0.000000345000000000000052165')