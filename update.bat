@echo off
setlocal enabledelayedexpansion

:: Direktori backend dan frontend
set BACKEND_DIR=backend\src
set FRONTEND_DIR=frontend\src

:: Update repository backend
if exist "%BACKEND_DIR%\.git" (
    echo Updating backend repository...
    cd /d "%BACKEND_DIR%"
    git pull origin main || echo Error: Failed to update backend repository!
    cd /d "%~dp0"
) else (
    echo Warning: Backend repository not found or not initialized as a Git repository!
)

:: Update repository frontend
if exist "%FRONTEND_DIR%\.git" (
    echo Updating frontend repository...
    cd /d "%FRONTEND_DIR%"
    git pull origin main || echo Error: Failed to update frontend repository!
    cd /d "%~dp0"
) else (
    echo Warning: Frontend repository not found or not initialized as a Git repository!
)

echo Update process completed.