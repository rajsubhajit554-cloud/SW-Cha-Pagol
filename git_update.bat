@echo off
title SW Cha Pagol - Git Update Tool
cls
echo ======================================================
echo           SW CHA PAGOL - GIT UPDATE TOOL             
echo ======================================================
echo.

:: Show current branch and status
echo Current Git Status:
echo ------------------------------------------------------
git status
echo ------------------------------------------------------
echo.

:: Ask if they want to proceed with staging all changes
set /p PROCEED="Do you want to stage and push all changes? (Y/N, default is Y): "
if /i "%PROCEED%"=="N" goto ABORT

echo.
set /p COMMIT_MSG="Enter commit message (default: Update website files): "

:: If commit message is empty, set default
if "%COMMIT_MSG%"=="" set COMMIT_MSG=Update website files

echo.
echo Staging all changes...
git add -A

echo.
echo Committing changes with message: "%COMMIT_MSG%"
git commit -m "%COMMIT_MSG%"

echo.
echo Pushing changes to remote repository (origin/main)...
git push -u origin main

if %ERRORLEVEL% equ 0 (
    echo.
    echo ======================================================
    echo           SUCCESS: Repository updated!
    echo ======================================================
) else (
    echo.
    echo ======================================================
    echo           ERROR: Push failed. Please check!
    echo ======================================================
)

goto END

:ABORT
echo.
echo Operation cancelled by user.
goto END

:END
echo.
pause
