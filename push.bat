@echo off
cd /d "%~dp0"

echo ========================================
echo   Push to GitHub (amazon-jp-seller-guide)
echo ========================================
echo.

echo [1/4] Checking for changes...
git status --short
echo.

echo [2/4] Staging all changes...
git add -A
echo.

echo [3/4] Creating commit...
git commit -m "manual update %date% %time%"
echo.

echo [4/4] Pushing to GitHub (main)...
git push origin main
set PUSH_RESULT=%errorlevel%
echo.

if %PUSH_RESULT%==0 (
    echo ========================================
    echo   DONE. Site updates in 1-3 minutes:
    echo   https://hsinyi94.github.io/amazon-jp-seller-guide/
    echo ========================================
) else (
    echo ========================================
    echo   PUSH FAILED. Screenshot the red text above for help.
    echo   Common cause: network, or GitHub login needed.
    echo ========================================
)

echo.
echo Press any key to close this window...
pause >nul
