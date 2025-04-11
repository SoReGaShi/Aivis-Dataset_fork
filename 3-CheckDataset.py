# 

print("データセットをチェックしたい話者名を入力してください")
speaker_name = input("話者名: ")
print("Running Aivis check-dataset...")

try:
   # Aivis check-dataset コマンドを実行
   !python -m Aivis check-dataset {speaker_name}
   print("[INFO] Aivis check-datasetが完了しました。")
except Exception as e:
   print(f"[ERROR] エラーが発生しました: {e}")
  
