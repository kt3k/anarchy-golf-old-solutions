#! /usr/bin/env python

import sys

def myopen(target):
    try:
        f = open(target)
    except IOError:
        print 'mydump.py: No such file or directory : "%s"' % target
        sys.exit(1)
    else:
        return f

def dump(target):
    f = myopen(target)
    i = 0
    for c in f.read():
        print '%02X'%ord(c),
        i += 1
        if i%16 == 0:
            print

if __name__ == '__main__':
    if len(sys.argv) == 2:
        dump(sys.argv[1])
    else:
        print "Usage: python mydump.py [target_file]"
