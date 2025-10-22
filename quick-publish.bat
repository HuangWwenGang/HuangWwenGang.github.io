@echo off
cd /d "%~dp0"

echo ==========================================
echo Hexo Blog Quick Publish
echo ==========================================
echo.

git status --short
echo.

git add .
if errorlevel 1 (
    echo Error: git add failed
    pause
    exit /b 1
)

git diff-index --quiet HEAD --
if %errorlevel% equ 0 (
    echo No changes detected
    pause
    exit /b 0
)

git commit -m "Update blog content"
if errorlevel 1 (
    echo Error: git commit failed
    pause
    exit /b 1
)

git push origin master
if errorlevel 1 (
    echo Error: git push failed
    pause
    exit /b 1
)

echo.
echo ==========================================
echo Success! Blog published.
echo ==========================================
echo.
echo Visit: https://daisuki.you
echo Wait 2-5 minutes for deployment
echo.

pause
