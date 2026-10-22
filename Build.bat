@echo off
setlocal
cd /d "%~dp0"
where dotnet >nul 2>nul
if errorlevel 1 (
  echo .NET SDK not found. Install ".NET 8 SDK" from https://dotnet.microsoft.com/download then run this file again.
  pause & exit /b 1
)
echo Close AutoCAD first. Building...
dotnet build EngMohammedFathySurvey\EngMohammedFathySurvey.csproj -c Release
if errorlevel 1 (
  echo.
  echo BUILD FAILED - copy the error lines and send them to Claude.
  pause & exit /b 1
)
echo.
echo DONE. The tool was copied to %%APPDATA%%\Autodesk\ApplicationPlugins\EngMohammedFathySurvey.bundle
echo Open AutoCAD, then click the tab "Eng Mohammed Fathy Survey".
echo If it does not load automatically: type NETLOAD and pick
echo   EngMohammedFathySurvey\bin\Release\net48\EngMohammedFathySurvey.dll
pause
