a="a"*18
c="c"*7
d="d"*8
e="e"*14
g="g"*10
for x in[a+"b"*15]*15+[a+c+d]*3+[e+"f"*4+c+d]*4+[e+g+"h"+d]+[e+g+"i"*9]*9:print' '+' '.join(x)