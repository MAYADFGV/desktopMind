@echo off
:: ======================================================
:: Rust 一键安装到 D:\Dev\Rust（永久环境变量版 2025.11）
:: 作者：CSDN 好心网友
:: ======================================================

setlocal enabledelayedexpansion

set "BASE_DIR=D:\Dev\Rust"
set "RUSTUP_HOME=%BASE_DIR%\.rustup"
set "CARGO_HOME=%BASE_DIR%\.cargo"
set "GLOBAL_TARGET_DIR=%BASE_DIR%\target"

echo ================================================
echo   Rust 一键安装（永久环境变量 + 全局 target）
echo   安装路径：%BASE_DIR%
echo ================================================

mkdir "%BASE_DIR%" 2>nul
mkdir "%GLOBAL_TARGET_DIR%" 2>nul

:: 永久设置环境变量
powershell -Command ^
"[Environment]::SetEnvironmentVariable('RUSTUP_HOME', '%RUSTUP_HOME%', 'User'); ^
[Environment]::SetEnvironmentVariable('CARGO_HOME', '%CARGO_HOME%', 'User'); ^
Write-Host '已永久设置 RUSTUP_HOME 和 CARGO_HOME'"

:: 下载并安装
set "TEMP_DIR=%TEMP%\rust_install_final"
rmdir /s /q "%TEMP_DIR%" 2>nul
mkdir "%TEMP_DIR%"
powershell -Command "Invoke-WebRequest -Uri 'https://static.rust-lang.org/rustup/dist/x86_64-pc-windows-msvc/rustup-init.exe' -OutFile '%TEMP_DIR%\rustup-init.exe'"

"%TEMP_DIR%\rustup-init.exe" -y --default-toolchain stable --no-modify-path

:: 添加 PATH + 配置全局 target
set "BIN_PATH=%CARGO_HOME%\bin"
powershell -Command "$p=[Environment]::GetEnvironmentVariable('PATH','User'); if($p -notlike '*%BIN_PATH%*'){[Environment]::SetEnvironmentVariable('PATH',$p+';%BIN_PATH%','User')}"

(
echo [build]
echo target-dir = "%GLOBAL_TARGET_DIR:\=\\%"
echo.
echo [profile.dev]
echo incremental = true
echo.
echo [profile.release]
echo incremental = true
) > "%CARGO_HOME%\config.toml"

echo ================================================
echo   安装完成！所有项目编译产物都会自动进 D:\Dev\Rust\target
echo ================================================
rmdir /s /q "%TEMP_DIR%" 2>nul
pause
