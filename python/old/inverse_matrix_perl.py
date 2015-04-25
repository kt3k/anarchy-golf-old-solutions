import os
os.system('perl -e \'for$m(@m=(map[split,@a=(!@a,@a[0..7])],<>)[-2..6]){$@=$$m[$i++];$_/=$@for@$m;$m==$_||($b=$$_[$i-1],map$_-=$b*$$m[$j++%18],@$_)for@m}print"@{[map+int$_+.5*($_<=>0),@$_[9..17]]}\n"for@m\'')
print 6