@echo off
chcp 65001 >nul
title Тайны слов - Сервер
echo ========================================
echo   Запуск игры "Тайны слов"
echo ========================================

:: Проверка наличия Node.js
node -v >nul 2>&1
if %errorlevel% neq 0 (
    echo [ОШИБКА] Node.js не найден! Пожалуйста, установите Node.js с сайта nodejs.org
    pause
    exit /b 1
)

:: Автоматическая установка зависимостей, если папка node_modules отсутствует
if not exist "node_modules\" (
    echo [INFO] Обнаружен первый запуск. Установка зависимостей...
    call npm install
    echo [INFO] Зависимости успешно установлены!
)

:: Запуск сервера
echo [INFO] Запуск сервера на порту 3000...
echo [INFO] Откройте браузер и перейдите по адресу: http://localhost:3000
echo ----------------------------------------
node server.js
pause
