a=raw_input()
i=0
exec"i+=2;print('0 1 '*99)[i:i+%s*2-1];"%a[2:]*int(a[:2])