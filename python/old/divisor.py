for i in range(input()):print'%s:'%-~i+' '.join(`x`for x in range(1,i+2)if~i%x<1)