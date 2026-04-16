@echo off
setlocal
cd /d "%~dp0"

echo ======================================
echo   DesktopMind P1 Launcher
echo ======================================
echo.

where node >NUL 2>NUL
if errorlevel 1 goto no_node

set "PM=npm"
where pnpm >NUL 2>NUL
if not errorlevel 1 set "PM=pnpm"

if not exist node_modules (
  echo [1/3] Installing dependencies...
  call %PM% install
  if errorlevel 1 goto install_failed
) else (
  echo [1/3] node_modules found, skipping install.
)

echo [2/3] Checking Rust/Cargo...
where cargo >NUL 2>NUL
if errorlevel 1 goto no_cargo

echo [3/3] Starting DesktopMind...
call %PM% run dev:desktop
if errorlevel 1 goto start_failed

goto end

:no_node
echo [ERROR] Node.js was not found.
echo Please install Node.js 18 or newer, then run this file again.
pause
exit /b 1

:no_cargo
echo [ERROR] Rust/Cargo was not found.
echo Please install Rust, reopen the terminal, and run this file again.
pause
exit /b 1

:install_failed
echo [ERROR] Dependency installation failed.
pause
exit /b 1

:start_failed
echo.
echo [ERROR] DesktopMind failed to start.
echo Check the terminal output above for details.
pause
exit /b 1

:end
endlocal
