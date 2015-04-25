begin:
 i=1
 loop:
  begin:
   cond:
    (i>5):break()
    ((i/15)==1):say"FizzBuzz"
    ((i/5)==1):say"Buzz"
    ((i/3)==1):say"Fizz"
    else:say i
   i=i+1