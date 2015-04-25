for n in range(195):
 s=`n+1`
 while s!=s[::-1]:s=str(int(s)+int(s[::-1]))
 print s