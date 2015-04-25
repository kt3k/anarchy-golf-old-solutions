gets
12.times{puts$_;gsub!(/(.)\1*/){[$&.size,$1]}}