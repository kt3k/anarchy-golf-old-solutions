a=zip((1,0,1,1,0,1,1,1,1,1,1,0,1,0,1,1),(4,6,7,7,5,3,3,6,5,5,5,3,2,7,3,3),(5,6,3,7,6,7,5,6,5,6,4,5,3,5,3,2))
b="  ||||   _ _ _ _    ||||"
for x in a:
 for y in a:i=0;exec"print b[x[i]::8]+b[y[i]::8];i+=1;"*3