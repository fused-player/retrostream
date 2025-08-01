import os
import subprocess
if not os.path.exists("./.venv"):
    subprocess.run("python3 -m venv .venv")

else : subprocess.run(f"source .venv/bin/activate && python3 init_rs.py",shell=True)