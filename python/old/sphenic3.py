s=9
exec"s+=1;b=[x for x in range(2,s)if s%x<1]\nif len(b)==6and b[5]%b[0]*b[4]%b[1]:print s\n"*753