def f(s):
 n=-1
 while s[n:]>'Z'and s[:n]:n-=1
 return s[:n]+s[n:].swapcase()
a=raw_input()
exec"print a;a=f(a);"*2**len(a)