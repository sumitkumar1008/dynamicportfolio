@echo off
REM Compile script for Portfolio Website
REM Make sure to update paths according to your system

REM Set paths
SET JAVA_SRC=src
SET OUTPUT_DIR=WebContent\WEB-INF\classes
SET TOMCAT_LIB=C:\apache-tomcat-9.0.x\lib
SET MYSQL_JAR=C:\apache-tomcat-9.0.x\lib\mysql-connector-java-8.0.33.jar

REM Create output directory if it doesn't exist
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

REM Compile Java files
echo Compiling Java files...
javac -d "%OUTPUT_DIR%" -cp "%MYSQL_JAR%;%TOMCAT_LIB%\*" "%JAVA_SRC%\com\portfolio\**\*.java"

if %errorlevel% equ 0 (
    echo.
    echo Compilation successful!
    echo Files compiled to: %OUTPUT_DIR%
) else (
    echo.
    echo Compilation failed! Check errors above.
    echo Make sure:
    echo - JAVA_HOME is set in System Variables
    echo - Paths to Tomcat and MySQL JAR are correct
)

pause
