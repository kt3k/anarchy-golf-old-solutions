n=input()
X=' '*n+'X'
m=1
exec"print X[-m:]+X[m*2:];n-=2;m+=n>0or-1;"*n