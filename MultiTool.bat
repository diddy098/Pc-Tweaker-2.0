::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDpQQQ2MNXiuFLQI5/rHy++UqVkSRN4Pe8/vzbGPK+UBuAu0SYI603tRyoVcQh5Ae3I=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title Windows Optimization MultiTool - @rubiccs
mode con: cols=90 lines=30

:: Function to clear temp files
:ClearTemp
echo Cleaning temporary files...
del /s /f /q %temp%\*.* >nul 2>&1
rd /s /q %temp% >nul 2>&1
mkdir %temp%
del /s /f /q C:\Windows\Temp\*.* >nul 2>&1
rd /s /q C:\Windows\Temp >nul 2>&1
mkdir C:\Windows\Temp
echo Temporary files cleared!
pause
goto MainMenu

:: Function to disable unnecessary settings
:DisableSettings
echo Disabling unnecessary Windows features...
sc config DiagTrack start= disabled >nul 2>&1
sc stop DiagTrack >nul 2>&1
sc config dmwappushservice start= disabled >nul 2>&1
sc stop dmwappushservice >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul 2>&1
echo Unnecessary settings disabled!
pause
goto MainMenu

:: Function to uninstall unused apps
:UninstallApps
echo Uninstalling unused apps...
wmic product where "name like '%%Adobe%%'" call uninstall /nointeractive
wmic product where "name like '%%McAfee%%'" call uninstall /nointeractive
wmic product where "name like '%%Norton%%'" call uninstall /nointeractive
wmic product where "name like '%%Spotify%%'" call uninstall /nointeractive
wmic product where "name like '%%Zoom%%'" call uninstall /nointeractive
wmic product where "name like '%%Skype%%'" call uninstall /nointeractive
echo Unused apps uninstalled!
pause
goto MainMenu

:: Function to remove pre-installed Windows apps
:RemoveBloatware
echo Removing pre-installed Windows apps...
powershell -Command "Get-AppxPackage *Xbox* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *OneNote* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Solitaire* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *BingNews* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *YourPhone* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Microsoft3DViewer* | Remove-AppxPackage"
echo Pre-installed Windows apps removed!
pause
goto MainMenu

:: Function to detect viruses
:VirusScan
echo Running Windows Defender Quick Scan...
powershell -Command "Start-MpScan -ScanType QuickScan"
echo Scan initiated. Check Windows Defender for results.
pause
goto MainMenu

:: Function to clear browser cache and cookies
:ClearBrowserData
echo Clearing browser cache and cookies...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255
echo Browser cache and cookies cleared!
pause
goto MainMenu

:: Function to clear recycle bin
:ClearRecycleBin
echo Emptying Recycle Bin...
powershell -Command "Clear-RecycleBin -Confirm:$false"
echo Recycle Bin emptied!
pause
goto MainMenu

:: Function to delete apps not used in last 30 days
:UninstallInactiveApps
echo Uninstalling apps not used in the past 30 days...
powershell -Command "Get-AppxPackage | Where-Object {($_.InstallDate -lt (Get-Date).AddDays(-30))} | Remove-AppxPackage"
echo Unused apps uninstalled!
pause
goto MainMenu

:: Function to disable all startup programs
:DisableStartup
echo Disabling all startup programs...
wmic startup where "not (command like '%%Windows Defender%%')" call disable >nul 2>&1
echo All startup programs disabled!
pause
goto MainMenu

:: Function to clear search history from past week
:ClearSearchHistory
echo Clearing search history from the past week...
powershell -Command "Clear-History"
echo Search history cleared!
pause
goto MainMenu

:: Function to optimize keyboard settings
:KeyboardOptimizations
echo Applying keyboard optimizations...
reg add "HKCU\Keyboard Layout\Toggle" /v Hotkey /t REG_DWORD /d 3 /f >nul 2>&1
reg add "HKCU\Control Panel\Keyboard" /v KeyboardDelay /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Control Panel\Keyboard" /v KeyboardSpeed /t REG_DWORD /d 31 /f >nul 2>&1
echo Keyboard optimizations applied!
pause
goto MainMenu

:: Function to debloat Windows
:DebloatWindows
echo Debloating Windows...
powershell -Command "& {Get-AppxPackage -AllUsers | Remove-AppxPackage}"
powershell -Command "& {Get-AppxProvisionedPackage -Online | Remove-AppxProvisionedPackage -Online}"
echo Windows debloated!
pause
goto MainMenu

:: Main menu
:MainMenu
cls
echo ============================================
echo      Windows Optimization MultiTool
echo ============================================
echo                               - @rubiccs
echo [1] Clear Temporary Files
echo [2] Disable Unnecessary Settings
echo [3] Uninstall Unused Apps
echo [4] Remove Pre-installed Windows Apps
echo [5] Virus Scan (Windows Defender)
echo [6] Clear Browser Cache & Cookies
echo [7] Empty Recycle Bin
echo [8] Uninstall Apps Not Used in Last 30 Days
echo [9] Disable All Startup Programs
echo [10] Clear Search History (Past Week)
echo [11] Apply Keyboard Optimizations
echo [12] Debloat Windows
echo [13] Exit
echo ============================================
set /p choice=Enter your choice: 

if "%choice%"=="1" goto ClearTemp
if "%choice%"=="2" goto DisableSettings
if "%choice%"=="3" goto UninstallApps
if "%choice%"=="4" goto RemoveBloatware
if "%choice%"=="5" goto VirusScan
if "%choice%"=="6" goto ClearBrowserData
if "%choice%"=="7" goto ClearRecycleBin
if "%choice%"=="8" goto UninstallInactiveApps
if "%choice%"=="9" goto DisableStartup
if "%choice%"=="10" goto ClearSearchHistory
if "%choice%"=="11" goto KeyboardOptimizations
if "%choice%"=="12" goto DebloatWindows
if "%choice%"=="13" exit
echo Invalid choice! Try again.
pause
goto MainMenu
