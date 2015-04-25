a=raw_input()
i=len(a)
exec"i=j=i-1\nwhile a[j:]:j+=1;print a[i:j]\n"*i