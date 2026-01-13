@echo off
REM Cyber-UI Startup Script (Windows)
REM Bu script otomatik olarak tüm bağımlılıkları yükler ve sistemi başlatır

echo.
echo ========================================
echo    Cyber-UI Development Environment
echo ========================================
echo.

REM Node.js kontrolü
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Node.js bulunamadi! Lutfen Node.js yukleyin.
    echo         Indirme linki: https://nodejs.org/
    pause
    exit /b 1
)

echo [OK] Node.js bulundu
node --version
echo [OK] NPM bulundu
npm --version
echo.

REM .env.local kontrolü
if not exist .env.local (
    echo [WARNING] .env.local dosyasi bulunamadi!
    echo [INFO] .env.example dosyasindan kopyalaniyor...
    copy .env.example .env.local
    echo.
    echo [WARNING] ONEMLI: .env.local dosyasini duzenleyip GEMINI_API_KEY ekleyin!
    echo.
)

REM node_modules kontrolü
if not exist node_modules (
    echo [INFO] Bagimliliklar yukleniyor...
    call npm install
    echo.
) else (
    echo [OK] Bagimliliklar zaten yuklu
    echo [TIP] Guncellemek icin: npm install
    echo.
)

REM Çoklu terminal modunu sor
echo Nasil baslatmak istersiniz?
echo.
echo 1) Normal Mod (Tek terminal - sadece dev server)
echo 2) Full Mod (3 terminal - dev server + type checker + monitor)
echo.
set /p choice="Seciminiz (1-2): "

if "%choice%"=="1" (
    echo.
    echo [OK] Normal mod baslatiliyor...
    echo      Development server: http://localhost:5173
    echo.
    call npm run dev
) else if "%choice%"=="2" (
    echo.
    echo [OK] Full mod baslatiliyor...
    echo      Terminal 1: Development Server
    echo      Terminal 2: Type Checker
    echo      Terminal 3: Monitor
    echo.
    REM concurrently kurulu mu kontrol et
    npm list concurrently >nul 2>nul
    if %ERRORLEVEL% NEQ 0 (
        echo [INFO] concurrently yukleniyor...
        call npm install --save-dev concurrently
    )
    call npm run dev:full
) else (
    echo [ERROR] Gecersiz secim! 1 veya 2 seciniz.
    pause
    exit /b 1
)

pause
