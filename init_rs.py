import subprocess
from screeninfo import get_monitors

for m in get_monitors():
    width = m.width
    height = m.height
    print(width,height)



with open(".env", "w") as f:
    f.write(f"RS_WIDTH={width}\n")
    f.write(f"RS_HEIGHT={height}\n")
    f.write(f"DISPLAY=:1\n")
