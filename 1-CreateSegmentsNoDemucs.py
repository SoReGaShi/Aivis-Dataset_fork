# Colabで実行するために独自に追加したコードです

import subprocess

print("Running Aivis create-segments --no-use-demucs...")

try:
    subprocess.run(["python", "-m", "Aivis", "create-segments", "--no-use-demucs"], check=True)
    print("[INFO] Aivis create-segmentsが完了しました。")
except Exception as e:
    print(f"[ERROR] エラーが発生しました: {e}")
