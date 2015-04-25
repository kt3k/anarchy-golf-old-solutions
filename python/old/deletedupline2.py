m=''
for x in file('/dev/fd/0'):m+=x*-~-(x in m)
print m