b=['']
for i in raw_input()[::-1]:b+=[i+x for x in-~-(i in b)*b]
print'\n'.join(b)