a=zip(*[(int(x)for x in y)for y in"1011011111101011","4677533655532733","5637675656453532"])
b="  ||||   _ _ _ _    ||||"
for x in a:
 for y in a:i=0;exec"print b[x[i]::8]+b[y[i]::8];i+=1;"*3