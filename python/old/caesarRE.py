import re
_=raw_input()
_=re.compile('([a-z]|[A-Z])').sub(lambda x:chr(ord(x.group())+1),_)
print _