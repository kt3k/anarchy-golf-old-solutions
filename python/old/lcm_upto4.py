while 1:
 n=1
 r=input()+1
 for i in range(1,r):
  if n%i:x=i;exec"x*=[1,i][x<r];"*9;n*=x/i
 print n