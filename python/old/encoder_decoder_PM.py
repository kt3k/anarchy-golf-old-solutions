s=open('/dev/fd/0').read()[7:]
exec"s=s[::2]+s[2009::-2];"*[1,2009]['Lp'<s]
print s