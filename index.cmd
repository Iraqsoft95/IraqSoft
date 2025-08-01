@ECHO OFF 
title IRAQSOFT SUPPORT TOOLS V 2.2
chcp 65001 >nul 2>&1
setlocal EnableDelayedExpansion
::setlocal
mode con: cols=115 lines=40

@REM <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Run Bat Us Admin >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
@REM ----------->check if file Run Us Admin
set "isAdmin=false"
REG QUERY "HKU\S-1-5-19" >nul 2>&1
if %errorlevel% == 0 set "isAdmin=true"
@REM -----------> if file Not Run Us Admin 
if "%isAdmin%" == "false" (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
@REM <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Varibles >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
set "UserDesktop=%USERPROFILE%\Desktop"
set "PublicDesktop=C:\Users\Public\Desktop"
set "PublicDocuments=C:\Users\Public\Documents"
set "SCRIPT_PATH=%PublicDocuments%\IRAQSOFT_TOOL"
set "SCRIPT_NAME=%~nx0"
set SCRIPT_Loc="%SCRIPT_PATH%%SCRIPT_NAME%"
if not exist "%SCRIPT_PATH%" (
    mkdir %SCRIPT_PATH%)
set PC_Name=%COMPUTERNAME%
@REM ----------> Connection parameters
set "SQL_SERVICE=MSSQL$SALES_DEV"
set "SERVER=.\SALES_DEV"
set "USER=sa"
set "PASS=12345"
set "SQL_Connection=-S %SERVER% -E
set SQLCMD="C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\sqlcmd.exe"
set "Download_Path=%USERPROFILE%\Downloads"
set BACKUP_DIR=C:\MyBackup
@REM <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Downloads Info >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
@REM ----------> SPEEDOO POS 
set SPEEDOO_POS_FULL_URL="https://www.dropbox.com/scl/fi/inwa5nl2ua5hlm1blb7rf/SPEEDOO-POS-1.3.8.4-FULL.exe?rlkey=kpqtgcwg490kxqo01h0ygz746&e=1&dl=0"
set SPEEDOO_POS_FULL_FILE="%Download_Path%\SPEEDOO-POS-1.3.8.4-FULL.exe"
set SPEEDOO_POS_UPDATE_URL= "https://www.dropbox.com/scl/fi/p5svl5yfmihdyuva6c158/SPEEDOO-POS-1.3.8.4-UPDATE.exe?rlkey=tms77f0sc9xe5he1l2m9mmvxu&e=1&dl=0"
set SPEEDOO_POS_UPDATE_FILE= "%Download_Path%\SPEEDOO-POS-1.3.8.4-UPDATE.exe"
set SPEEDOO_POS_CLINT_URL= "https://www.dropbox.com/scl/fi/cvh53cxfptgrbl4th9ybf/SPEEDOO-POS-1.3.8.4-CLIENTS.exe?rlkey=engqaag83qnl4584g8hey1e3f&e=1&dl=0"
set SPEEDOO_POS_CLINT_FILE= "%Download_Path%\SPEEDOO-POS-1.3.8.4-CLIENTS.exe"
@REM -----------> SPEEDOO REST 
set SPEEDOO_REST_FULL_URL= "https://www.dropbox.com/scl/fi/vno6nyw138kqa0ggk8nxm/Speedoo-APP-3.0.6.2-FULL.exe?rlkey=3zvo1olsoferjnjmyvsjzaq0i&e=1&st=4bx98z5c&dl=0"
set SPEEDOO_REST_FULL_FILE= "%Download_Path%\Speedoo-APP-3.0.6.2-FULL.exe"
set SPEEDOO_REST_CLINT_URL= "https://www.dropbox.com/scl/fi/i1pia1g8bdvic74een1ep/Speedoo-REST-3.0.6.2-CLIENTS.exe?rlkey=j1lmoyp9cks7xnrbk6y6x7ym8&e=1&st=swtnyi22&dl=0"
set SPEEDOO_REST_CLINT_FILE= "%Download_Path%\Speedoo-REST-3.0.6.2-CLIENTS.exe"
set SPEEDOO_REST_UPDATE_URL= "https://www.dropbox.com/scl/fi/xgt3952eb4rhzvbf3bhem/Speedoo-REST-3.0.6.2-UPDATE.exe?rlkey=wsyraxw7cztzslvjkon7d2exr&e=1&st=3redgglo&dl=0"
set SPEEDOO_REST_UPDATE_FILE= "%Download_Path%\Speedoo-REST-3.0.6.2-UPDATE.exe"
@REM -----------> Point_Pos
set Point_Pos_FULL_URL= "https://www.dropbox.com/s/ne3uk78dl3po1ak/IraqSoft_point%20_pos%203.9.2.exe?dl=0"
set Point_Pos_FULL_FILE= "%Download_Path%\point_pos_03.9.2.exe"
set Point_Pos_UPDATE_URL= "https://www.dropbox.com/scl/fi/iu59y1onbs5a3mxytpvzb/Point_3.9.2_update.exe?rlkey=mbzmbcltitcb892b9q7tfkqxn&st=07kdwpa3&dl=0"
set Point_Pos_UPDATE_FILE= "%Download_Path%\Point_3.9.2_update.exe"
@REM -----------> Point_Super 
set Point_Super_FULL_URL= "https://www.dropbox.com/scl/fi/c626z7d3ijhu0uqal0vii/Point_Super_Full_3.0.0.2.exe?rlkey=oielyjj51n43puuf140bafsqt&st=xcpqcyfv&dl=0"
set Point_Super_FULL_FILE= "%Download_Path%\Point_Super_Full_3.0.0.2.exe"
set Point_Super_UPDATE_URL= "https://www.dropbox.com/scl/fi/60oxrlyzqh60wkzlmr61g/Point_Super_Update_3.0.0.2.exe?rlkey=jcqs1mlq0kjhe64zkulzmnxyf&st=dd6mdkma&dl=0"
set Point_Super_UPDATE_FILE= "%Download_Path%\Point_Super_Update_3.0.0.2.exe"
set Point_Super_CLINT_URL= "https://www.dropbox.com/scl/fi/53ukv2pj0aw0ozxwlsitz/Point_Super_Client_3.0.0.2.exe?rlkey=fk5ywhepeisnnfr3ysgovnu07&st=ppwkir9r&dl=0"
set Point_Super_CLINT_FILE= "%Download_Path%\Point_Super_Client_3.0.0.2.exe"
@REM -----------> Shipping_Plus_2.2.0.0
set Shipping_Plus_2.2.0.0_FULL_URL= "https://www.dropbox.com/scl/fi/ok2td062y7qgxisofyyxl/Shipping-Plus-Server-2.2.0.0.exe?rlkey=8gw2o04va9m3rrfzpglrx47ev&st=tqqjzjj6&dl=0"
set Shipping_Plus_2.2.0.0_FULL_FILE= "%Download_Path%\Shipping-Plus-Server-2.2.0.0.exe"
set Shipping_Plus_2.2.0.0_UPDATE_URL= "https://www.dropbox.com/scl/fi/sfv9t2hf1wpge9lsun3n1/Shipping_Plus_UBDAT_2.2.0.0.exe?rlkey=arpv9nzs6ps9nwv0gh38ds4ck&st=cjjgffqg&dl=0"
set Shipping_Plus_2.2.0.0_UPDATE_FILE= "%Download_Path%\Shipping_Plus_UBDAT_2.2.0.0.exe"
set Shipping_Plus_2.2.0.0_CLINT_URL= "https://www.dropbox.com/scl/fi/i6yqud8l6k9p8eck4k3d0/Shipping-Plus-Client-2.2.0.0.exe?rlkey=1fs4ydwr4repco3aadtyef40c&st=5q6lomox&dl=0"
set Shipping_Plus_2.2.0.0_CLINT_FILE= "%Download_Path%\Shipping-Plus-Client-2.2.0.0.exe"
@REM -----------> Shipping_Plus_2.2.2.2
set Shipping_Plus_2.2.2.2_FULL_URL= "https://www.dropbox.com/scl/fi/s1g97nsh7b2fcm58uxqdu/Shipping-Plus-Server2.2.2.2.exe?rlkey=hsktgir1wmrvbb4nrq69qw80l&st=9ite619r&dl=0"
set Shipping_Plus_2.2.2.2_FULL_FILE= "%Download_Path%\Shipping-Plus-Server-2.2.2.2.exe"
set Shipping_Plus_2.2.2.2_UPDATE_URL= "https://www.dropbox.com/scl/fi/7ei98af4bxjiwbwprmici/Shipping_Plus_Server_UBDAT2.2.2.2.exe?rlkey=r4d6xxylgfdwdywjekm4w879w&st=eauqw0ni&dl=0"
set Shipping_Plus_2.2.2.2_UPDATE_FILE= "%Download_Path%\Shipping_Plus_UBDAT_2.2.2.2.exe"
@REM -----------> SQL 
set Sql_2008_URL= "https://www.dropbox.com/scl/fi/w8s9ydvadw7i03n5rx3sk/SQL2008.rar?rlkey=31t2odlh77r2mvfqoii10s2in&st=hc3z4q81&dl=0"
set Sql_2008_FILE="%Download_Path%\SQL2008.rar"
set Sql_2012_URL= "https://www.dropbox.com/scl/fi/afywqc62q7xp5206z87az/SQL2012.rar?rlkey=8ybh23ox4zx6ma4njpldvj0ph&st=4b6qwed7&dl=0"
set Sql_2012_FILE="%Download_Path%\SQL2012.rar"
set Sql_2014_URL= "https://www.dropbox.com/scl/fi/55e2jnjig6uboj19qmmut/SQL2014.rar?rlkey=rhf8hrs4s85morb8jehq5pikb&st=h2hn0t69&dl=0"
set Sql_2014_FILE="%Download_Path%\SQL2014.rar"
set Sql_2019_URL= "https://www.dropbox.com/scl/fi/myr9szghvrcj034r3jqqz/SQL2019.rar?rlkey=hxgslitwbkd5l1c4ofw9vtp86&st=n0hhzel1&dl=0"
set Sql_2019_FILE="%Download_Path%\SQL2019.rar"
@REM -----------> Aman 
set Aman_URL="https://www.dropbox.com/scl/fi/mmb09081w93d4o11b6q6o/AMAN_AutoBackup.exe?rlkey=yi81hsbjsmml5zwjjmfvr78cc&st=kcd1p6d8&dl=0"
set Aman_FILE="%Download_Path%\AMAN_AutoBackup.exe"
@REM -----------> Service_Programs 
set dControl_URL="http://147.185.221.27:50105/Service_Programs/dControl.zip"
set dControl_FILE="%Download_Path%\dControl.zip"
set WUB_URL="https://www.dropbox.com/scl/fi/l8k0rv7d5jpbdlysclcro/Wub_v1.8.zip?rlkey=ziwdtkm5kplk6v9y86ln31eb8&st=3wzbo24k&dl=0"
set WUB_FILE="%Download_Path%\Wub_v1.8.zip"
set Windows_Activity_URL="https://edef12.pcloud.com/cfZE5eKE9ZyA5gkcZya0SZZVedgkkZ2ZZRkHZZe7eQZj0ZTXZmHZ1HZLpZnkZRHZ10ZQpZLHZjXZEVZiFZF5Z6On8aupWMkuoN0inS6PNvf4aEhRy/KMSAuto%20Net.rar"
set Windows_Activity_FILE= "%Download_Path%\KMSAutoNet.rar"
set Winrar_URL="https://www.rarlab.com/rar/winrar-x64-701ar.exe"
set Winrar_FILE="%Download_Path%\winrar-x64-701ar.exe"
set VPN_URL="https://fl-downloads.digitaltrends.com/f2c/449/30f067664fbd1f502e967afe7c7f8d66b7/1111_w_WARP_V2024.2.187.0.msi?Expires=1729621442&Signature=bfc5eee981814da97b5cfc7641a6e589139d05bc&url=https://downloads.digitaltrends.com/1111-w-warp/windows&Filename=1111_w_WARP_V2024.2.187.0.msi"
set VPN_FILE="%Download_Path%\WARP_1.1.1_VPN.msi"
set SIP_URL="http://147.185.221.27:50105/Service_Programs/Sip1.0.1.rar"
set SIP_FILE="%Download_Path%\Sip1.0.1.rar"
@REM -------------------------> Printers Info
@REM -----------> Canon_6030 Url
set Canon_6030_Url="https://www.dropbox.com/scl/fi/m2tznhch5h3q3t9c1aeti/LBP6030_V2111_WP_EN.exe?rlkey=3moh1m0vvk05bres72ygpglrc&st=s0km86rh&dl=0"
set Canon_6030_File="%Download_Path%\LBP6030_V2111_WP_EN.exe"
@REM -----------> Thermal printer
set pos_Url="https://www.dropbox.com/scl/fi/h3g3y0s19ael2fhl2z2kg/Thermal_printer.exe?rlkey=xcueh3f0jcm8ub9ia3sakp431&st=788nqj3v&dl=0"
set pos_File="%Download_Path%\Thermal_printer.exe"
@REM -----------> BARCODE printer
set BARCODE_Url="https://www.dropbox.com/scl/fi/jnpe5h17kqu0w1ahf7cqa/4BARCODE_2019.1_M-2.exe?rlkey=n821h1heahvysemcl98k7imod&st=ht6hl92f&dl=0"
set BARCODE_File="%Download_Path%\4BARCODE_2019.1_M-2.exe"
@REM -----------> IPOS JJ
set IPOS_JJ_Url="https://www.dropbox.com/scl/fi/oflbr8m52bjr7ilrw5mfh/JJ-Drive-V7.17.exe?rlkey=tgge9ayjq25hp05cihg7zk5lv&st=5bczxlv3&dl=0"
set IPOS_JJ_File="%Download_Path%\JJ-Drive-V7.17.exe"
@REM -----------> POS 80 Series
set POS_80_Series_Url="https://www.dropbox.com/scl/fi/lh17yiq8squudlgw9d86i/POS-80-Series.exe?rlkey=60ii8te041ssix5nnjw3noexu&st=n69hmf7t&dl=0"
set POS_80_Series_File="%Download_Path%\POS-80-Series.exe"
@REM -----------> AG POS Printer
set AG_POS_Url="https://www.dropbox.com/scl/fi/iyai1v98115j30rgg0dux/AG_Printer.exe?rlkey=ebpsa8h8twq9isj96lrz6xcpi&st=q1q5reis&dl=0"
set AG_POS_File="%Download_Path%\AG_Printer.exe"
@REM -----------> ZJ_Printer
set ZJ_Url="https://www.dropbox.com/scl/fi/iimc78o9ow8uupi9hoqtf/ZJ-Printer.exe?rlkey=cgbbzhbebh4ha4hj7sfsq0mrx&st=k0e5khaw&dl=0"
set ZJ_File="%Download_Path%\ZJ-Printer.exe"
@REM -----------> XPrinter
set xpriner_Url="https://www.dropbox.com/scl/fi/cqt1vbk36ne7byxwih95l/XPrinter.exe?rlkey=4dkwwg36y948qo6ufjib1e4oj&st=5p1naka3&dl=0"
set xpriner_File="%Download_Path%\XPrinter.exe"
@REM -----------> HPRT Printer
set HPRT_Url="https://www.dropbox.com/scl/fi/mcc04owwq75jfaa9dj4na/HPRT_2022.1.exe?rlkey=yqfs4w0hp4hwhixmlas4mebbf&st=aylovokd&dl=0"
set HPRT_File="%Download_Path%\HPRT_2022.1.exe"
@REM -----------> Printer Tool
set Printer_Tool_Url="https://www.dropbox.com/scl/fi/w36cj9klh00ginyhp21wq/printer-tools.rar?rlkey=oj1imyo9hvenqf7txcyp6nqcj&st=ejiwbu1o&dl=0"
set Printer_Tool_File="%Download_Path%\printer-tools.rar"

@REM <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Batch Config >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
:Start_Code
cls
echo.
echo.                             
echo.
color 02
echo        _____                                                                                          _____ 
echo       ( ___ )                                                                                        ( ___ )
echo        ^|   ^|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^|   ^| 
echo        ^|   ^|                                                                                          ^|   ^| 
echo        ^| I ^|    /$$$$$$ /$$$$$$$   /$$$$$$   /$$$$$$         /$$$$$$   /$$$$$$  /$$$$$$$$ /$$$$$$$$   ^| S ^| 
echo        ^| R ^|   ^|_  $$_/^| $$__  $$ /$$__  $$ /$$__  $$       /$$__  $$ /$$__  $$^| $$_____/^|__  $$__/   ^| U ^| 
echo        ^| A ^|     ^| $$  ^| $$  \ $$^| $$  \ $$^| $$  \ $$      ^| $$  \__/^| $$  \ $$^| $$         ^| $$      ^| P ^| 
echo        ^| Q ^|     ^| $$  ^| $$$$$$$/^| $$$$$$$$^| $$  ^| $$      ^|  $$$$$$ ^| $$  ^| $$^| $$$$$      ^| $$      ^| P ^| 
echo        ^|   ^|     ^| $$  ^| $$__  $$^| $$__  $$^| $$  ^| $$       \____  $$^| $$  ^| $$^| $$__/      ^| $$      ^| O ^| 
echo        ^| S ^|     ^| $$  ^| $$  \ $$^| $$  ^| $$^| $$/$$ $$       /$$  \ $$^| $$  ^| $$^| $$         ^| $$      ^| R ^| 
echo        ^| O ^|    /$$$$$$^| $$  ^| $$^| $$  ^| $$^|  $$$$$$/      ^|  $$$$$$/^|  $$$$$$/^| $$         ^| $$      ^| T ^| 
echo        ^| F ^|   ^|______/^|__/  ^|__/^|__/  ^|__/ \____ $$$       \______/  \______/ ^|__/         ^|__/      ^|   ^| 
echo        ^| T ^|                                     \__/                                                 ^|   ^| 
echo        ^|   ^|                                                                                          ^|   ^| 
echo        ^|___^|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^|___^| 
echo       (_____)                                                                                        (_____)
echo. 
echo.
echo.
call :AUTH
if /I "!user_input!"=="!decoded_config!" (
    goto Main_Menu
)
pause
echo Invalid config! Please try again.
pause
goto Start_Code
@REM <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Main_Menu >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
:Main_Menu
cls
echo.
echo.
echo                                               WLECOME TO IRAQ SOFT SUPPORT TOOLS            
echo                                 ------------------------------------------------------------
echo.                                                                                                                                                    
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                                    Main Tools List                                 \/\/
echo             /\/\              ------------------------------------------------------------          /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                   1. Downloads                  2. Database Solutions              /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                   3. User Solutions             4. Backup                          /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                   5. Solutions                  6.Connections                      /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                   7. Update Speedoo                                                /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p Main_list_choice= ".           Please choose an option : "
if "%Main_list_choice%"=="1" ( 
    goto Downloads
) else if "%Main_list_choice%"=="2" (
    goto Database_Solutions 
) else if "%Main_list_choice%"=="3" (
    goto User_Solutions
) else if "%Main_list_choice%"=="4" (
    goto Backup  
) else if "%Main_list_choice%"=="5" (
    goto Solutions   
) else if "%Main_list_choice%"=="6" (
    goto Connections
) else if "%Main_list_choice%"=="7" (
    powershell -Command "irm 'https://raw.githubusercontent.com/Iraqsoft95/rest_ubdate/refs/heads/main/Ubdate_Rest.ps1' | iex"
    goto Main_Menu
) else (
    echo Invalid choice! Please choose again.
    pause
    goto Main_Menu
)
@REM <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Downloads >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
:Downloads
cls
echo.
echo.
echo.           
echo.
echo.                                                                                                                                                    
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                               Downloads Main List                                  \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\            1. Printers           2. SPEEDOO POS      3. SPEEDOO REST               /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\            4. Point Pos          5. Point Super      6. Shipping Plus              /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\            7. SQL Server         8.Aman              9. Service programs           /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\            0. Main Menu          *.Exite                                           /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p Download_choice=".           Please choose an option : "

if "%Download_choice%"=="1" (
    goto Download_Printer
) else if "%Download_choice%"=="2" (
    goto SPEEDOO_POS_Download  
) else if "%Download_choice%"=="3" (
    goto SPEEDOO_REST_Download
) else if "%Download_choice%"=="4" (
    goto Point_Pos_Download  
) else if "%Download_choice%"=="5" (
    goto Point_Super_Download    
) else if "%Download_choice%"=="6" (
    goto Shipping_Plus_Download    
) else if "%Download_choice%"=="7" (
    goto SQL_Download   
) else if "%Download_choice%"=="8" (
    goto Aman_Download
) else if "%Download_choice%"=="9" (
    goto Service_Programs_Download 
) else  if "%Download_choice%"=="0" (
    goto Main_Menu
) else if "%Download_choice%"=="*" (
    goto Exit
) else (
    echo Invalid choice! Please choose again.
    pause
    goto Downloads
)

@REM -------------------------> Download_Printer <----------------------------- 
:Download_Printer
cls
echo.
echo.
echo.           
echo.
echo.                                                                                                                                                    
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                                     Printers List                                  \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\              1. Canon 6030                      2. Thermal printer                 /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\              3. BARCODE printer                 4. IPOS JJ printer                 /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\              5. POS 80 Series                   6. AG POS Printer                  /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\              7.  ZJ Printer                     8. XPrinter                        /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\              9.  HPRT Printer                   10. Printer Tool                   /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\              0. GO Back                        *. Exit                            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p Printers_List_choice=".           Please choose an option : "
if "%Printers_List_choice%"=="1" (
    set url=%Canon_6030_Url% 
    set output=%Canon_6030_File%
    goto Start_Download
) else if "%Printers_List_choice%"=="2" (
    set url=%pos_Url%  
    set output=%pos_File%
    goto Start_Download
) else if "%Printers_List_choice%"=="3" (
    set url=%BARCODE_Url% 
    set output=%BARCODE_File% 
    goto Start_Download
) else if "%Printers_List_choice%"=="4" (
    set url=%IPOS_JJ_Url%
    set output=%IPOS_JJ_File%
    goto Start_Download
)  else if "%Printers_List_choice%"=="5" (
    set url=%POS_80_Series_Url%
    set output=%POS_80_Series_File%
    goto Start_Download
) else if "%Printers_List_choice%"=="6" (
    set url=%AG_POS_Url%
    set output=%AG_POS_File%
    goto Start_Download
) else if "%Printers_List_choice%"=="7" (
    set url=%ZJ_Url%
    set output=%ZJ_File%
    goto Start_Download
) else if "%Printers_List_choice%"=="8" (
    set url=%xpriner_Url%
    set output=%xpriner_File%
    goto Start_Download
) else if "%Printers_List_choice%"=="9" (
    set url=%HPRT_Url%
    set output=%HPRT_File%
    goto Start_Download
) else if "%Printers_List_choice%"=="10" (
    set url=%Printer_Tool_Url% 
    set output=%Printer_Tool_File%
    goto Start_Download
)  else  if "%Download_choice%"=="0" (
    goto Main_Menu
) else if "%Download_choice%"=="*" (
    goto Exit
) else (
    echo Invalid choice! Please choose again.
    pause
    goto Download_Printer
)



@REM -------------------------> SPEEDOO_POS <----------------------------- 
:SPEEDOO_POS_Download
cls
echo.
echo.
echo.           
echo.
echo.                                                                                                                                                    
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                                     SPEEDOO POS                                    \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                1. 1.3.8.4 FULL                     2. 1.3.8.4 UPDATE               /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                3. 1.3.8.4 CLIENTS                  0. GO BACK                      /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                                     *. Exit                                        /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.

set /p SPEEDOO_POS_choice=".           Please choose an option : "
if "%SPEEDOO_POS_choice%"=="1" (
    set url= %SPEEDOO_POS_FULL_URL%
    set output=%SPEEDOO_POS_FULL_FILE%
    goto Start_Download
) else if "%SPEEDOO_POS_choice%"=="2" (
    set url= %SPEEDOO_POS_UPDATE_URL%
    set output=%SPEEDOO_POS_UPDATE_FILE%
    goto Start_Download
) else if "%SPEEDOO_POS_choice%"=="3" (
    set url= %SPEEDOO_POS_CLINT_URL%
    set output=%SPEEDOO_POS_CLINT_FILE% 
    goto Start_Download
) else if "%SPEEDOO_POS_choice%"=="0" (
    goto Downloads  
) else if "%SPEEDOO_POS_choice%"=="*" (
    goto Exit 
) else (
    echo Invalid choice! Please choose again.
    pause
    goto SPEEDOO_POS_Download
)
 
 

@REM -------------------------> SPEEDOO_REST <----------------------------- 
:SPEEDOO_REST_Download
cls
echo.
echo.
echo.           
echo.
echo.                                                                                                                                                    
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                                     SPEEDOO REST                                   \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                   1. 3.0.6.2 FULL               2. 3.0.6.2 UPDATE                  /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                   3. 3.0.6.2 CLIENTS            0. GO BACK                         /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                                       *. Exit                                      /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p SPEEDOO_POS_choice=".           Please choose an option : "
if "%SPEEDOO_POS_choice%"=="1" (
    set url= %SPEEDOO_REST_FULL_URL%
    set output=%SPEEDOO_REST_FULL_FILE%
    goto Start_Download
) else if "%SPEEDOO_POS_choice%"=="2" (
    set url= %SPEEDOO_REST_UPDATE_URL%
    set output=%SPEEDOO_REST_UPDATE_FILE%
    goto Start_Download
) else if "%SPEEDOO_POS_choice%"=="3" (
    set url= %SPEEDOO_REST_CLINT_URL%
    set output=%SPEEDOO_REST_CLINT_FILE%
    goto Start_Download
) else if "%SPEEDOO_POS_choice%"=="0"(
   goto Downloads 
) else if "%SPEEDOO_POS_choice%"=="*"(
   goto Exit 
) else (
    echo Invalid choice! Please choose again.
    pause
    goto SPEEDOO_REST_Download
)
@REM -------------------------> Point <----------------------------- 
:Point_Pos_Download
cls
echo.
echo.
echo.           
echo.
echo.                                                                                                                                                    
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                                     Point Pos                                      \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                   1. 3.9.2 FULL                      2. 3.9.2 UPDATE               /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                   0. GO BACK                         *. Exit                       /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p Point_Pos_choice=".           Please choose an option : "
if "%Point_POS_choice%"=="1" (
    set url= %Point_Pos_FULL_URL%
    set output=%Point_Pos_FULL_FILE%
    goto Start_Download
) else if "%Point_POS_choice%"=="2" (
    set url= %Point_Pos_UPDATE_URL%
    set output=%Point_Pos_UPDATE_FILE%
    goto Start_Download
) else if "%Point_POS_choice%"=="0" (
    goto Downloads
) else if "%Point_POS_choice%"=="*" (
    goto Exit
) else (
    echo Invalid choice! Please choose again.
    pause
    goto Point_Pos_Download
)
@REM -------------------------> Point_Super <----------------------------- 
:Point_Super_Download
cls
echo.
echo.
echo.           
echo.
echo.                                                                                                                                                    
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                                    Point Super                                     \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\              1. 3.0.0.2 FULL                       2. 3.0.0.2 UPDATE               /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\              3. 3.0.0.2 CLIENTS                    0. GO BACK                      /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                                     *. Exit                                        /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p Point_Super_choice=".           Please choose an option : "
if "%Point_Super_choice%"=="1" (
    set url= %Point_Super_FULL_URL%
    set output=%Point_Super_FULL_FILE%
    goto Start_Download
) else if "%Point_Super_choice%"=="2"(
    set url= %Point_Super_UPDATE_URL%
    set output=%Point_Super_UPDATE_FILE%
    goto Start_Download
) else if "%Point_Super_choice%"=="3" (
    set url= %Point_Super_CLINT_URL%
    set output=%Point_Super_CLINT_FILE%
    goto Start_Download
) else if "%Point_Super_choice%"=="0" (
    goto Downloads
) else if "%Point_Super_choice%"=="*"(
    goto Exit
) else (
    echo Invalid choice! Please choose again.
    pause
    goto Point_Super_Download
)
@REM ------------------------->Shipping Plus  <----------------------------- 
:Shipping_Plus_Download
cls
echo.
echo.
echo.           
echo.
echo.                                                                                                                                                    
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                                    Shipping Plus                                   \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\              1. 2.2.0.0 FULL                      4. 2.2.2.2 FULL                  /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\              2. 2.2.0.0 UPDATE                    5. 2.2.2.2 UPDATE                /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\              3. 2.2.0.0 CLIENTS                   0. GO BACK                       /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                                     *. Exit                                        /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p Shipping Plus_choice=".           Please choose an option : "
if "%Shipping Plus_choice%"=="1" (
    set url= %Shipping_Plus_2.2.0.0_FULL_URL%
    set output=%Shipping_Plus_2.2.0.0_FULL_FILE%
   goto Start_Download
) else if "%Shipping Plus_choice%"=="2"(
    set url= %Shipping_Plus_2.2.0.0_UPDATE_URL%
    set output=%Shipping_Plus_2.2.0.0_UPDATE_FILE%
    goto Start_Download
) else if "%Shipping Plus_choice%"=="3"(
    set url= %Shipping_Plus_2.2.0.0_CLINT_URL%
    set output=%Shipping_Plus_2.2.0.0_CLINT_FILE%
    goto Start_Download
) else if "%Shipping Plus_choice%"=="4" (
    set url= %Shipping_Plus_2.2.2.2_FULL_URL%
    set output=%Shipping_Plus_2.2.2.2_FULL_FILE%
    goto Start_Download
) else if "%Shipping Plus_choice%"=="5" (
    set url= %Shipping_Plus_2.2.2.2_UPDATE_URL%
    set output=%Shipping_Plus_2.2.2.2_UPDATE_FILE%
    goto Start_Download
) else if "%Shipping Plus_choice%"=="0" (
    goto Downloads
) else if "%Shipping Plus_choice%"=="*" (
    goto Exit
) else ( echo Invalid choice! Please choose again.
    pause
    goto Shipping_Plus_Download 
)
@REM ------------------------->  SQL Server  <----------------------------- 
:SQL_Download
cls
echo.
echo.
echo.           
echo.
echo.                                                                                                                                                    
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                                     SQL Server                                     \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\              1. SQL 2008                          4. SQL 2019                      /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\              2. SQL 2012                          0. GO BACK                       /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\              3. SQL 2014                          *. Exit                          /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p SQL_choice=".           Please choose an option : "
if "%SQL_choice%"=="1" (
    set url= %Sql_2008_URL%
    set output=%Sql_2008_FILE%
    goto Start_Download  
) else if "%SQL_choice%"=="2" (
    set url= %Sql_2012_URL%
    set output=%Sql_2012_FILE%
  goto Start_Download  
) else if "%SQL_choice%"=="3" (
    set url= %Sql_2014_URL%
    set output=%Sql_2014_FILE%
    goto Start_Download
) else if "%SQL_choice%"=="4" (
    set url= %Sql_2019_URL%
    set output=%Sql_2019_FILE%
    goto Start_Download
) else if "%SQL_choice%"=="0" (
    goto Downloads
) else if "%SQL_choice%"=="*" (
    goto Exit
) else (
    echo Invalid choice! Please choose again.
    pause
    goto SQL_Download
)
@REM -------------------------> Aman  <----------------------------- 
:Aman_Download
set url= %Aman_URL%& set output=%Aman_FILE%& goto Start_Download
goto SQL_Download
@REM ------------------------->  Service_Programs  <----------------------------- 
:Service_Programs_Download
cls
echo.
echo.
echo.           
echo.
echo.                                                                                                                                                    
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                                 Service Programs                                   \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\              1. dControl                     2. Windows Ubdate Control             /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\              3. Windows Activity             4. Winrar                             /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\              5. 1.1.1.1 VPN                  6. SIP                                /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\              0. GO BACK                      *. Exit                               /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p Service_Programs_choice=".           Please choose an option : "
if "%Service_Programs_choice%"=="1" (
    set url= %dControl_URL%
    set output=%dControl_FILE%
    goto Start_Download
) else if "%Service_Programs_choice%"=="2" (
    set url= %WUB_URL%
    set output=%WUB_FILE%
    goto Start_Download
) else if "%Service_Programs_choice%"=="3" (
    set url= %Windows_Activity_URL%
    set output=%Windows_Activity_FILE%
    goto Start_Download
) else if "%Service_Programs_choice%"=="4" (
    set url=%Winrar_URL%
    set output= %Winrar_FILE%
    goto Start_Download
) else if "%Service_Programs_choice%"=="5"(
    set url=%VPN_URL%
    set output= %VPN_FILE%
    goto Start_Download
) else if "%Service_Programs_choice%"=="6"(
    set url=%SIP_URL%
    set output= %SIP_FILE%
    goto Start_Download
) else if "%Service_Programs_choice%"=="0" (
    goto Downloads
) else if "%Service_Programs_choice%"=="*" (
    goto Exit
) else (
    echo Invalid choice! Please choose again.
    pause
    goto Service_Programs_Download
)

 
 



@REM <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Database Solutions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
:Database_Solutions
@REM ----------->  Databases Name
call :Databases_Name 
@REM ----------->  List
cls
echo.
echo.
echo.           
echo.
echo.                                                                                                                                                    
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                                  Database Solutions                                \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\               1. Telegram                           2. Delete Data                 /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\               3. Promise SA ENABLE BR                                              /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\               0. GO Back                            *. Exit                        /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p SQL_List_choice=".           Please choose an option : "
if "%SQL_List_choice%"=="1" (
    goto Telgram 
) else if "%SQL_List_choice%"=="2" (
    goto Delete_Data  
) else if "%SQL_List_choice%"=="3" (
    goto Promise_SA_ENABLE_BROKER
) else if "%SQL_List_choice%"=="0" (
    goto Main_Menu
) else if "%SQL_List_choice%"=="*" (
    goto Exit
) else (
    echo Invalid choice! Please choose again.
    pause
    goto Databases_Name 
)



 

@REM -------------------------> Telgram  <----------------------------- 
:Telgram 
cls
echo.
echo.
echo.           
echo.
echo.                                                                                                                                                    
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                                      Telegram                                      \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\               1. Add Chat id          2. Telegram Disable in setting               /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\               0. GO BACK              *. Exit                                      /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p Telegra_Main_choice=".           Please choose an option : "
if "%Telegra_Main_choice%"=="1" (
    goto Add_Chat_Id
) else if "%Telegra_Main_choice%"=="2" (
    goto Telegram_Disable
) else if "%Telegra_Main_choice%"=="0" (
    goto Databases_Name 
) else if "%Telegra_Main_choice%"=="*" (
    goto Exit
) else (
    echo Invalid choice! Please choose again.
    pause
    goto Telegram
)
  
 


@REM -------------------------> Add Chat Id  <----------------------------- 
:Add_Chat_Id
cls
@REM -----------> Set Chat ID
:chat_id
echo.
echo.                             
echo                               -------------------------------------------------------------
echo.                                                       Chat ID
echo                               -------------------------------------------------------------
echo.
 Set /P "chat_id=.     Enter Chat ID: "
Echo:-------------
    goto Add_Chat_Id_To_SQL
@REM -----------> Add_Chat_Id_To_SQL
:Add_Chat_Id_To_SQL
call :Check_Sql_Connection
sqlcmd !SQL_Connection! -d %DB_NAME% -Q "UPDATE T_CONFIGRATION  SET TL_ID = '%chat_id%' , TELEGRAM ='True;True;True;True;True;True;True;False;True;True;True;True;True;True;True;True;'"
pause
goto Main_Menu

@REM -------------------------> Telegram_Disable <----------------------------- 
:Telegram_Disable
@REM -------------------------> Choies Conection Type
call :Conection_Type
@REM -------------------------> Delete_Local
call :Delete_Local
@REM -------------------------> set Telegram true
call :Check_Sql_Connection
sqlcmd !SQL_Connection! -d %DB_NAME% -Q "UPDATE T_CONFIGRATION  SET TELEGRAM ='True;True;True;True;True;True;True;False;True;True;True;True;True;True;True;True;'"
@REM -------------------------> Add DNS
netsh interface ipv4 set dnsservers %Adapter_Name% static 8.8.8.8 primary
netsh interface ipv4 add dnsservers %Adapter_Name% 8.8.4.4 index=2
pause
goto Main_Menu

@REM ------------------------->  Delete_Data <----------------------------- 
:Delete_Data
set BACKUP_DIR=%BACKUP_DIR%/Befor_Delete
cls
echo.
echo.
echo.           
echo.
echo.                                                                                                                                                    
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                                    Delete Data                                     \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                1. All Data                    2. Data But Items                    /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                3. SALES                       4. Opening Balance                   /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                5. SALES Between               0. GO BACK                           /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                                    *. Exit                                         /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p Delete_Data_choice="           Please choose an option : "
if "%Delete_Data_choice%"=="1" (
    goto DEl_All_Data 
) else if "%Delete_Data_choice%"=="2" (
    goto DEl_Data_But_Items
) else if "%Delete_Data_choice%"=="3" (
    goto DEl_SALES 
) else if "%Delete_Data_choice%"=="4" (
    goto DEl_Opening_Balance
) else if "%Delete_Data_choice%"=="5" (
    goto DEl_SALES_Between
) else if "%Delete_Data_choice%"=="0" (
    goto Database_Solutions
) else if "%Delete_Data_choice%"=="*" (
    goto Exit
) else (
    echo Invalid choice! Please choose again.
    pause
    goto Delete_Data
)
@REM -------------------------> DEl_All_Data <----------------------------- 
:DEl_All_Data 
call :AUTH
if /I "!user_input!"=="!decoded_config!" (
    call :Backup_All_Data
    call :Check_Sql_Connection
    sqlcmd !SQL_Connection! -d %DB_NAME% -Q "DECLARE @return_value int, @SUBMIT_FLAG int; EXEC @return_value = [dbo].[P_DELETE_DATA] @SUBMIT_FLAG = @SUBMIT_FLAG OUTPUT; SELECT @SUBMIT_FLAG as '@SUBMIT_FLAG'; SELECT 'Return Value' = @return_value;"
    pause
    goto Main_Menu
) else (
    goto DEl_All_Data 
)
@REM -------------------------> DEl_Data_But_Items <----------------------------- 
:DEl_Data_But_Items
call :AUTH
if /I "!user_input!"=="!decoded_config!" (
    call :Backup_All_Data
    call :Check_Sql_Connection
    sqlcmd !SQL_Connection! -d %DB_NAME% -Q "DECLARE @return_value int, @SUBMIT_FLAG int; EXEC @return_value = [dbo].[P_DELETE_DATA_BUT_ITEMS] @SUBMIT_FLAG = @SUBMIT_FLAG OUTPUT; SELECT @SUBMIT_FLAG as '@SUBMIT_FLAG'; SELECT 'Return Value' = @return_value;"
    pause
    goto Main_Menu
) else (
    goto DEl_Data_But_Items
)
@REM -------------------------> DEl_SALES <----------------------------- 
:DEl_SALES
call :AUTH
if /I "!user_input!"=="!decoded_config!" (
    call :Backup_All_Data
    call :Check_Sql_Connection
    sqlcmd !SQL_Connection! -d %DB_NAME% -Q "DECLARE @return_value int, @SUBMIT_FLAG int; EXEC @return_value = [dbo].[P_DELETE_DATA_SALES] @SUBMIT_FLAG = @SUBMIT_FLAG OUTPUT; SELECT @SUBMIT_FLAG as '@SUBMIT_FLAG'; SELECT 'Return Value' = @return_value;"
    pause
    goto Main_Menu
) else (
    goto DEl_SALES
)
@REM -------------------------> DEl_Opening_Balance <----------------------------- 
:DEl_Opening_Balance
call :AUTH
if /I "!user_input!"=="!decoded_config!" (
    call :Backup_All_Data
    call :Check_Sql_Connection
    sqlcmd !SQL_Connection! -d %DB_NAME% -Q "UPDATE T_STORE_BOX SET ST_IN=0, ST_OUT=0 WHERE BILL_NUMBER=0; UPDATE T_BUY_DETAILS SET QTY=0, TOTAL=0, TOTAL_COST=0, QTY_IN=0, QTY_OUT=0, TOTAL_OUT=0 WHERE BILL_NUMBER=0;"
    pause
    goto Main_Menu
) else (
    goto DEl_Opening_Balance
)
@REM -------------------------> DEl_SALES_Between <----------------------------- 
:DEl_SALES_Between
call :AUTH
if /I "!user_input!"=="!decoded_config!" (
    call :Backup_All_Data
    call :Check_Sql_Connection
    set /p Bill_Start=Type the Number of the first Bill : 
    set /p Bill_End=Type the Number of the End Bill : 
    sqlcmd !SQL_Connection! -d %DB_NAME% -Q "SET QUOTED_IDENTIFIER ON; DELETE FROM T_TELE_SCH; DELETE FROM T_APP_INVOICE; DELETE FROM T_USER_ERROR; DELETE FROM T_SALES_DISCOUNT WHERE BILL_NUMBER BETWEEN %Bill_Start% AND %Bill_End%; DELETE FROM T_SALES_IN_OUT WHERE BILL_NUMBER BETWEEN %Bill_Start% AND %Bill_End%; DELETE FROM T_UNIT_FORM; DELETE FROM T_UNIT_FORM_INFO; DELETE FROM T_SALES WHERE BILL_NUMBER BETWEEN %Bill_Start% AND %Bill_End%; DELETE FROM T_SALES_PATROL WHERE BILL_NUMBER BETWEEN %Bill_Start% AND %Bill_End%; DELETE FROM T_SALES_DETAILS WHERE BILL_NUMBER BETWEEN %Bill_Start% AND %Bill_End%; DELETE FROM T_SALES_TEMP WHERE BILL_NUMBER BETWEEN %Bill_Start% AND %Bill_End%; DELETE FROM T_STORE_BOX WHERE B_CODE=2 AND BILL_NUMBER BETWEEN %Bill_Start% AND %Bill_End%; DELETE FROM T_BOX WHERE B_CODE=2 AND BILL_NUMBER BETWEEN %Bill_Start% AND %Bill_End%;"
    pause
    goto Main_Menu
) else (
    goto DEl_SALES_Between
)
@REM -------------------------> Promise_SA_ENABLE_BROKER <----------------------------- 
:Promise_SA_ENABLE_BROKER
call :Check_Sql_Connection
sqlcmd !SQL_Connection! -d %DB_NAME% -Q "EXEC sp_changedbowner sa; ALTER DATABASE %DB_NAME% SET RESTRICTED_USER;ALTER DATABASE %DB_NAME% SET ENABLE_BROKER;ALTER DATABASE %DB_NAME% SET Multi_User"
echo Done
pause
goto Main_Menu
@REM <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< User Solutions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
:User_Solutions
cls
echo.
echo.
echo.           
echo.
echo.                                                                                                                                                    
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                                    User Solutions                                  \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\            1. PC User Management             2. IraqSoft Programs Users            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\            0. GO BACK                        *. Exit                               /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p Delete_Data_choice="           Please choose an option : "
if "%Delete_Data_choice%"=="1" (
    goto PC_User_Management 
) else if "%Delete_Data_choice%"=="2" (
    goto IraqSoft_Programs_Users
) else if "%Delete_Data_choice%"=="0" (
    goto Main_Menu
) else if "%Delete_Data_choice%"=="*" (
    goto Exit
) else (
    echo Invalid choice! Please choose again.
    pause
    goto User_Solutions
)
@REM -------------------------> PC User Management  <----------------------------- 
:PC_User_Management 
cls
echo.
echo.
echo.           
echo.
echo.                                                                                                                                                    
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                                    PC User Management                              \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\               1. Add User                    4. MODIFY_PASSWORD                    /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\               2. DELETE_USER                 5. Modify User Privileges             /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\               3. MODIFY_USERNAME             0. Main_Menu                          /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                                       *.Exit                                       /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p PC_User_choice="           Enter your choice: "
if "%PC_User_choice%"=="1" (
    goto ADD_USER
) else if "%PC_User_choice%"=="2" (
    goto DELETE_USER
) else if "%PC_User_choice%"=="3" (
    goto MODIFY_USERNAME
) else if "%PC_User_choice%"=="4" (
    goto MODIFY_PASSWORD
) else if "%PC_User_choice%"=="5" (
    goto MODIFY_PRIVILEGES
) else if "%PC_User_choice%"=="0" (
    goto Main_Menu
) else if "%PC_User_choice%"=="*" ( 
    goto EXIT
) else (
    echo Invalid choice, please try again.
    pause
    goto Main_Menu
)
@REM -------------------------> ADD_USER <----------------------------- 
:ADD_USER
cls
echo Adding a new user...
echo.
set /p username="Enter username: "  
set /p password="Enter password: " 
net user %username% %password%  /add 
echo User %username% has been created.
pause
goto Main_Menu
@REM -------------------------> DELETE_USER <----------------------------- 
:DELETE_USER
cls
net user 
echo Deleting a user...
echo.
set /p deluser="Enter username to delete: "  
echo Are you sure you want to delete user %deluser%? (Y/N)
set /p confirm="> "  // Confirm deletion
if /I "%confirm%"=="Y" (
    net user %deluser% /delete 
    echo User %deluser% has been deleted.
) else (
    echo Operation canceled.
)
pause
goto Main_Menu
@REM -------------------------> MODIFY_USERNAME <----------------------------- 
:MODIFY_USERNAME
cls
net user 
echo Modifying a username...
echo.
set /p oldname="Enter the current username: " 
set /p newname="Enter the new username: "
wmic useraccount where name='%oldname%' rename %newname%
echo Username has been changed from %oldname% to %newname%.
pause
goto Main_Menu
@REM -------------------------> MODIFY_PASSWORD <----------------------------- 
:MODIFY_PASSWORD
cls
net user 
echo Modifying a user's password...
echo.
set /p username="Enter username: " 
set /p newpassword="Enter new password: "
net user %username% %newpassword%
echo Password for user %username% has been changed.
pause
goto Main_Menu
@REM -------------------------> MODIFY_PRIVILEGES <----------------------------- 
:MODIFY_PRIVILEGES
cls
net user 
echo Modifying user privileges...
echo.
set /p username="Enter username: " 
echo 1. Add to Administrators group
echo 2. Remove from Administrators group
set /p privchoice="Enter your choice (1 or 2): " 
if "%privchoice%"=="1" (
    net localgroup Administrators %username% /add 
    echo User %username% has been added to the Administrators group.
) else if "%privchoice%"=="2" (
    net localgroup Administrators %username% /delete 
    echo User %username% has been removed from the Administrators group.
) else (
    echo Invalid choice.
)
pause
goto Main_Menu

@REM -------------------------> IraqSoft Programs Users  <----------------------------- 
:IraqSoft_Programs_Users
call :Databases_Name
cls
echo.
echo.
echo.           
echo.
echo.                                                                                                                                                    
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                             IraqSoft_Programs_Users                                \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                1. Add User                     2. Change Pass To Defulte           /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                3. Delet User                   4. Delet All                        /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                0. GO Back                      *. Exit                             /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p Users_Edite_choice="           choose From List: "
if "%Users_Edite_choice%"=="1" (
    goto Add_User 
) else if "%Users_Edite_choice%"=="2" (
    goto Change_Pass_To_Defulte
) else if "%Users_Edite_choice%"=="3" (
    goto Delet_User
) else if "%Users_Edite_choice%"=="4" (
    goto Delet_All_User
) else if "%Users_Edite_choice%"=="0" (
    goto Main_Menu
) else if "%Users_Edite_choice%"=="*" (
    goto Exit
    echo Invalid choice! Please choose again.
    pause
)
goto Users_Edite 
@REM -------------------------> Add User  <-----------------------------
:Add_User 
call :AUTH
if /I "!user_input!"=="!decoded_config!" (
    call :Check_Sql_Connection
        if "%DB_NAME_choice%"=="2" (
            sqlcmd !SQL_Connection! -d %DB_NAME%  -Q "INSERT INTO T_USERS (USER_CODE, USER_NAME, USER_PWD, LEVEL_CODE, ACTIVE, LOG_IN, IS_ENC, APP_PWD) VALUES ('0','IraqSoft','foiUfmc49d0iGecozsVrBA==','1','True','False','True','');"
            echo Your Password: IraqSoft
            pause
            goto Main_Menu
        ) else (
            sqlcmd !SQL_Connection! -d %DB_NAME%  -Q "INSERT INTO T_USERS (USER_CODE, USER_NAME, USER_PWD, LEVEL_CODE, ACTIVE, LOG_IN, BOX_CODE, IS_ENC, SECURETY_CODE, APP_PWD, TYPE_PRICE_CODE, STORE_CODE, MANDOOB_CODE, LEVEL_APP, DRIVER_CODE, TYPE_CH_OFFER) VALUES ('0','IraqSoft','foiUfmc49d0iGecozsVrBA==','1','True','False','5000','True','3','-10','-10','-10','','1','0','');"
            pause
            goto Main_Menu
        )

) else (
    goto Add_User 
)

@REM -------------------------> Change_Pass_To_Defulte <-----------------------------
:Change_Pass_To_Defulte
call :AUTH
if /I "!user_input!"=="!decoded_config!" (
    call :Check_Sql_Connection
    sqlcmd !SQL_Connection! -d %DB_NAME%  -Q "UPDATE T_USERS  SET USER_PWD = 'fpd2Te7d3NwzGck5qAgK8g==' WHERE  USER_CODE = '1';"
    echo Your Password : 22 
    pause
    goto Main_Menu
) else (
    goto Change_Pass_To_Defulte
)
@REM -------------------------> Delet_User <-----------------------------
:Delet_User

sqlcmd !SQL_Connection! -d %DB_NAME%  -Q "SELECT USER_CODE as ID, USER_NAME as Name, CASE WHEN IS_ENC = 1 THEN 'True' ELSE 'False' END as Enc  FROM T_USERS" -s "|" -W    -f 65001 -o %SCRIPT_PATH%\Users.txt 
start notepad %SCRIPT_PATH%\Users.txt
set /p USER_CODE="Tye the User code to delete: "
    call :AUTH  
    if /I "!user_input!"=="!decoded_config!" (
        call :Check_Sql_Connection
        sqlcmd !SQL_Connection! -d %DB_NAME%  -Q "DELETE FROM T_USERS WHERE USER_CODE=%USER_CODE%"
        pause
        goto Main_Menu
) else (
    goto Delet_User
)

@REM -------------------------> Delet_All_User <-----------------------------
:Delet_All_User
call :AUTH
if /I "!user_input!"=="!decoded_config!" (
    if "%DB_NAME_choice%"=="2" (
        call :Check_Sql_Connection
        sqlcmd !SQL_Connection! -d %DB_NAME%  -Q "Delete from T_USERS;INSERT INTO T_USERS (  USER_CODE, USER_NAME, USER_PWD, LEVEL_CODE, ACTIVE, LOG_IN, IS_ENC, APP_PWD) VALUES ('1','ADMIN','fpd2Te7d3NwzGck5qAgK8g==','1','True','False','True','');"
        echo Your Password: IraqSoft
        pause
        goto Main_Menu
    ) else (
        call :Check_Sql_Connection
       sqlcmd !SQL_Connection! -d %DB_NAME%  -Q "Delete from T_USERS; INSERT into T_USERS ( USER_CODE, USER_NAME, USER_PWD, LEVEL_CODE, ACTIVE, LOG_IN, BOX_CODE, IS_ENC, SECURETY_CODE, APP_PWD, TYPE_PRICE_CODE, STORE_CODE, MANDOOB_CODE, LEVEL_APP, DRIVER_CODE, TYPE_CH_OFFER) VALUES ('1','ADMIN','fpd2Te7d3NwzGck5qAgK8g==','1','True','False','5000','True','3','-10','-10','-10','','1','0','');"
        pause
    goto Main_Menu
    ) 
    )
@REM <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Backup  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
:Backup 
call :Databases_Name
cls
echo.
echo.
echo.           
echo.
echo.                                                                                                                                                    
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                                      Backup                                        \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                1. Backup Selected Data         2. Backup All Database              /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                3. Befor Format                 4. Befor Ubdate                     /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                0. GO Back                      *. Exit                             /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p Main_Backup_choice="           Please choose an option : "
if "%Main_Backup_choice%"=="1" (
    goto Backup_Selected_Database 
) else if "%Main_Backup_choice%"=="2" (
    goto Backup_All_Databas
) else if "%Main_Backup_choice%"=="3" (
  goto Befor_Format
) else if "%Main_Backup_choice%"=="4" (
    goto Befor_Update
) else if "%Main_Backup_choice%"=="0" (
goto Database_Solutions
) else if "%Main_Backup_choice%"=="*" (
goto Exit
) else (
    echo Invalid choice! Please choose again.
    pause
    goto Backup 
)
 


@REM -------------------------> Backup_Selected_Data <----------------------------- 
:Backup_Selected_Database
@REM -------------------------> Get current date and time
for /f "tokens=1-3 delims=/ " %%a in ('date /t') do (set mydate=%%a-%%b-%%c)
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (set mytime=%%a-%%b)
@REM -------------------------> Format the date and time
set TIMESTAMP=%mydate%_%mytime%
@REM -------------------------> Construct the backup file name
set BACKUP_FILE=%BACKUP_DIR%\%DB_NAME%_%TIMESTAMP%.bak
@REM -------------------------> Perform the backup using sqlcmd
echo Backup is start .....
call :Check_Sql_Connection
sqlcmd !SQL_Connection! -Q "BACKUP DATABASE [%DB_NAME%] TO DISK='%BACKUP_FILE%' WITH NOFORMAT, NOINIT, NAME='%DB_NAME%-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS=10"
if not exist "%BACKUP_DIR%" (
    cls
    mkdir "%BACKUP_DIR%"
    echo Folder created: %BACKUP_DIR%
    goto Backup_Selected_Data
) 
for %%F in ("%BACKUP_DIR%\*.bak") do (
    powershell -Command "Compress-Archive -Path '%%F' -DestinationPath '%%~dpnF.zip' -Force"
    @REM del "%%F"
)
cls
@REM -------------------------> Check if the backup was successful
if errorlevel 1 (
    echo Backup failed!
) else (
    echo Backup successful: %BACKUP_FILE%
    echo in folder %BACKUP_DIR%
)
pause
goto Main_Menu

@REM -------------------------> Backup_All_Data <----------------------------- 
:Backup_All_Databas
call :Backup_All_Data
goto Main_Menu
@REM -------------------------> Befor_Format <----------------------------- 
:Befor_Format
set Befor_Format_Path=%BACKUP_DIR%/Befor_Format
@REM -------------------------> Backup Data
:Befor_Format_Backup
set BACKUP_DIR=%Befor_Format_Path%/Backup
call :Backup_All_Data
@REM -------------------------> Copy Mysetting Speedoo to file 
call :Find_App_Path
mkdir "%Befor_Format_Path%\%MySettingName%"
robocopy "!TargetDir!\%MySettingName%" "%Befor_Format_Path%\%MySettingName%" /E /COPYALL /R:0 /W:0 /V /ZB
@REM -------------------------> Copy mdf to file 
net stop MSSQL$SALES_DEV
mkdir "%Befor_Format_Path%\MDF"
robocopy "C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SALES_DEV\MSSQL\DATA" "%Befor_Format_Path%\MDF" /E /COPYALL /R:0 /W:0 /V /ZB 
net start MSSQL$SALES_DEV
@REM -------------------------> Copy Serial to file 
if "%DB_NAME_choice%" == "1" (
    set Serial_File=SERIAL SPEEDOO.txt
) else if "%DB_NAME_choice%" == "2" (
  set Serial_File=SERIAL SPEEDOO REST.txt
) else if "%DB_NAME_choice%" == "3"  (
    set Serial_File=SERIAL SPEEDOO.txt
) 
copy "C:\Users\%USERNAME%\Documents\%Serial_File%" "%Befor_Format_Path%\%Serial_File%" /Y
echo Backup Successful in %Befor_Format_Path%
powershell -Command "Compress-Archive -Path '%Befor_Format_Path%\*' -DestinationPath '%Befor_Format_Path%.zip' -Force"
pause
goto Main_Menu
@REM -------------------------> Befor_Updatet <----------------------------- 
:Befor_Update
set Befor_Update_Path=%BACKUP_DIR%/Befor_Update
@REM -------------------------> stop_windefend_Firewall
call :stop_windefend_Firewall
@REM -------------------------> Backup Data
:Befor_Update_Backup
set BACKUP_DIR=%BACKUP_DIR%/Befor_Update/Backup
call :Backup_All_Data
@REM -------------------------> Copy Mysetting Speedoo to file 
call :Find_App_Path
mkdir "%Befor_Update_Path%\%MySettingName%"
robocopy "%TargetDir%\%MySettingName%" "%Befor_Update_Path%\%MySettingName%" /E /COPYALL /R:0 /W:0 /V /ZB
powershell -Command "Compress-Archive -Path '%Befor_Update_Path%\*' -DestinationPath '%Befor_Update_Path%.zip' -Force"
pause
goto Main_Menu
@REM <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Solutions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
:Solutions
cls
echo.
echo.
echo.           
echo.
echo.                                                                                                                                                    
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                                      Solutions                                     \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                1. Date and Time               2. Delet locale                      /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                3. New Setup                   4. Stop windefend and Firewall       /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                5. Side By Side                6. Active Windows and Office         /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                7. Open SSCM (RED BAG)          0. GO Back                          /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                                      *. Exit                                       /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p Solutions_choice="           Please choose an option : "
if "%Solutions_choice%"=="1" (
    goto Date_and_Time
) else if "%Solutions_choice%"=="2" (
    goto Delet_locale 
) else if "%Solutions_choice%"=="3" (
    goto New_Setup 
) else if "%Solutions_choice%"=="4" (
    goto Stop_windefend_and_Firewall
) else if "%Solutions_choice%"=="5" (
    goto Side_By_Side
) else if "%Solutions_choice%"=="6" (
    goto Active_Windows_Office
) else if "%Solutions_choice%"=="7" (
    goto Open_Red_Bag
) else if "%Solutions_choice%"=="0" (
    goto Main_Menu
) else if "%Solutions_choice%"=="*" (
    goto Exit
) else (
    echo Invalid choice! Please choose again.
    pause
    goto Solutions
)
 
@REM -------------------------> Date_and_Time <----------------------------- 
:Date_and_Time
@REM -------------------------> Step 1: Restart the Windows Time service
echo [1/6] Restarting Windows Time service...
sc config w32time start= auto >nul
net stop w32time >nul && net start w32time >nul || echo Failed to restart w32time
@REM -------------------------> Step 2: Configure NTP server to time.google.com
echo [2/6] Setting NTP server to time.google.com...
w32tm /config /manualpeerlist:"time.google.com" /syncfromflags:manual /reliable:YES /update >nul
@REM -------------------------> Step 3: Force time synchronization
echo [3/6] Resyncing with NTP server...
w32tm /resync || echo Warning: time sync failed.
@REM -------------------------> Step 4: Show current time sync status
echo [4/6] Querying time synchronization status...
w32tm /query /status || echo Could not query time status.
@REM -------------------------> Step 5: Set time zone to Baghdad (UTC+3)
echo [5/6] Setting timezone to Baghdad (UTC+3)...
tzutil /s "Arabic Standard Time" || echo Failed to set timezone.
@REM -------------------------> Step 6: Set system locale and date format to English (US)
echo [6/6] Setting system locale and date format to English (US)...
powershell -NoProfile -Command ^
"Set-Culture 'en-US'; ^
 Set-WinSystemLocale -SystemLocale 'en-US'; ^
 Set-WinUserLanguageList -LanguageList 'en-US' -Force; ^
 Set-ItemProperty -Path 'HKCU:\Control Panel\International' -Name 'sShortDate' -Value 'yyyy/MM/dd'; ^
 Set-ItemProperty -Path 'HKCU:\Control Panel\International' -Name 'sLongDate' -Value 'dddd, MMMM dd, yyyy'"
@REM -------------------------> Optional: Registry backup to enforce locale settings on next login
reg add "HKCU\Control Panel\International" /v LocaleName /d en-US /f >nul
reg add "HKCU\Control Panel\International" /v sShortDate /d yyyy/MM/dd /f >nul
reg add "HKCU\Control Panel\International" /v sLongDate /d "dddd, MMMM dd, yyyy" /f >nul
echo ==================================
echo All settings have been applied.
echo Please log off or restart your computer to fully apply changes.
pause
@REM ------------------------->  Delet locale  <-------------------------
:Delet_locale 
call :Delete_Local
goto Main_Menu
@REM ------------------------->  New_Setup  <-------------------------
:New_Setup 
REM -----------> Check system compatibility
ver | find "10" >nul
if %errorlevel% neq 0 (
    echo [ERROR] This script is designed for Windows 10. Exiting...
    pause
    exit /b
)
echo [INFO] System compatibility verified.
REM -----------> Disable Windows Firewall
echo [INFO] Disabling Windows Firewall...
netsh advfirewall set allprofiles state off >nul 2>&1
if %errorlevel% == 0 (
    echo [SUCCESS] Windows Firewall disabled successfully.
) else (
    echo [ERROR] Failed to disable Windows Firewall.
)
REM -----------> Stop Windows Defender
echo [INFO] Stopping Windows Defender...
net stop windefend >nul 2>&1
if %errorlevel% == 0 (
    echo [SUCCESS] Windows Defender service stopped.
) else (
    echo [ERROR] Failed to stop Windows Defender service.
)
echo [INFO] Disabling Windows Defender via registry...
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul 2>&1
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f
if %errorlevel% == 0 (
    echo [SUCCESS] Windows Defender disabled via registry.
) else (
    echo [ERROR] Failed to disable Windows Defender via registry.
)
REM -----------> Set time zone to Baghdad (UTC+3)
echo [INFO] Setting time zone to Baghdad (UTC+3)...
tzutil /s "Arabic Standard Time" >nul 2>&1
if %errorlevel% == 0 (
    echo [SUCCESS] Time zone set successfully.
) else (
    echo [ERROR] Failed to set time zone.
)
REM -----------> Set locale to en-US
echo [INFO] Setting locale to en-US...
powershell -command "Set-ItemProperty -Path 'HKCU:\Control Panel\International\' -Name 'LocaleName' -Value 'en-US'" >nul 2>&1
if %errorlevel% == 0 (
    echo [SUCCESS] Locale set to en-US.
) else (
    echo [ERROR] Failed to set locale.
)
REM -----------> Set short date format to yyyy/MM/dd
echo [INFO] Setting short date format to yyyy/MM/dd...
powershell -command "Set-ItemProperty -Path 'HKCU:\Control Panel\International\' -Name 'sShortDate' -Value 'yyyy/MM/dd'" >nul 2>&1
if %errorlevel% == 0 (
    echo [SUCCESS] Short date format set to yyyy/MM/dd.
) else (
    echo [ERROR] Failed to set short date format.
)
REM -----------> Set long date format to dddd, MMMM dd, yyyy
echo [INFO] Setting long date format to dddd, MMMM dd, yyyy...
powershell -command "Set-ItemProperty -Path 'HKCU:\Control Panel\International\' -Name 'sLongDate' -Value 'dddd, MMMM dd, yyyy'" >nul 2>&1
if %errorlevel% == 0 (
    echo [SUCCESS] Long date format set to dddd, MMMM dd, yyyy.
) else (
    echo [ERROR] Failed to set long date format.
)
REM -----------> Open Optional Features window for .NET Framework installation
echo [INFO] Opening optional features window for .NET Framework installation...
optionalfeatures
REM -----------> End of script
echo [INFO] Script execution completed.
pause
goto Main_Menu
@REM ------------------------->  Stop_windefend_and_Firewall <-------------------------
:Stop_windefend_and_Firewall 
call :stop_windefend_Firewall
goto Main_Menu

@REM -------------------------> Side_By_Side <-------------------------
:Side_By_Side
set side_By_side_Files="C:\side_By_side_Files"
if not exist %side_By_side_Files% (
    mkdir %side_By_side_Files% )
cls
echo.
echo.
echo.           
echo.
echo.                                                                                              
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                                       App Name                                     \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                 1. SPEEDOO POS                                                     /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                 2. SPEEDOO REST                                                    /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                 3. Point POS                                                       /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p App_NAME_choice="           Please choose an option : "
if "%App_NAME_choice%"=="1" (
    set "Shortcut_Part=SPEEDOO POS"
    curl -o "%side_By_side_Files%/App.config" "https://raw.githubusercontent.com/Iraqsoft95/IraqSoft/refs/heads/main/SideBySide/App.config"
    curl -o "%side_By_side_Files%/SPEEDOO_APP.exe.Config" "https://raw.githubusercontent.com/Iraqsoft95/IraqSoft/refs/heads/main/SideBySide/SPEEDOO_APP.exe.Config"
) else if "%App_NAME_choice%"=="2" (
      set "Shortcut_Part=SPEEDOO REST"
     curl -o "%side_By_side_Files%/RESTAURANT_APP.exe.Config" "https://raw.githubusercontent.com/Iraqsoft95/IraqSoft/refs/heads/main/SideBySide/RESTAURANT_APP.exe.Config"
) else if "%App_NAME_choice%"=="3" (
      set "Shortcut_Part=Point"
     curl -o "%side_By_side_Files%/POINT_OF_SALES.exe.Config" "https://raw.githubusercontent.com/Iraqsoft95/IraqSoft/refs/heads/main/SideBySide/Point_Pos/POINT_OF_SALES.exe.Config"
    curl -o "%side_By_side_Files%/App.config" "https://raw.githubusercontent.com/Iraqsoft95/IraqSoft/refs/heads/main/SideBySide/Point_Pos/App.config"
)
call :Find_App_Path
robocopy "%side_By_side_Files%" "%TargetDir%" /E /COPYALL /R:0 /W:0 /V /ZB
start "" "%TargetPath%"
pause
@REM ------------------------->  Delete_Local
call :Delete_Local
@REM ------------------------->  Delete_side_By_side_Files
@REM rmdir /s /q  %side_By_side_Files%
goto Main_Menu
@REM -------------------------> Active_Windows_Office <----------------------------- 
:Active_Windows_Office
powershell -ExecutionPolicy Bypass -NoProfile -Command "irm https://get.activated.win | iex"
goto Main_Menu
@REM -------------------------> Open_Red_Bag <----------------------------- 
:Open_Red_Bag
start "" "C:\Windows\SysWOW64\SQLServerManager11.msc"
goto Main_Menu

@REM -------------------------> Connections <----------------------------- 
:Connections
cls
echo.
echo.
echo.           
echo.
echo.                                                                                                           
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                                    Connections                                     \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                1. Show Printers IP             2. PC IP Edie                       /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                0. GO Back                      *. Exit                             /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p Connections_choice="           Please choose an option : "
if "%Connections_choice%"=="1" (
    goto Show_Printers_IP   
) else if "%Connections_choice%"=="2" (
    goto PC_IP_Edie 
) else if "%Connections_choice%"=="0" (
    goto Main_Menu
) else if "%Connections_choice%"=="*" (
 goto Exit
) else (
    echo Invalid choice! Please choose again.
    pause
    goto Connections
)
@REM -------------------------> Show_Printers_IP <-----------------------------
:Show_Printers_IP
echo Retrieving printer names and ports...
echo.
@REM ----------->  Delete the old file if it exists
if exist "%UserDesktop%\printers_ip.txt" del "%UserDesktop%\printers_ip.txt"
@REM ----------->  Use PowerShell to fetch and format printer data
powershell -Command "Get-WmiObject -Query 'SELECT Name, PortName FROM Win32_Printer' | Select-Object -Property Name, PortName | Export-Csv -Path '%UserDesktop%\printers_ip.txt' -NoTypeInformation"
@REM ----------->  Open the final file
start "" "%UserDesktop%\printers_ip.txt"
echo Done! Check printers.txt for details.
pause  
goto Main_Menu
@REM -------------------------> IP_Address_Edite  <----------------------------- 
:PC_IP_Edie 
@REM -------------------------> select Connection 
call :Conection_Type
@REM -------------------------> Main_IP_Address_Edite
:Main_PC_IP_Edie 
cls
echo.
echo.
echo.           
echo.
echo.                                                                                                                                                    
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                                    PC_IP_Edie                                      \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                1. Add IP Address               2.Delet All IP Address              /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                3. Show All IP Address                                              /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                4. GO Back                      0. Exit                             /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p IP_Edite_choice="           Please choose an option : "
if "%IP_Edite_choice%"=="1" (
    goto Add_IP_Address  
) else if "%IP_Edite_choice%"=="2" (
    goto Delet_All_IP_Address  
) else if "%IP_Edite_choice%"=="3" (
    goto Show_All_IP_Address  
) else if "%IP_Edite_choice%"=="4" (
    goto IP_Address_Edite
) else if "%IP_Edite_choice%"=="0" (
    goto Exit
) else (
    echo Invalid choice! Please choose again.
    pause
    goto Main_IP_Address_Edite
)
 

@REM -------------------------> Add_IP_Address <----------------------------- 
:Add_IP_Address
@REM ------------------------->  Turn off firewall
netsh advfirewall set allprofiles state off
net stop windefend
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f
@REM ------------------------->  Add IP address
set /p IP_Address="Enter the IP Address (last octet): 192.168."
set /p Geteway="Enter the Gateway IP (last octet): 192.168."
echo.
echo Checking if the IP 192.168.%IP_Address% is present...
ipconfig | findstr /i "192.168.%IP_Address%" > nul
if %errorlevel% equ 0 (
    echo The IP 192.168.%IP_Address% is already present on the system.
    echo Setting it as the primary IP address...
    netsh interface ipv4 set address name="%Adapter_Name%" static 192.168.%IP_Address% 255.255.255.0 192.168.%Geteway%
    if %errorlevel% equ 0 (
        echo Success: The IP 192.168.%IP_Address% has been set as the primary IP.
    ) else (
        echo Error: Failed to set the IP 192.168.%IP_Address% as the primary IP.
    )
) else (
    echo The IP 192.168.%IP_Address% is NOT present on the system.
    echo Adding it as a secondary IP address...
    netsh interface ipv4 add address "%Adapter_Name%" 192.168.%IP_Address% 255.255.255.0 192.168.%Geteway%
    if %errorlevel% equ 0 (
        echo Success: The IP 192.168.%IP_Address% has been added successfully.
    ) else (
        echo Error: Failed to add the IP 192.168.%IP_Address%
    ))
@REM ------------------------->  Add DNS
set "Primary_DNS=8.8.8.8"
set "Secondary_DNS=8.8.4.4"
@REM --------------> Check if the primary DNS server is already set
for /f "tokens=2 delims=:" %%A in ('netsh interface ipv4 show dnsservers name^="%Adapter_Name%" ^| find "%Primary_DNS%"') do (
    echo Primary DNS %Primary_DNS% is already set. Skipping setting DNS...
    pause
    goto Secondary_DNS
)
@REM --------------> If the primary DNS server is not set, set it
echo Setting primary DNS to %Primary_DNS%...
netsh interface ipv4 set dnsservers name="%Adapter_Name%" static %Primary_DNS% primary
:Secondary_DNS
@REM -------------->  Check if the secondary DNS server is already set
for /f "tokens=2 delims=:" %%A in ('netsh interface ipv4 show dnsservers name^="%Adapter_Name%" ^| find "%Secondary_DNS%"') do (
    echo Secondary DNS %Secondary_DNS% is already set. Skipping setting DNS...
    goto Main_Menu)
@REM --------------> If the secondary DNS server is not set, add it
echo Adding secondary DNS %Secondary_DNS%...
netsh interface ipv4 add dnsservers name="%Adapter_Name%" %Secondary_DNS% index=2
echo Add IP_Address 192.168.%IP_Address% Successful! 
goto Main_Menu
@REM -------------------------> Delet IP <----------------------------- 
:Delet_All_IP_Address  
netsh interface ipv4 set address name="%Adapter_Name%" source=dhcp 
goto Main_Menu
@REM -------------------------> Show_All_IP_Address   <----------------------------- 
:Show_All_IP_Address
powershell -Command "$adapter = Get-NetAdapter -Name '*%Adapter_Name%*'; $ipConfig = Get-NetIPConfiguration -InterfaceIndex $adapter.ifIndex; $dhcpStatus = (Get-NetIPInterface -InterfaceIndex $adapter.ifIndex -AddressFamily IPv4).Dhcp; [PSCustomObject]@{ InterfaceAlias = $adapter.Name; IPv4Address = ($ipConfig.IPv4Address | ForEach-Object { $_.IPAddress }) -join ', '; DefaultGateway = ($ipConfig.IPv4DefaultGateway | ForEach-Object { $_.NextHop }) -join ', '; DHCPStatus = $dhcpStatus } | Out-File '!SCRIPT_PATH!\ip_status.txt'"
start "" "%SCRIPT_PATH%\ip_status.txt"
pause 
goto Main_Menu


@REM -------------------------> Start_Download <----------------------------- 
:Start_Download
curl -L --progress-bar --retry 5 --retry-delay 10 -C - -o %output% %url%
if %errorlevel% neq 0 (
    echo Download interrupted. Retrying...
    timeout /t 10
    goto Start_Download
)
echo Download Complete. Waiting To Opening The File...
start "" %output%
pause
goto Main_Menu

@REM -------------------------> Functions <-----------------------------
:Delete_Local
@RD /S /Q "%userprofile%\AppData\Local\IRAQSOFT/"
exit /b

@REM -------------------------> stop_windefend_Firewall <-----------------------------
:stop_windefend_Firewall
REM ------------Set Firewall off
netsh advfirewall set publicprofile state off
netsh advfirewall set currentprofile state off
netsh advfirewall set domainprofile state off
netsh advfirewall set allprofiles state off
netsh advfirewall set privateprofile state off
REM ------------------stop windefend 
net stop windefend
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f
exit /b

@REM -------------------------> Copy mdf to file <-----------------------------
:Copy_mdf
net stop MSSQL$SALES_DEV
mkdir "%Befor_Format_Path%\MDF"
robocopy "C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SALES_DEV\MSSQL\DATA" "%Befor_Format_Path%\MDF" /E /COPYALL /R:0 /W:0 /V /ZB 
net start MSSQL$SALES_DEV
exit /b

@REM -------------------------> AUTH <-----------------------------

:AUTH
set config=MTk5NQ==
for /f "delims=" %%A in (
  'powershell -noprofile -command "$pass = Read-Host '       Type Password: ' -AsSecureString; $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pass); [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR).Trim()"'
) do set "user_input=%%A"

for /f "delims=" %%B in (
  'powershell -noprofile -command "[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('%config%'))"'
) do set "decoded_config=%%B"

set "user_input=!user_input: =!"
set "decoded_config=!decoded_config: =!"
exit /b

@REM <><><><><><><><><><><><><><><><><><><><>| Databases Name |<><><><><><><><><><><><><><><><><><><><>

:Databases_Name 
cls
echo.
echo.
echo.
echo.
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                                   Databases Name                                   \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\              1. SPEEDOO_DB                        2. RESTAURANT_DB                 /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\              3. Other Name                        0. GO BACK                       /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                                       *. Exit                                      /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p DB_NAME_choice=".           Choose Your Database Name: "
if "%DB_NAME_choice%"=="1" (
    set DB_NAME=SPEEDOO_DB
) else if "%DB_NAME_choice%"=="2" (
    set DB_NAME=RESTAURANT_DB 
) else if "%DB_NAME_choice%"=="3" (
    goto Other_DB_Name
) else if "%DB_NAME_choice%"=="0" (
    exit /b
) else if "%DB_NAME_choice%"=="*" (
    goto Exit
) else (
    echo Invalid choice! Please choose again.
    pause
    goto Databases_Name 
)
exit /b
:Other_DB_Name
sqlcmd !SQL_Connection!  -Q "SELECT name FROM sys.databases"
@REM sqlcmd !SQL_Connection!  -Q "SELECT name FROM sys.databases" -s "|" -W -f 65001 -o %SCRIPT_PATH%\databases_list.txt
@REM start notepad %SCRIPT_PATH%\databases_list.txt
set /p DB_NAME="Type Your Database Name: "
exit /b
@REM <><><><><><><><><><><><><><><><><><><><>| Conection Type |<><><><><><><><><><><><><><><><><><><><>
:Conection_Type
cls
echo.
echo.
echo.           
echo.
echo.                                                                                                                                                    
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo             /\/\                                                                                    /\/\
echo             \/\/                              Entrenet Conection Type                               \/\/
echo             /\/\            ------------------------------------------------------------            /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                1. Wi-Fi                           2. Ethernet                      /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\                0. GO Mine Menu                    *. Exit                          /\/\
echo             \/\/                                                                                    \/\/
echo             /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo             \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo.
set /p conecting_type_choice= ".           choose Yor Entrenet Conection : "
if "%conecting_type_choice%"=="1" (
    set Adapter_Name="Wi-Fi"
) else if "%conecting_type_choice%"=="2" (
    set Adapter_Name="Ethernet"
) else if "%conecting_type_choice%"=="0" (
    goto Main_Menu
) else if "%conecting_type_choice%"=="*" (
    goto Exit
) else (
    echo Invalid choice! Please choose again.
    pause   
    goto Conection_Type
)
exit /b

@REM -------------------------> Backup_All_Data <----------------------------- 
:Backup_All_Data
call :Check_Sql_Connection
echo Backup is start .....
sqlcmd %SQL_Connection% -Q "DECLARE @name NVARCHAR(256), @backupFile NVARCHAR(512), @sql NVARCHAR(MAX), @backupDir NVARCHAR(256); SET @backupDir = N'%BACKUP_DIR%'; DECLARE db_cursor CURSOR FOR SELECT name FROM master.dbo.sysdatabases WHERE name NOT IN ('master','model','msdb','tempdb'); OPEN db_cursor; FETCH NEXT FROM db_cursor INTO @name; WHILE @@FETCH_STATUS = 0 BEGIN SET @backupFile = @backupDir + '\' + @name + '__' + REPLACE(CONVERT(CHAR(10), GETDATE(), 120), '-', '-') + '_' + LEFT(REPLACE(CONVERT(CHAR(5), GETDATE(), 108), ':', '-'), 5) + '.bak'; SET @backupFile = REPLACE(@backupFile, ' ', '_'); SET @sql = 'BACKUP DATABASE [' + @name + '] TO DISK = ''' + @backupFile + ''' WITH NOFORMAT, NOINIT, NAME = ''' + @name + '-Full Database Backup'', SKIP, NOREWIND, NOUNLOAD, STATS = 10'; EXEC sp_executesql @sql; FETCH NEXT FROM db_cursor INTO @name; END; CLOSE db_cursor; DEALLOCATE db_cursor;"
if not exist "%BACKUP_DIR%" (
    @REM cls
    mkdir "%BACKUP_DIR%"
    echo Folder created: %BACKUP_DIR%
    goto Backup_All_Data
) 
for %%F in ("%BACKUP_DIR%\*.bak") do (
    powershell -Command "Compress-Archive -Path '%%F' -DestinationPath '%%~dpnF.zip' -Force"
    @REM del "%%F"
)
@REM cls 
echo Backup Successful in folder %BACKUP_DIR%
pause
exit /b
@REM -------------------------> Check Sql Connection <-----------------------------
:Check_Sql_Connection
@REM ------------------------->  Check if the SQL Server service is running
sc query "%SQL_SERVICE%" | find "RUNNING" >nul
if %ERRORLEVEL% NEQ 0 (
    echo SQL Server service "%SQL_SERVICE%" is not running.
    echo Attempting to start the service...
    net start "%SQL_SERVICE%" >nul 2>&1
    timeout /t 5 >nul
    sc query "%SQL_SERVICE%" | find "RUNNING" >nul
    if %ERRORLEVEL% NEQ 0 (
        echo Failed to start SQL Server service.
        pause
        exit /b
    ) else (
        echo SQL Server service started successfully.
    )
)
@REM -------------------------> Try to connect
sqlcmd !SQL_Connection! -Q "SELECT 1" >nul 2>&1

if %ERRORLEVEL% NEQ 0 (
    echo Failed to connect. Enter password of SA again.
    set /p PASS=Enter SA password: 
    set "SQL_Connection=-S %SERVER% -U %USER% -P !PASS!"
    
    sqlcmd !SQL_Connection! -Q "SELECT 1" >nul 2>&1
    if !ERRORLEVEL! NEQ 0 (
        echo Connection failed again.
    ) else (
        echo Connection successful.
    )
) else (
    echo Connection successful.
)
@REM -------------------------> Check if database exists

sqlcmd !SQL_Connection! -Q "IF EXISTS (SELECT name FROM sys.databases WHERE name = N'!DB_NAME!') SELECT 'Database exists' ELSE SELECT 'Database does not exist'" >nul 2>&1

if %ERRORLEVEL% NEQ 0 (
    echo Database does not exist.
) else (
    echo Database exists.
)
exit /b

@REM -------------------------> Find_App_Path <-----------------------------
:Find_App_Path
if "%DB_NAME_choice%" == "1"  (
    set "Shortcut_Part=SPEEDOO POS"
    set "MySettingName=MySettingSPEEDOO"
) else if "%DB_NAME_choice%" == "2" (
    set "Shortcut_Part=SPEEDOO REST"
    set "MySettingName=MySettingRESTAURANT"
) else if "%DB_NAME_choice%" == "3" (
    set "Shortcut_Part=SPEEDOO POS"
    set "MySettingName=MySettingSPEEDOO"
) 

:start_serch_Shortcut
set "TargetPath="
@REM -------------------------> check if shortcut in user desktop
for %%F in ("%UserDesktop%\!Shortcut_Part!*.lnk") do (
    for /f "delims=" %%A in ('powershell -command "(New-Object -ComObject WScript.Shell).CreateShortcut('%%F').TargetPath"') do (
        set "TargetPath=%%A"
        goto found_shortcut
    )
)

@REM -------------------------> Search on Public Desktop if not found on the User's Desktop
if not defined TargetPath (
    for %%F in ("%PublicDesktop%\!Shortcut_Part!*.lnk") do (
        for /f "delims=" %%A in ('powershell -command "(New-Object -ComObject WScript.Shell).CreateShortcut('%%F').TargetPath"') do (
            set "TargetPath=%%A"
            goto found_shortcut
        )
    )
)
@REM -------------------------> Prompt for path if shortcut is not found
if not defined TargetPath (
    if "%DB_NAME_choice%"=="1"  (
        set "Shortcut_Part=SPEEDOO_APP"
        goto start_serch_Shortcut
    
    ) else if "%DB_NAME_choice%" == "2" (
        set "Shortcut_Part=RESTAURANT_APP"
        goto start_serch_Shortcut
    ) else if  "%DB_NAME_choice%"=="3" (
        set "Shortcut_Part=SPEEDOO_APP"
     goto start_serch_Shortcut
    ) 
)
@REM -------------------------> check if not defined
if not defined TargetPath (
    cls
    echo Could not find the shortcut for !Shortcut_File! on either User or Public Desktop.
    set /p TargetPath="Please type the path of Speedoo file location: "
)
:found_shortcut
set "TargetDir=%TargetPath%\.."
exit /b
:Exit
echo Exiting the program...
pause
exit
