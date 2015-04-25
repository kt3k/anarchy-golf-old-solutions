i=0
exec"print'%04o'%i,'is',''.join(i>>9-j&1and'xrw'[j%3]or'-'for j in range(10));i+=1;"*512