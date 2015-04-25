f=open('/dev/fd/0')
w=f.next()[:-1]
print eval("((((''.join(f)"+"*n)[::-n].replace(w,' '*len(w))"*4)