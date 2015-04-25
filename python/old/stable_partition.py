a=raw_input()
exec"print''"+"+filter(a[0].__%s__,a)"*3%('gt','eq','lt')