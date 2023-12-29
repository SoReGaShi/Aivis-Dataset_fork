chcp 65001 > NUL
@echo off

pushd %~dp0
echo Running Aivis create-segments --no-use-demucs...
venv\Scripts\python -m Aivis create-segments --no-use-demucs

if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

popd

echo [INFO] Aivis create-segmentsが完了しました。
pause