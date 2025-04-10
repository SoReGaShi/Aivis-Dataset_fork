# Aivis create-segments --no-use-demucs の Colab 実行スクリプト
# 必要なパッケージをインストール
!pip install Aivis

# 現在の作業ディレクトリの表示
!pwd
print("作業ディレクトリを確認しました。")

print("Running Aivis create-segments --no-use-demucs...")
try:
    # Aivis create-segments コマンドを実行
    !python -m Aivis create-segments --no-use-demucs
    print("[INFO] Aivis create-segmentsが完了しました。")
except Exception as e:
    print(f"[ERROR] エラーが発生しました: {e}")
    
# オプション: 処理が完了するまで待機する場合はこちらを使用
# from IPython.display import HTML, display
# display(HTML('<script>alert("処理が完了しました")</script>'))
