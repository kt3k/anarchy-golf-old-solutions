s=input()
r=s*2
exec"s-=1;k=abs(s);print' '*k+'*'*(r-k+~k);"*r