_=[[ord(x)]for x in raw_input()]
exec"print`[chr(x[0])for x in _]`[2::5]\nfor x in _:y=x[0];x[0]+=(64<y<90)+(96<y<122)-(y in(90,122))*25\n"*26