for i in range(512):print'%04o is'%i,''.join('x-rw'[~i>>9-j&1or j%-3]for j in range(10))