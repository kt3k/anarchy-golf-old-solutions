#ref id:yupo5656:20061112

import os

file='hello_world.c'

src=""".globl main
m:.ascii"v"
main:mov $4,%al
mov $1,%ebx
mov $m,%ecx
mov $1,%edx
int $128
"""

c='''
#include <asm/unistd.h>
#define __syscall_return(type, res) (type)(res)

#define _syscall1(type,name,type1,arg1) type name(type1 arg1) { long __res; __asm__ volatile ("push %%ebx ; movl %2,%%ebx ; int $0x80 ; pop %%ebx"         : "=a" (__res)         : "0" (__NR_##name),"ri" ((long)(arg1)) : "memory"); __syscall_return(type,__res); }

#define _syscall3(type,name,type1,arg1,type2,arg2,type3,arg3) type name(type1 arg1,type2 arg2,type3 arg3) { long __res; __asm__ volatile ("push %%ebx ; movl %2,%%ebx ; int $0x80 ; pop %%ebx"         : "=a" (__res)         : "0" (__NR_##name),"ri" ((long)(arg1)),"c" ((long)(arg2)),                   "d" ((long)(arg3)) : "memory"); __syscall_return(type,__res); }

inline _syscall1(int, exit, int, status);
inline _syscall3(int, write, int, fd,  const void*, buf, unsigned long, count);

void hello() {
  write(1, "v\\n", 1);
  exit(0);
}

'''

open(file,'w').write(c)

os.system('gcc -m32 -Os -fno-builtin -fomit-frame-pointer -fno-ident -c hello_world.c;ld -m elf_i386 --entry=hello -o hello hello_world.o;ls -l;chmod +x hello;strip -s hello;./hello;ls -l hello')

print `open('hello').read()`