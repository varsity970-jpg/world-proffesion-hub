@echo off
setlocal
rem Lightweight Gradle bootstrapper for this project. Downloads Gradle 8.9 if missing.
set "GRADLE_VERSION=8.9"
set "BOOTSTRAP_DIR=%USERPROFILE%\.gradle\world-profession-hub"
set "GRADLE_HOME=%BOOTSTRAP_DIR%\gradle-%GRADLE_VERSION%"
set "GRADLE_EXE=%GRADLE_HOME%\bin\gradle.bat"
if exist "%GRADLE_EXE%" goto run_gradle
if not exist "%BOOTSTRAP_DIR%" mkdir "%BOOTSTRAP_DIR%"
echo Downloading Gradle %GRADLE_VERSION% (first run only)...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; $dir=$env:USERPROFILE+'\.gradle\world-profession-hub'; $zip=$dir+'\gradle-%GRADLE_VERSION%-bin.zip'; Invoke-WebRequest -Uri 'https://services.gradle.org/distributions/gradle-%GRADLE_VERSION%-bin.zip' -OutFile $zip; Expand-Archive -LiteralPath $zip -DestinationPath $dir -Force; Remove-Item $zip -Force"
if errorlevel 1 (
  echo ERROR: Could not download Gradle. Check your internet connection and retry.
  exit /b 1
)
if not exist "%GRADLE_EXE%" (
  echo ERROR: Gradle download/extraction did not create %GRADLE_EXE%.
  exit /b 1
)
:run_gradle
call "%GRADLE_EXE%" %*
exit /b %ERRORLEVEL%
