@echo off
TITLE Phishing Detection System Launcher
echo ========================================================
echo   PHISHING DETECTION SYSTEM (HYBRID ML + HEURISTICS)
echo   Malla Reddy University - Major Project Phase-1
echo ========================================================
echo.

echo [1/2] Starting Python ML Service (Port 5001)...
start "Python ML Service" cmd /k "cd /d %~dp0ml-service && python app.py"

timeout /t 3 /nobreak >nul

echo [2/2] Starting Node.js Intermediary Server (Port 5000)...
start "Node.js Express Server" cmd /k "cd /d %~dp0backend && node server.js"

echo.
echo ========================================================
echo Both services are starting up!
echo Access the Application at: http://localhost:5000
echo ========================================================
timeout /t 2 >nul
start http://localhost:5000
pause
