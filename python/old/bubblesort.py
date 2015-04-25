r=range(input())
t=["%3d"%input()for i in r]
c=s=0
for i in r:
 for j in r[:~i]:b=t[j]>t[j+1];t.insert(j,t.pop(j+b));s+=b;c+=1;print"compare =%3d   swap =%3d   data:"%(c,s)+"".join(t)