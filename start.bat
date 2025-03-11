@echo off
setlocal enabledelayedexpansion

:: Baca URL repository dari file .env
for /f "tokens=2 delims==" %%A in ('findstr /R "^BACKEND_REPO=" .env') do set BACKEND_REPO=%%A
for /f "tokens=2 delims==" %%A in ('findstr /R "^FRONTEND_REPO=" .env') do set FRONTEND_REPO=%%A

:: Cek apakah variabel BACKEND_REPO sudah diatur
if "%BACKEND_REPO%"=="" (
    echo Error: BACKEND_REPO tidak ditemukan di file .env!
    exit /b 1
)

:: Cek apakah variabel FRONTEND_REPO sudah diatur
if "%FRONTEND_REPO%"=="" (
    echo Error: FRONTEND_REPO tidak ditemukan di file .env!
    exit /b 1
)

set BACKEND_DIR=backend\src
set FRONTEND_DIR=frontend\src

:: Clone backend repository jika belum ada
if not exist "%BACKEND_DIR%" (
    echo Cloning backend repository from %BACKEND_REPO%...
    git clone %BACKEND_REPO% %BACKEND_DIR%
    
    :: Pindah ke direktori backend
    cd /d "%BACKEND_DIR%"
    git checkout main
    cd /d "%~dp0"
    
    echo Backend clone completed.
) else (
    echo Backend repository already exists. Skipping clone.
)

:: Clone frontend repository jika belum ada
if not exist "%FRONTEND_DIR%" (
    echo Cloning frontend repository from %FRONTEND_REPO%...
    git clone %FRONTEND_REPO% %FRONTEND_DIR%
    
    :: Pindah ke direktori frontend
    cd /d "%FRONTEND_DIR%"
    git checkout main

    :: Pastikan file .env.example ada sebelum disalin
    if exist .env.example (
        copy .env.example .env
    ) else (
        echo Warning: .env.example not found, skipping copy.
    )

    echo Installing dependencies...
    composer install

    :: Pastikan file artisan ada sebelum menjalankan perintah artisan
    if exist artisan (
        php artisan key:generate
    ) else (
        echo Error: Laravel artisan file not found! Skipping key generation.
    )

    :: Kembali ke direktori utama
    cd /d "%~dp0"

    echo Frontend clone completed.
) else (
    echo Frontend repository already exists. Skipping clone.
)

:: Jalankan Docker Compose
echo Starting Docker Compose...
docker compose up -d --build
echo Docker Compose started successfully.
