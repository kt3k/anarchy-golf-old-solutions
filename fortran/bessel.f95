do i=1,60
read(*,*)a
s=0
N=999
pi=atan(1.)*4
d=pi/N
do j=0,N-1
s=s+cos(a*sin(j*pi/N))*d
enddo
print'(F8.6)',s/pi
enddo
end