@echo off
REM Create WAR file script for Portfolio Website

REM Set paths
SET SOURCE_DIR=WebContent
SET JAR_OUTPUT=PortfolioWebsite.war

echo Creating WAR file...
echo Source directory: %SOURCE_DIR%
echo Output file: %JAR_OUTPUT%

REM Create WAR file
jar cf %JAR_OUTPUT% -C %SOURCE_DIR% .

if %errorlevel% equ 0 (
    echo.
    echo WAR file created successfully: %JAR_OUTPUT%
    echo.
    echo Next steps:
    echo 1. Copy %JAR_OUTPUT% to Tomcat\webapps\
    echo 2. Start Tomcat
    echo 3. Access: http://localhost:8080/PortfolioWebsite
) else (
    echo.
    echo Failed to create WAR file!
    echo Make sure jar.exe is in your PATH (part of JDK)
)

pause
