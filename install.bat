@echo off
chcp 65001 >nul 2>&1
setlocal EnableDelayedExpansion

:: ============================================================
::  WorkBuddy Skill 一键安装脚本
::  用法: 将本脚本和 product-dev-workflow 文件夹放在同一目录下运行
:: ============================================================

echo.
echo ══════════════════════════════════════════════════
echo   WorkBuddy Skill 安装器 - product-dev-workflow
echo ══════════════════════════════════════════════════
echo.

set "SKILL_NAME=product-dev-workflow"
set "TARGET_DIR=%USERPROFILE%\.workbuddy\skills\%SKILL_NAME%"

:: 检查 skill 文件夹是否存在
if not exist "%~dp0%SKILL_NAME%" (
    echo [错误] 找不到 %SKILL_NAME% 文件夹！
    echo 请确保本脚本与 %SKILL_NAME% 文件夹在同一目录。
    pause & exit /b 1
)

:: 创建目标目录（如果不存在）
if not exist "%USERPROFILE%\.workbuddy\skills\" (
    mkdir "%USERPROFILE%\.workbuddy\skills"
    echo [创建] .workbuddy\skills 目录
)

:: 如果已存在旧版本，先备份
if exist "%TARGET_DIR%" (
    set "BACKUP=%TARGET_DIR%_backup_%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%"
    move "%TARGET_DIR%" "!BACKUP!" >nul 2>&1
    echo [备份] 旧版本已移至 %SKILL_NAME%_backup\
)

:: 复制 skill 到目标位置
xcopy "%~dp0%SKILL_NAME%" "%TARGET_DIR%\" /E /I /Y >nul 2>&1

if %ERRORLEVEL% EQU 0 (
    echo.
    echo [成功] ✅ %SKILL_NAME% 安装完成！
    echo.
    echo   安装路径: %TARGET_DIR%
    echo   文件清单:
    dir /B "%TARGET_DIR%\SKILL.md" 2>nul && echo     ├── SKILL.md (主流程)
    dir /B "%TARGET_DIR%\references\" 2>nul | findstr /C:".md" >nul && for %%f in ("%TARGET_DIR%\references\*.md") do echo     └── references\%%~nxf
    echo.
    echo   触发词: 产品开发 / 选品 / 市场调研 / 竞品分析
    echo          Amazon选品 / BSR分析 / 品牌分析 / 价格分析
) else (
    echo [失败] ❌ 安装出错，请手动复制文件夹到:
    echo         %TARGET_DIR%
)

echo.
pause
