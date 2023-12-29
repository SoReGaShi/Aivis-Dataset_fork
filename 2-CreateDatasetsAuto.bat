chcp 65001 > NUL
@echo off

pushd %~dp0

echo 書き起こしやデータのチェックをせずにそのままデータセットを自動で作成します。

set /p SPEAKER_NAMES="話者名を入力してください: "

echo Running Aivis create-datasets...
venv\Scripts\python -m Aivis create-datasets ALL %SPEAKER_NAMES% --accept-all

if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

popd

echo [INFO] Aivis create-segmentsが完了しました。
pause