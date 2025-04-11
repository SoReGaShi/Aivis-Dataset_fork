# Colabで実行するために独自に追加したコードです

print("Running Aivis create-segments --no-use-demucs...")

try:
    # Aivis create-segments コマンドを実行
    python -m Aivis create-segments --no-use-demucs
    print("[INFO] Aivis create-segmentsが完了しました。")
except Exception as e:
    print(f"[ERROR] エラーが発生しました: {e}")
