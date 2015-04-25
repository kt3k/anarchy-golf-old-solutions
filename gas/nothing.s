.globl main
m:.ascii"*NOTHING*"
main:mov $4,%eax
mov $1,%ebx
mov $m,%ecx
mov $9,%edx
int $128