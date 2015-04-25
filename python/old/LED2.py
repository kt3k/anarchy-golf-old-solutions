a=" ||_ _ ||s       ||s  |___ | s   ___ ||s |  _  ||s | ___  |s ||___  |s   _   ||s ||___ ||s | __  ||s ||__  ||s || __  |s ||_ _   s  | __ ||s ||___   s ||__    ".split("s")
for x in a:
 for y in a:i=0;exec"print x[i::3]+y[i::3];i+=1;"*3