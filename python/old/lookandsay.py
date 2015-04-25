s=raw_input()
exec"print s;i=t='';n=0\nfor c in s+'u':t+=(c!=i)*(`n`+i);n=n*(c==i)+1;i=c\ns=t[1:];"*12