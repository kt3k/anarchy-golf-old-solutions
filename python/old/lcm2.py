while 1:
 c,d=map(int,raw_input().split());a=c*d
 while d:c,d=d,c%d
 print a/c