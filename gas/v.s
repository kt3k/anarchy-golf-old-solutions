.globl main
m:.ascii"v"
main:mov $4,%al
mov $1,%ebx
mov $m,%ecx
mov $1,%edx
int $128