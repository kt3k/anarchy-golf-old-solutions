s='"\'{[:\\$%`#.@?*-'
j=-15
exec"j+=1;i=14-abs(j);print s[:i]+s[i]*(47-i*2)+s[i::-1];"*29