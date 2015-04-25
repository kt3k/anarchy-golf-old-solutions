a=' /\ ','/__\\'
_=' '
for x in~-input()*_:_*=2;a=[_+x+_ for x in a]+[x*2for x in a]
for x in a:print x.rstrip()