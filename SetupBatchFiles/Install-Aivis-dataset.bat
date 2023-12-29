chcp 65001 > NUL
@echo off

@REM https://github.com/Zuntan03/EasyBertVits2 より引用・改変

pushd %~dp0
set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass

set CURL_CMD=C:\Windows\System32\curl.exe
if not exist %CURL_CMD% (
	echo [ERROR] %CURL_CMD% が見つかりません。
	pause & popd & exit /b 1
)

@REM lib フォルダがなければ作成
if not exist lib\ ( mkdir lib )

@REM Aivis-Dataset.zip をGitHubのmasterの最新のものをダウンロード
%CURL_CMD% -Lo Aivis-Dataset.zip^
	https://github.com/litagin02/Aivis-Dataset/archive/refs/heads/master.zip
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

@REM Aivis-Dataset.zip を解凍（フォルダ名前がAivis-Dataset-masterになる）
%PS_CMD% Expand-Archive -Path Aivis-Dataset.zip -DestinationPath . -Force
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

@REM 元のzipを削除
del Aivis-Dataset.zip
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

@REM Bert-VITS2-masterの中身をAivis-Datasetに上書き移動
xcopy /QSY .\Aivis-Dataset-master\ .\Aivis-Dataset\
rmdir /s /q Aivis-Dataset-master

@REM Pythonと仮想環境のセットアップを呼び出す（仮想環境が有効化されて戻ってくる）
call Aivis-Dataset\scripts\Setup-Python.bat ..\..\lib\python ..\venv
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM 依存関係インストール
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

pip install -r Aivis-Dataset\requirements.txt
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

echo [INFO] インストールが完了しました。

pause

popd

