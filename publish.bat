@echo off
setlocal enabledelayedexpansion

cd /d "%~dp0"

set "COMMIT_MSG=%~1"
if "%COMMIT_MSG%"=="" (
    echo Error: Please provide commit message
    echo.
    echo Usage:
    echo   publish.bat "commit message"
    echo.
    echo Example:
    echo   publish.bat "Add new article"
    echo   publish.bat "Update config"
    echo   publish.bat "Fix style issue"
    echo.
    pause
    exit /b 1
)

echo ==========================================
echo Publishing Blog...
echo ==========================================
echo.

echo [1/4] Checking changes...
git status --short
echo.

echo [2/4] Adding files...
git add .
if errorlevel 1 (
    echo Error: git add failed
    pause
    exit /b 1
)
echo Done
echo.

git diff-index --quiet HEAD --
if %errorlevel% equ 0 (
    echo No changes detected
    pause
    exit /b 0
)

echo [3/4] Committing...
git commit -m "%COMMIT_MSG%"
if errorlevel 1 (
    echo Error: git commit failed
    pause
    exit /b 1
)
echo Done
echo.

echo [4/4] Pushing to GitHub...
git push origin master
if errorlevel 1 (
    echo Error: git push failed
    echo.
    echo Possible reasons:
    echo   1. Network issue
    echo   2. Need to pull first: git pull origin master
    echo   3. Permission issue
    echo.
    pause
    exit /b 1
)
echo Done
echo.

echo ==========================================
echo Success!
echo ==========================================
echo.
echo Commit: %COMMIT_MSG%
echo.
echo Next steps:
echo   1. GitHub Actions deploying (2-5 min)
echo   2. Check: https://github.com/HuangWwenGang/HuangWwenGang.github.io/actions
echo   3. Visit: https://daisiku.you
echo   4. Force refresh: Ctrl+Shift+R
echo.

pause
endlocal
