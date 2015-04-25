_=`input()`
exec"print _;t=[1]\nfor x in _:t+=(x!=t[-1])*[0,x];t[-2]+=1\n_=`t`[4::4];"*12