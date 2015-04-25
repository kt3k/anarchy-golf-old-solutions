_=raw_input()
i=j=-len(_)
while 1:print _[j-i]+(~j*' '[:i%-j]or _[1:][::-(i/-j|1)])+_[i%j];i+=1