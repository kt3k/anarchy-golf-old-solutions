f=lambda s:(str,f)[s[-1:]>'Z'](s[:-1])+s[-1:].swapcase()
a=raw_input()
exec"print a;a=f(a);"*2**len(a)