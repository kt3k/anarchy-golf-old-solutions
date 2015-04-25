import sys
print sys.stdin.read().replace('?','%s')%tuple(("123456789123","123456789123","123456789123")[id('')%3])