print''.join(reduce(lambda x,y:chr(ord(x)-ord(y)%6+2),z)for z in zip(*eval((2,11,21)[id('')%3]*"raw_input(),")))