_=raw_input();exec"print _;_=''.join(chr(ord(_)+_.isalpha()-'zZ'.count(_)*26)for _ in _);"*26