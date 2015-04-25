_=raw_input()
for i in range(26):print`[64<ord(x)<91and chr((ord(x)-65+i)%26+65)or 96<ord(x)<123and chr((ord(x)-97+i)%26+97)or x for x in _]`[2::5]