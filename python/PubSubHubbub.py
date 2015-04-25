class MyElement(object):
    Tail = 'ub'
    def __init__(self, chr):
        self.chr = chr
    def __str__(self):
        return self.chr + self.Tail

class MyElementContainer(object):
    Separator = ''
    def __init__(self, elements):
        self.elements = map(MyElement, elements)
    def __str__(self):
        return self.Separator.join(map(str, self.elements))

if __name__ == '__main__':
    print MyElementContainer('PSHb')