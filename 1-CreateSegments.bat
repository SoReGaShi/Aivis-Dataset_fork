chcp 65001 > NUL
@echo off

pushd %~dp0
echo Running Aivis create-segments...
venv\Scripts\python -m Aivis create-segments --trim-silence

if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

popd

echo [INFO] Aivis create-segmentsが完了しました。
pause