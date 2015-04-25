#!ruby -n
a=chomp.gsub(/./){$&+$'+$`+$/}.sort
puts"#{a.index$_+$/} #{a.join.scan /.$/}"