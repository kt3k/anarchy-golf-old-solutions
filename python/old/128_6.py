y=lambda n,s='':return s*(len(s)>7)or y(n/2,s=`n%2`+s)
import struct
struct.unpack