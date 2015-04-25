from math import sin,cos,pi
while 1:
 a=input();N=999;s=0;d=pi/N
 for i in range(N):s+=d*cos(a*sin(pi*i/N))
 print'%7f'%(s/pi)