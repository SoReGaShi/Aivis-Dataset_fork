# Colabで実行するために独自に追加したコードです

print("書き起こしやデータのチェックをせずにそのままデータセットを自動で作成します。")
speaker_names = input("話者名を入力してください: ")
print("Running Aivis create-datasets...")

try:
    # Aivis create-datasets コマンドを実行
    python -m Aivis create-datasets ALL {speaker_names} --accept-all
    print("[INFO] Aivis create-datasetsが完了しました。")
except Exception as e:
    print(f"[ERROR] エラーが発生しました: {e}")
  
