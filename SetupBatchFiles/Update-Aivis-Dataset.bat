chcp 65001 > NUL
@echo off

pushd %~dp0
set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass

set CURL_CMD=C:\Windows\System32\curl.exe
if not exist %CURL_CMD% (
	echo [ERROR] %CURL_CMD% が見つかりません。
	pause & popd & exit /b 1
)

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

@REM Aivis-Dataset-masterの中身をAivis-Datasetに上書き移動
xcopy /QSY .\Aivis-Dataset-master .\Aivis-Dataset
rmdir /s /q Aivis-Dataset-master
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

@REM 仮想環境のpip requirements.txtを更新

echo call .\Aivis-Dataset\scripts\activate.bat
call .\Aivis-Dataset\venv\Scripts\activate.bat
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

pip install -U -r Aivis-Dataset\requirements.txt
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

echo Aivis-Datasetのアップデートが完了しました。

pause

popd