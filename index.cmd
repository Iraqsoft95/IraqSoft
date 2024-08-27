@ECHO OFF 
@REM -------------------------> Downloads

@REM ----------> SPEEDOO POS 
set SPEEDOO_POS_FULL_URL= "https://www.dropbox.com/scl/fi/jrrg2xtnw60a7a132zhx3/SPEEDOO-POS-1.3.7.6-FULL.exe?rlkey=25a6t62fis84n2daisvk8mr1p&e=1&dl=0"
set SPEEDOO_POS_FULL_FILE= "SPEEDOO-POS-1.3.7.6-FULL.exe"
set SPEEDOO_POS_UPDATE_URL= "https://www.dropbox.com/scl/fi/r03a6ujar6lwp09s2r3pm/SPEEDOO-POS-1.3.7.6-UPDATE.exe?rlkey=kae6meq14d5w0e19h9fra9ed3&e=1&dl=0"
set SPEEDOO_POS_UPDATE_FILE= "SPEEDOO-POS-1.3.7.6-UPDATE.exe"
set SPEEDOO_POS_CLINT_URL= "https://www.dropbox.com/scl/fi/sf7v3fo9yjxfwegyi74qc/SPEEDOO-POS-1.3.7.6-CLIENTS.exe?rlkey=79gbjb48nz3hcqz64y83fjzqg&e=1&dl=0"
set SPEEDOO_POS_CLINT_FILE= "SPEEDOO-POS-1.3.7.6-CLIENTS.exe"

@REM -----------> SPEEDOO REST 


@REM -------------------------> Main_Menu <----------------------------- 
:Main_Menu
cls
title IRAQSOFT SUPPORT TOOLS
echo.
echo.
echo                               WLECOME TO IRAQ SOFT SUPPORT TOOLS
echo                  -------------------------------------------------------------
echo.                                       Main Tools List 
echo                  -------------------------------------------------------------
echo.
echo                     1. Downloads          2. Printers          3. SQL Server            
echo.
echo                     4. Solutions          5. Connections       0.Exite 
echo.
echo                  -------------------------------------------------------------
echo.
set /p choice="Please choose an option : "

if "%choice%"=="1" goto Downloads
if "%choice%"=="2" goto Printers
if "%choice%"=="3" goto SQL_Server
if "%choice%"=="4" goto Solutions
if "%choice%"=="5" goto Connections
if "%choice%"=="0" goto Exit

echo Invalid choice! Please choose again.
pause
goto Main_Menu

:Downloads
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                          Downloads LIST 
echo                  -------------------------------------------------------------
echo.
echo                     1. SPEEDOO POS          2. SPEEDOO REST          3. POINT            
echo.
echo                     4. Point Super          5. Shipping Plus         6. Sql 
echo.
echo                     7. Aman                 8.Service programs       0. Go Back
echo.
echo                  -------------------------------------------------------------
echo.
set /p Download_choice="Please choose a color (1-4): "

if "%Download_choice%"=="1"  goto SPEEDOO_POS_Download
if "%Download_choice%"=="2"  goto SPEEDOO REST
if "%Download_choice%"=="3" goto POINT
if "%Download_choice%"=="4" goto Point Super
if "%Download_choice%"=="5" goto Shipping Plus
if "%Download_choice%"=="6" goto Sql
if "%Download_choice%"=="7" goto Aman
if "%Download_choice%"=="8" goto Service programs
if "%Download_choice%"=="0" goto Main_Menu

echo Invalid choice! Please choose again.
pause
goto Downloads

:SPEEDOO_POS_Download
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                         SPEEDOO POS
echo                  -------------------------------------------------------------
echo.
echo                     1. 1.3.7.6 FULL          
echo.
echo                     2. 1.3.7.6 UPDATE
echo.
echo                     3. 1.3.7.6 CLIENTS 
echo.                     
echo                     4. GO BACK  
echo.
echo                  -------------------------------------------------------------
echo.
set /p SPEEDOO_POS_choice="Please choose a SPEEDOO POS : "

if "%SPEEDOO_POS_choice%"=="1" set url= %SPEEDOO_POS_FULL_URL%& set output=%SPEEDOO_POS_FULL_FILE%& goto Start_Download
if "%SPEEDOO_POS_choice%"=="2" set url =%SPEEDOO_POS_UPDATE_URL%& set %output% = %SPEEDOO_POS_UPDATE_FILE%& goto Start_Download
if "%SPEEDOO_POS_choice%"=="3" set set url =%SPEEDOO_POS_CLINT_URL%& set %output% = %SPEEDOO_POS_CLINT_FILE%& goto Start_Download
if "%SPEEDOO_POS_choice%"=="4" goto Main_Menu

echo Invalid choice! Please choose again.
pause
goto SPEEDOO_POS_Download

:Start_Download
curl -L --progress-bar --retry 5 --retry-delay 10 -C - -o %output% %url%
if %errorlevel% neq 0 (
    echo Download interrupted. Retrying...
    timeout /t 10
    goto download
)
echo Download Complete. Waiting To Opening The File...
start "" %output%
pause
goto Main_Menu
:Exit
echo Exiting the program...
pause
exit
