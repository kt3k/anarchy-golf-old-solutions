import re
while 1:print re.sub(r'^(.+?)\1+$',r'\1',raw_input())