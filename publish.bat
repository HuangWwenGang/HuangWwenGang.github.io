@echo off
REM ========================================
REM Hexo 博客一键发布脚本 (Windows)
REM 用法: publish.bat "提交信息"
REM 示例: publish.bat "添加新文章: 我的第一篇博客"
REM ========================================

setlocal enabledelayedexpansion

REM 切换到博客根目录
cd /d "%~dp0"

REM 获取提交信息
set "COMMIT_MSG=%~1"
if "%COMMIT_MSG%"=="" (
    echo [错误] 请提供提交信息！
    echo.
    echo 用法:
    echo   publish.bat "提交信息"
    echo.
    echo 示例:
    echo   publish.bat "添加新文章"
    echo   publish.bat "更新配置文件"
    echo   publish.bat "修复样式问题"
    exit /b 1
)

echo ========================================
echo 开始发布博客...
echo ========================================
echo.

REM 1. 检查 Git 状态
echo [1/4] 检查文件变化...
git status --short
echo.

REM 2. 添加所有更改
echo [2/4] 添加文件到 Git...
git add .
if errorlevel 1 (
    echo [错误] git add 失败！
    exit /b 1
)
echo ✓ 文件已添加
echo.

REM 3. 检查是否有更改
git diff-index --quiet HEAD --
if %errorlevel% equ 0 (
    echo [提示] 没有检测到更改，无需提交
    exit /b 0
)

REM 4. 提交更改
echo [3/4] 提交更改...
git commit -m "%COMMIT_MSG%"
if errorlevel 1 (
    echo [错误] git commit 失败！
    exit /b 1
)
echo ✓ 更改已提交
echo.

REM 5. 推送到 GitHub
echo [4/4] 推送到 GitHub...
git push origin master
if errorlevel 1 (
    echo [错误] git push 失败！
    echo.
    echo 可能的原因:
    echo   1. 网络连接问题
    echo   2. 需要先拉取远程更新: git pull origin master
    echo   3. 权限问题
    exit /b 1
)
echo ✓ 推送成功
echo.

echo ========================================
echo ✓ 发布完成！
echo ========================================
echo.
echo 提交信息: %COMMIT_MSG%
echo.
echo 后续步骤:
echo   1. GitHub Actions 正在自动部署 (约 2-5 分钟)
echo   2. 查看部署状态: https://github.com/HuangWwenGang/HuangWwenGang.github.io/actions
echo   3. 访问博客: https://daisuki.you
echo   4. 记得强制刷新浏览器 (Ctrl+Shift+R)
echo.

pause

endlocal
