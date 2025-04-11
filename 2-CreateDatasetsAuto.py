# Colabで実行するために独自に追加したコードです

import subprocess

print("書き起こしやデータのチェックをせずにそのままデータセットを自動で作成します。")
speaker_names = input("話者名を入力してください: ")
print("Running Aivis create-datasets...")

try:
    command = [
        "python", "-m", "Aivis", "create-datasets", "ALL", speaker_names, "--accept-all"
    ]
    result = subprocess.run(command, check=True, capture_output=True, text=True)
    print("[INFO] Aivis create-datasetsが完了しました。")
    print(result.stdout)
except subprocess.CalledProcessError as e:
    print(f"[ERROR] コマンド実行中にエラーが発生しました:\n{e.stderr}")
except Exception as e:
    print(f"[ERROR] 想定外のエラーが発生しました: {e}")
