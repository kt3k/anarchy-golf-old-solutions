_=raw_input;w=_()
print'\n'.join(eval("[`_`[2::5].replace(w,len(w)*' ')for _ in zip(*("*4+"_(),"*12+")[::-1])]"*4))