a=' /\ ','/__\\'
_=' '
exec"_*=2;a=[_+x+_ for x in a]+[x*2for x in a];"*~-input()
for x in a:print x.rstrip()