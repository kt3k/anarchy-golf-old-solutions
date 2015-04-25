while 1:
 y=raw_input();x=y[::-1];n=0
 while(y[:n]+x).find(y):n+=1
 print y[:n]+x