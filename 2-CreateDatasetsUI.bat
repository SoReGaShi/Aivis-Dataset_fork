chcp 65001 > NUL
@echo off

pushd %~dp0

set /p SPEAKER_NAMES="話者名を入力してください（複数の場合は空白含まない`,`区切り）: "

echo Running Aivis create-datasets...
venv\Scripts\python -m Aivis create-datasets ALL "%SPEAKER_NAMES%"

if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

popd

echo [INFO] Aivis create-segmentsが完了しました。
pause