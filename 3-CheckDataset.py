# Colabで実行するために独自に追加したコードです

import subprocess

print("データセットをチェックしたい話者名を入力してください")
speaker_name = input("話者名: ")
print("Running Aivis check-dataset...")

try:
    command = [
        "python", "-m", "Aivis", "check-dataset", speaker_name
    ]
    result = subprocess.run(command, check=True, capture_output=True, text=True)
    print("[INFO] Aivis check-datasetが完了しました。")
    print(result.stdout)
except subprocess.CalledProcessError as e:
    print(f"[ERROR] コマンド実行中にエラーが発生しました:\n{e.stderr}")
except Exception as e:
    print(f"[ERROR] 想定外のエラーが発生しました: {e}")
