exec"a=''"+"+raw_input()"*8
for c in sorted(set(a)):print'%c:%3d'%(c,a.count(c))