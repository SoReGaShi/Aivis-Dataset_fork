chcp 65001 > NUL
@echo off

pushd %~dp0

set /p SPEAKER_NAMES="話者名を入力してください（複数の場合は,区切り）: "

echo Running Aivis check-dataset...
venv\Scripts\python -m Aivis check-dataset %SPEAKER_NAMES%

if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

popd

pause