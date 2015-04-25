def fizzbuzz(n):
  for i in range(1,n+1):
    if i % 15 == 0: yield 'FizzBuzz'
    elif i % 5 == 0: yield 'Buzz'
    elif i % 3 == 0: yield 'Fizz'
    else: yield i

for x in fizzbuzz(100): print x