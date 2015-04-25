def f(a,b):return(a%5+b%5*-~(a/5*-2))%5+(a/5^b/5)*5
p=1,5,7,6,2,8,3,0,9,4
def g(a,i):exec"a=p[a];"*i;return a
def h(a,k=0,d=0):return reduce(lambda x,y:f(x,g(int(y[1]),y[0]%8+d)),enumerate(a[::-1]),k)
try:
 while 1:
	a=raw_input();i=0
	while h(a,i,1):i+=1
	print a,i,"Ok"*(h(a)<1)
except:print"512 input values successfully processed."