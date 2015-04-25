_='@<>@{}@()@[]@'
while _:
 a=raw_input()
 while'!'>a>'':a=a[1:]+' '
 for x,y in zip(_[1:],_):a=a.replace(x,y)
 print a[::-1]