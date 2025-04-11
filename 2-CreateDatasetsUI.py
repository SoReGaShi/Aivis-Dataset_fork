# Colabで実行するために独自に追加したコードです

print("話者名を入力してください（複数の場合は空白含まない`,`区切り）")
speaker_names = input("話者名: ")
print("Running Aivis create-datasets...")

try:
   # Aivis create-datasets コマンドを実行
   python -m Aivis create-datasets ALL "{speaker_names}"
   print("[INFO] Aivis create-datasetsが完了しました。")
except Exception as e:
   print(f"[ERROR] エラーが発生しました: {e}")
