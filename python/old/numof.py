k=0
for i in range(256):k*=10;exec"k+=i%2;i/=2;"*8
print'0%d'%k