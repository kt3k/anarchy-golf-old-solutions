q=''.join
s=input()
r=raw_input()
t=q(c*s for c in r)+'\n'
u=q(c+' '*(s-2)+c for c in r)+'\n'
print t,u*(s-2),t