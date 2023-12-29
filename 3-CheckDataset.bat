chcp 65001 > NUL
@echo off

pushd %~dp0

set /p SPEAKER_NAME="データセットをチェックしたい話者名を入力してください： "

echo Running Aivis check-dataset...
venv\Scripts\python -m Aivis check-dataset %SPEAKER_NAME%

if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

popd

pause