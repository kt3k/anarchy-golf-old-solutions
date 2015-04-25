a=''
i=1
d=int('l96o54kfn6hz7pt164dqflj4',36)
while i%129:d,a,i=d/2,' %s'[i%8>0:]%(d%2)+a,i+1
print a[1:]