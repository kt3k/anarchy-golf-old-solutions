#!ruby -lp
$_+=" is not "[0,4+sub(/00$/){}.to_i%4*4]+"a leap year."