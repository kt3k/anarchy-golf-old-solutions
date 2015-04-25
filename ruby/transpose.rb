a=open('/dev/fd/0')
(0..40).zip(*a){|x|$><<x}