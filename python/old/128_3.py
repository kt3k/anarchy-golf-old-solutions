a=''
d=0x64d7bf4091c633bcac99e0b208f18f8d04c2158da2c0352d9c5743237
while d:a='01 '[d%3]+a;d/=3
print a[1:]