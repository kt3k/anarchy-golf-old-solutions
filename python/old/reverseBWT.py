while 1:a,b=raw_input().split();c=b;exec"c=sorted(zip(b,c));"*40;print`c[int(a)]`[2:len(b)*6:6]