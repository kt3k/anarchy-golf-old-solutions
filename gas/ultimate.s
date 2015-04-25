.globl main
m:.ascii"42"
main:mov $4,%eax
mov $1,%ebx
mov $m,%ecx
mov $2,%edx
int $128