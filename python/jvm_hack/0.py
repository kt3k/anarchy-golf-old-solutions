java='class A{public static void main(String[]a){for(;;);}}'
open("a.java","w").write(java)
import os
print os.popen("javac -g:none -nowarn a.java;ls").read()
#print os.popen("javac -h").read()
print `open("A.class").read()`