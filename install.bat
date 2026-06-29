@echo off
chcp 65001 >nul 2>&1
setlocal EnableDelayedExpansion

:: ============================================================
::  WorkBuddy Skills Triple-Pack Installer (Windows)
::  Usage: Run this bat file from repo root
:: ============================================================

echo.
echo ============================================================
echo   WorkBuddy Skills Pack Installer (v2.0)
echo   3 Skills included
echo ============================================================
echo.

set "SKILLS_DIR=%USERPROFILE%\.workbuddy\skills"
set "SCRIPT_DIR=%~dp0"
set "INSTALLED=0"
set "FAILED=0"

:: Create target directory
if not exist "%SKILLS_DIR%" (
    mkdir "%SKILLS_DIR%"
    echo [OK] Created skills directory
)

:: Skill list
for %%S in (
    product-dev-workflow
    ouyun-sgrade-market-analysis
    category-prompts
) do (
    echo.
    echo --- Installing: %%S ---

    if not exist "%SCRIPT_DIR%%%S" (
        echo [SKIP] Folder not found: %%S
        set /a FAILED+=1
    ) else (
        set "TARGET=%SKILLS_DIR%\%%S"

        :: Backup old version if exists
        if exist "!TARGET!" (
            set "BACKUP=!TARGET!_backup_%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%"
            move "!TARGET!" "!BACKUP!" >nul 2>&1
            echo [BACKUP] Old version backed up
        )

        :: Copy skill to target
        xcopy "%SCRIPT_DIR%%%S" "!TARGET!\" /E /I /Y >nul 2>&1

        if !ERRORLEVEL! EQU 0 (
            echo [DONE] Installed %%S
            set /a INSTALLED+=1
        ) else (
            echo [FAIL] Error installing %%S
            set /a FAILED+=1
        )
    )
)

echo.
echo ============================================================
if %FAILED%==0 (
    echo   All %INSTALLED% skills installed successfully!
) else (
    echo   %INSTALLED% installed, %FAILED% failed
)
echo ============================================================
echo.
echo Installed:
if exist "%SKILLS_DIR%\product-dev-workflow\SKILL.md" echo   + product-dev-workflow
if exist "%SKILLS_DIR%\ouyun-sgrade-market-analysis\SKILL.md" echo   + ouyun-sgrade-market-analysis
if exist "%SKILLS_DIR%\category-prompts\SKILL.md" echo   + category-prompts
echo.

pause
