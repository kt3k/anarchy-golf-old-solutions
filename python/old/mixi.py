r=raw_input
n=int(r());s=r()
print'*'.join(s[i::n][::i%-2or 1]for i in range(n))