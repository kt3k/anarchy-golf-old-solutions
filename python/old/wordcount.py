a=''.join(x.lower()for x in open('/dev/fd/0').read()if x.isalpha()or'!'>x).split()
for i in sorted(set(a)):print a.count(i),i