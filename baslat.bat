@echo off
title Axid SMS Bomb Installer and Launcher
color 0A

:: Başlık ve script açıklaması
echo ===============================
echo     Mr.Pomerd SMS Bomb Başlatıcı
echo ===============================
echo.

:: Python ve pip kontrolü
echo [Kontrol] Python ve pip kurulumu kontrol ediliyor...
python --version > nul 2>&1
if %errorlevel% neq 0 (
    echo [Hata] Python bulunamadı. Lütfen Python'u yükleyip tekrar deneyin.
    pause
    exit /b
)

pip --version > nul 2>&1
if %errorlevel% neq 0 (
    echo [Hata] pip bulunamadı. Lütfen pip'i yükleyip tekrar deneyin.
    pause
    exit /b
)

:: Gerekli kütüphanelerin yüklenmesi
echo [Kurulum] Gerekli Python kütüphaneleri yükleniyor...
pip install -r requirements.txt > nul 2>&1
if %errorlevel% neq 0 (
    echo [Hata] Gerekli kütüphaneler yüklenemedi. Lütfen requirements.txt dosyasını kontrol edin.
    pause
    exit /b
)

:: Ek bağımlılıkların yüklenmesi
echo [Kurulum] Ek bağımlılıklar yükleniyor...
pip install bs4 requests colorama > nul 2>&1
if %errorlevel% neq 0 (
    echo [Hata] Ek bağımlılıklar yüklenemedi. Lütfen bağlantı sorunlarını kontrol edin.
    pause
    exit /b
)

:: Programın çalıştırılması
echo [Başlatılıyor] Axid SMS Bomb başlatılıyor...
python pomerdbomb.py
if %errorlevel% neq 0 (
    echo [Hata] Program çalıştırılırken bir hata oluştu. Lütfen pomerdbomb.py dosyasını kontrol edin.
    pause
    exit /b
)

:: İşlem başarıyla tamamlandı
echo [Tamam] Program başarıyla çalıştırıldı!
pause
