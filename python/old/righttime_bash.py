import os
os.system('TZ=right/UTC xargs -i date -d@{} +%F\ %T')