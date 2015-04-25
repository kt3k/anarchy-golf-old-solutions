def f(m,n):
 print' '*m+'*'*n
 if m:f(m-1,n+2);print' '*m+'*'*n
f(input()-1,1)