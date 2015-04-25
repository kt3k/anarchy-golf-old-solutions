while 1:print''.join(str(x=='+'and 1or x in'ABCabc'and 2or x in'DEFdef'and 3or
x in'GHIghi'and 4or x in'JKLjkl'and 5or x in'MNmn'and 6or x
in'PRSprs'and 7or x in'TUVtuv'and 8or x in'WXYwxy'and 9or x=='-'and'*'or x
in'OQZoqz'and'0'or x)for x in raw_input())