_=raw_input()
i=0
j=len(_)
while 1:print _[-i]+(~-j*' '[:i%j]or _[1:][::i%-3+1])+_[i%j];i+=1