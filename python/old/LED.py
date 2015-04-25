a=[x.split("t")for x in" _ t| |t|_|s   t  |t  |s _ t _|t|_ s _ t _|t _|s   t|_|t  |s _ t|_ t _|s _ t|_ t|_|s _ t  |t  |s _ t|_|t|_|s _ t|_|t  |s _ t|_|t| |s   t|_ t|_|s _ t|  t|_ s   t _|t|_|s _ t|_ t|_ s _ t|_ t|  ".split("s")]
for x in a:
 for y in a:
  for k,l in zip(x,y):print k+l