class Node(object):
    def __init__(self, value=None, parent=None, color='BLACK'):
        self.value = value
        self.parent = parent
        self.color = color
        self.left = None
        self.right = None
        self.balance()
    def insert(self, v):
        if not self.value:
            self.value = v
            self.color = 'RED'
            self.left = self.__class__(parent=self)
            self.right = self.__class__(parent=self)
        elif self.value > v:
            self.left.insert(v)
        elif self.value < v:
            self.right.insert(v)
    def balance(self):
        if not self.parent:
            self.color = 'BLACK'
        elif self.parent.color == 'BLACK':
            pass
        elif self.parent.color == 'RED':
            pass
    def __nonzero__(self):
        return self.value != None
    def __str__(self):
        if self.value:
            return '('+bool(self.left)*(str(self.left)+',')+str(self.value)+':'+self.color+bool(self.right)*(','+str(self.right))+')'
        else:
            return ''

b=Node()
print b
b.insert('3')
print b
b.insert('10')
print b