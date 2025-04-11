# Colabで実行するために独自に追加したコードです

import os
import subprocess

print("Running Aivis create-segments --trim-silence...")

try:
    subprocess.run(["python", "-m", "Aivis", "create-segments", "--trim-silence"], check=True)
    print("[INFO] Aivis create-segmentsが完了しました。")
except Exception as e:
    print(f"[ERROR] エラーが発生しました: {e}")
