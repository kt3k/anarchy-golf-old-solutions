.globl main
m:.ascii"Hello, world!"
main:mov $4,%eax
mov $1,%ebx
mov $m,%ecx
mov $13,%edx
int $128