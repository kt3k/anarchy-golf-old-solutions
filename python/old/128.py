a=''
i=1
d=0x109f911029d74e35bd84156c5635688c0
while d:a=' %s'[i%8>0:]%(d%2)+a;d/=2;i+=1
print a[2:]