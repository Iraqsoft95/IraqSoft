@ECHO OFF 
title IRAQSOFT SUPPORT TOOLS V 1.5
chcp 65001 >nul 2>&1
setlocal
@REM -------------------------> Run Bat Us Admin <-----------------------------
@REM ----------->check if file Run Us Admin
set "isAdmin=false"
REG QUERY "HKU\S-1-5-19" >nul 2>&1
if %errorlevel% == 0 set "isAdmin=true"
@REM -----------> if file Not Run Us Admin 
if "%isAdmin%" == "false" (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
@REM -------------------------> Varibles <-----------------------------
set "UserDesktop=%USERPROFILE%\Desktop"
set "PublicDesktop=C:\Users\Public\Desktop"
set "PublicDocuments=C:\Users\Public\Documents"
set "SCRIPT_PATH=%PublicDocuments%\IRAQSOFT_TOOL"
set "SCRIPT_NAME=%~nx0"
set SCRIPT_Loc="%SCRIPT_PATH%%SCRIPT_NAME%"
if not exist "%SCRIPT_PATH%" (
    mkdir %SCRIPT_PATH%)
set PC_Name=%COMPUTERNAME%
set Server_Name= .\SALES_DEV
set SQL_Connecction= -S .\SALES_DEV  -U sa -P 12345
set SQLCMD="C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\sqlcmd.exe"
set "Download_Path=%USERPROFILE%\Downloads"
set BACKUP_DIR=C:\MyBackup
set Befor_Format_Path=C:\Befor_Format
@REM -------------------------> Downloads Info
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
set SPEEDOO_REST_CLINT_UR= "https://www.dropbox.com/scl/fi/i1pia1g8bdvic74een1ep/Speedoo-REST-3.0.6.2-CLIENTS.exe?rlkey=j1lmoyp9cks7xnrbk6y6x7ym8&e=1&st=swtnyi22&dl=0"
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
set dControl_URL="https://www.dropbox.com/scl/fi/l8k0rv7d5jpbdlysclcro/Wub_v1.8.zip?rlkey=ziwdtkm5kplk6v9y86ln31eb8&st=3wzbo24k&dl=0"
set dControl_FILE="%Download_Path%\dControl.zip"
set WUB_URL="https://www.dropbox.com/scl/fi/l8k0rv7d5jpbdlysclcro/Wub_v1.8.zip?rlkey=ziwdtkm5kplk6v9y86ln31eb8&st=3wzbo24k&dl=0"
set WUB_FILE="%Download_Path%\Wub_v1.8.zip"
set Windows_Activity_URL="https://edef12.pcloud.com/cfZE5eKE9ZyA5gkcZya0SZZVedgkkZ2ZZRkHZZe7eQZj0ZTXZmHZ1HZLpZnkZRHZ10ZQpZLHZjXZEVZiFZF5Z6On8aupWMkuoN0inS6PNvf4aEhRy/KMSAuto%20Net.rar"
set Windows_Activity_FILE= "%Download_Path%\KMSAutoNet.rar"
set Winrar_URL="https://www.rarlab.com/rar/winrar-x64-701ar.exe"
set Winrar_FILE="%Download_Path%\winrar-x64-701ar.exe"
set VPN_URL="https://fl-downloads.digitaltrends.com/f2c/449/30f067664fbd1f502e967afe7c7f8d66b7/1111_w_WARP_V2024.2.187.0.msi?Expires=1729621442&Signature=bfc5eee981814da97b5cfc7641a6e589139d05bc&url=https://downloads.digitaltrends.com/1111-w-warp/windows&Filename=1111_w_WARP_V2024.2.187.0.msi"
set VPN_FILE="%Download_Path%\WARP_1.1.1_VPN.msi"
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
@REM -------------------------> Batch Config <-----------------------------
:Start_Code
set config=22
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                 Welcom To IRAQSOFT SUPPORT TOOLE
echo                  -------------------------------------------------------------
echo.
set  /p  Type_config=".       Type The Password To Enter to The Tool : " 
echo.                                          
if /I "%Type_config%"=="%config%" goto Main_Menu
echo Invalid covfig! Please try again.
pause
goto Start_Code
@REM -------------------------> Main_Menu <----------------------------- 
:Main_Menu
cls
echo.
echo.
echo                               WLECOME TO IRAQ SOFT SUPPORT TOOLS
echo                  -------------------------------------------------------------
echo.                                       Main Tools List 
echo                  -------------------------------------------------------------
echo.
echo                     1. Downloads          2. Printers          3. SQL Server            
echo.
echo                     4. Solutions          5. Connections       0.Exit 
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
@REM -------------------------> Downloads <----------------------------- 
:Downloads
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                          Downloads LIST 
echo                  -------------------------------------------------------------
echo.
echo                     1. SPEEDOO POS          2. SPEEDOO REST          3. POINT Pos           
echo.
echo                     4. Point Super          5. Shipping Plus         6. Sql 
echo.
echo                     7. Aman                 8.Service programs       9. Go Back
echo.
echo                                             0.Exit
echo.
echo                  -------------------------------------------------------------
echo.
set /p Download_choice="Please choose an option : "
if "%Download_choice%"=="1"  goto SPEEDOO_POS_Download
if "%Download_choice%"=="2"  goto SPEEDOO_REST_Download
if "%Download_choice%"=="3" goto Point_Pos_Download
if "%Download_choice%"=="4" goto Point_Super_Download
if "%Download_choice%"=="5" goto Shipping_Plus_Download
if "%Download_choice%"=="6" goto SQL_Download
if "%Download_choice%"=="7" goto Aman_Download
if "%Download_choice%"=="8" goto Service_Programs_Download
if "%Download_choice%"=="9" goto Main_Menu
if "%Download_choice%"=="0" goto Exit
echo Invalid choice! Please choose again.
pause
goto Downloads
@REM -------------------------> SPEEDOO_POS <----------------------------- 
:SPEEDOO_POS_Download
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                         SPEEDOO POS
echo                  -------------------------------------------------------------
echo.
echo                     1. 1.3.8.4 FULL                     2. 1.3.8.4 UPDATE 
echo.
echo                     3. 1.3.8.4 CLIENTS                  4. GO BACK  
echo.
echo                     0. Exit 
echo.
echo                  -------------------------------------------------------------
echo.
set /p SPEEDOO_POS_choice="Please choose an option : "
if "%SPEEDOO_POS_choice%"=="1" set url= %SPEEDOO_POS_FULL_URL%& set output=%SPEEDOO_POS_FULL_FILE%& goto Start_Download
if "%SPEEDOO_POS_choice%"=="2" set url= %SPEEDOO_POS_UPDATE_URL%& set output=%SPEEDOO_POS_UPDATE_FILE%& goto Start_Download
if "%SPEEDOO_POS_choice%"=="3" set url= %SPEEDOO_POS_CLINT_URL%& set output=%SPEEDOO_POS_CLINT_FILE%& goto Start_Download
if "%SPEEDOO_POS_choice%"=="4" goto Downloads
if "%SPEEDOO_POS_choice%"=="0" goto Exit
echo Invalid choice! Please choose again.
pause
goto SPEEDOO_POS_Download
@REM -------------------------> SPEEDOO_REST <----------------------------- 
:SPEEDOO_REST_Download
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                         SPEEDOO REST
echo                  -------------------------------------------------------------
echo.
echo                     1. 3.0.6.2 FULL               2. 3.0.6.2 UPDATE
echo.
echo                     3. 3.0.6.2 CLIENTS            4. GO BACK  
echo. 
echo                     0. Exit              
echo.
echo                  -------------------------------------------------------------
echo.
set /p SPEEDOO_POS_choice="Please choose an option : "
if "%SPEEDOO_POS_choice%"=="1" set url= %SPEEDOO_REST_FULL_URL%& set output=%SPEEDOO_REST_FULL_FILE%& goto Start_Download
if "%SPEEDOO_POS_choice%"=="2" set url= %SPEEDOO_REST_UPDATE_URL%& set output=%SPEEDOO_REST_UPDATE_FILE%& goto Start_Download
if "%SPEEDOO_POS_choice%"=="3" set url= %SPEEDOO_REST_CLINT_URL%& set output=%SPEEDOO_REST_CLINT_FILE%& goto Start_Download
if "%SPEEDOO_POS_choice%"=="4" goto Downloads
if "%SPEEDOO_POS_choice%"=="0" goto Exit
echo Invalid choice! Please choose again.
pause
goto SPEEDOO_REST_Download
@REM -------------------------> Point <----------------------------- 
:Point_Pos_Download
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                         Point Pos
echo                  -------------------------------------------------------------
echo.
echo                     1. 3.9.2 FULL                      2. 3.9.2 UPDATE      
echo.
echo                     3. GO BACK                         0. Exit                    
echo.
echo                  -------------------------------------------------------------
echo.
set /p Point_Pos_choice="Please choose an option : "
if "%Point_POS_choice%"=="1" set url= %Point_Pos_FULL_URL%& set output=%Point_Pos_FULL_FILE%& goto Start_Download
if "%Point_POS_choice%"=="2" set url= %Point_Pos_UPDATE_URL%& set output=%Point_Pos_UPDATE_FILE%& goto Start_Download
if "%Point_POS_choice%"=="3" goto Downloads
if "%Point_POS_choice%"=="0" goto Exit
echo Invalid choice! Please choose again.
pause
goto Point_Pos_Download
@REM -------------------------> Point_Super <----------------------------- 
:Point_Super_Download
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                          Point Super
echo                  -------------------------------------------------------------
echo.
echo                     1. 3.0.0.2 FULL                       2. 3.0.0.2 UPDATE 
echo.
echo                     3. 3.0.0.2 CLIENTS                    4. GO BACK 
echo.
echo                     0. Exit  
echo.                          
echo                  -------------------------------------------------------------
echo.
set /p SPEEDOO_POS_choice="Please choose an option : "
if "%SPEEDOO_POS_choice%"=="1" set url= %Point_Super_FULL_URL%& set output=%Point_Super_FULL_FILE%& goto Start_Download
if "%SPEEDOO_POS_choice%"=="2" set url= %Point_Super_UPDATE_URL%& set output=%Point_Super_UPDATE_FILE%& goto Start_Download
if "%SPEEDOO_POS_choice%"=="3" set url= %Point_Super_CLINT_URL%& set output=%Point_Super_CLINT_FILE%& goto Start_Download
if "%SPEEDOO_POS_choice%"=="4" goto Downloads
if "%SPEEDOO_POS_choice%"=="0" goto Exit
echo Invalid choice! Please choose again.
pause
goto Point_Super_Download
@REM ------------------------->Shipping Plus  <----------------------------- 
:Shipping_Plus_Download
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                          Shipping Plus 
echo                  -------------------------------------------------------------
echo.
echo                     1. 2.2.0.0 FULL                      4. 2.2.2.2 FULL 
echo.
echo                     2. 2.2.0.0 UPDATE                    5. 2.2.2.2 UPDATE
echo.
echo                     3. 2.2.0.0 CLIENTS                   6. GO BACK
echo.              
echo                     0. Exit  
echo.               
echo.
echo                  -------------------------------------------------------------
echo.
set /p Shipping Plus_choice="Please choose an option : "
if "%Shipping Plus_choice%"=="1" set url= %Shipping_Plus_2.2.0.0_FULL_URL%& set output=%Shipping_Plus_2.2.0.0_FULL_FILE%& goto Start_Download
if "%Shipping Plus_choice%"=="2" set url= %Shipping_Plus_2.2.0.0_UPDATE_URL%& set output=%Shipping_Plus_2.2.0.0_UPDATE_FILE%& goto Start_Download
if "%Shipping Plus_choice%"=="3" set url= %Shipping_Plus_2.2.0.0_CLINT_URL%& set output=%Shipping_Plus_2.2.0.0_CLINT_FILE%& goto Start_Download
if "%Shipping Plus_choice%"=="4" set url= %Shipping_Plus_2.2.2.2_FULL_URL%& set output=%Shipping_Plus_2.2.2.2_FULL_FILE%& goto Start_Download
if "%Shipping Plus_choice%"=="5" set url= %Shipping_Plus_2.2.2.2_UPDATE_URL%& set output=%Shipping_Plus_2.2.2.2_UPDATE_FILE%& goto Start_Download
if "%Shipping Plus_choice%"=="6" goto Downloads
if "%Shipping Plus_choice%"=="0" goto Exit
echo Invalid choice! Please choose again.
pause
goto Shipping_Plus_Download
@REM ------------------------->  SQL Server  <----------------------------- 
:SQL_Download
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                         SQL Server      
echo                  -------------------------------------------------------------
echo.
echo                     1. SQL 2008                      4. SQL 2019 
echo.
echo                     2. SQL 2012                      5. GO BACK                 
echo.
echo                     3. SQL 2014                      0. Exit        
echo.                     
echo.
echo                  -------------------------------------------------------------
echo.
set /p SQL_choice="Please choose an option : "
if "%SQL_choice%"=="1" set url= %Sql_2008_URL%& set output=%Sql_2008_FILE%& goto Start_Download
if "%SQL_choice%"=="2" set url= %Sql_2012_URL%& set output=%Sql_2012_FILE%& goto Start_Download
if "%SQL_choice%"=="3" set url= %Sql_2014_URL%& set output=%Sql_2014_FILE%& goto Start_Download
if "%SQL_choice%"=="4" set url= %Sql_2019_URL%& set output=%Sql_2019_FILE%& goto Start_Download
if "%SQL_choice%"=="5" goto Downloads
if "%SQL_choice%"=="0" goto Exit
echo Invalid choice! Please choose again.
pause
goto SQL_Download
@REM -------------------------> Aman  <----------------------------- 
:Aman_Download
set url= %Aman_URL%& set output=%Aman_FILE%& goto Start_Download
goto SQL_Download
@REM ------------------------->  Service_Programs  <----------------------------- 
:Service_Programs_Download
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                         Service Programs   
echo                  -------------------------------------------------------------
echo.
echo                     1. dControl                      2. Windows Ubdate Control 
echo.
echo                     3. Windows Activity              4. Winrar                
echo.
echo                     5. 1.1.1.1 VPN                   6. GO Back     
echo.
echo                     0. Exit             
echo.
echo                  -------------------------------------------------------------
echo.
set /p SQL_choice="Please choose an option : "
if "%SQL_choice%"=="1" set url= %dControl_URL%& set output=%dControl_FILE%& goto Start_Download
if "%SQL_choice%"=="2" set url= %WUB_URL%& set output=%WUB_FILE%& goto Start_Download
if "%SQL_choice%"=="3" set url= %Windows_Activity_URL%& set output=%Windows_Activity_FILE%& goto Start_Download
if "%SQL_choice%"=="4" set url=%Winrar_URL%& set output= %Winrar_FILE%& goto Start_Download
if "%SQL_choice%"=="5" set url=%VPN_URL%& set output= %VPN_FILE%& goto Start_Download
if "%SQL_choice%"=="6" goto Downloads
if "%SQL_choice%"=="0" goto Exit
echo Invalid choice! Please choose again.
pause
goto Service_Programs_Download
@REM -------------------------> Printers <----------------------------- 
:Printers
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                         Printers 
echo                  -------------------------------------------------------------
echo.
echo                     1. Download Printer                   2. Show Printers IP
echo.
echo                     3. GO Back                            0. Exit
echo.
echo                  -------------------------------------------------------------
echo.
set /p SQL_choice="Please choose an option : "
if "%SQL_choice%"=="1" goto Download_Printer
if "%SQL_choice%"=="2" goto Show_Printers_IP
if "%SQL_choice%"=="6" goto Main_Menu
if "%SQL_choice%"=="0" goto Exit
echo Invalid choice! Please choose again.
pause
goto Printers
@REM -------------------------> Download_Printer <----------------------------- 
:Download_Printer
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                            Printers   
echo                  -------------------------------------------------------------
echo.
echo                     1. Canon 6030                      2. Thermal printer 
echo.
echo                     3. BARCODE printer                 4. IPOS JJ printer
echo.
echo                     5. POS 80 Series                   6. AG POS Printer
echo. 
echo                     7.  ZJ Printer                     8. XPrinter
echo.
echo                     9.  HPRT Printer                   10. Printer Tool           
echo.
echo                     11. GO Back                         0. Exit                
echo.
echo                  -------------------------------------------------------------
echo.
set /p choice="Please choose an option : "
if "%choice%"=="1" set url=%Canon_6030_Url%& set output=%Canon_6030_File%& goto Start_Download
if "%choice%"=="2" set url=%pos_Url%& set output=%pos_File%& goto Start_Download
if "%choice%"=="3" set url=%BARCODE_Url%& set output=%BARCODE_File%& goto Start_Download
if "%choice%"=="4" set url=%IPOS_JJ_Url%& set output=%IPOS_JJ_File%& goto Start_Download
if "%choice%"=="5" set url=%POS_80_Series_Url%& set output=%POS_80_Series_File%& goto Start_Download
if "%choice%"=="6" set url=%AG_POS_Url%& set output=%AG_POS_File%& goto Start_Download
if "%choice%"=="7" set url=%ZJ_Url%& set output=%ZJ_File%& goto Start_Download
if "%choice%"=="8" set url=%xpriner_Url%& set output=%xpriner_File%& goto Start_Download
if "%choice%"=="9" set url=%HPRT_Url%& set output=%HPRT_File%& goto Start_Download
if "%choice%"=="10" set url=%Printer_Tool_Url%& set output=%Printer_Tool_File%& goto Start_Download
if "%choice%"=="11" goto Printers
if "%choice%"=="0" goto Exit
echo Invalid choice! Please choose again.
pause
goto Download_Printer
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

@REM -------------------------> SQL_Server <-----------------------------
@REM ----------->  Databases Name
:SQL_Server
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                       Databases Name
echo                  -------------------------------------------------------------
echo.
echo                     1. SPEEDOO_DB                  2. RESTAURANT_DB
echo.
echo                     3. Other Name                  4. GO BACK
echo.                     
echo                      0. Exit                  
echo.
echo                  -------------------------------------------------------------
echo.
set /p DB_NAME_choice="choose Yor Databases Name: "
if "%DB_NAME_choice%"=="1"   set DB_NAME=SPEEDOO_DB & goto SQL_Server_List
if "%DB_NAME_choice%"=="2"   set DB_NAME=RESTAURANT_DB & goto SQL_Server_List
if "%DB_NAME_choice%"=="3"  goto Other_DB_Name
if "%DB_NAME_choice%"=="4" goto Main_Menu
if "%DB_NAME_choice%"=="0" goto Exit
echo Invalid choice! Please choose again.
pause
goto SQL_Server 
:Other_DB_Name
sqlcmd -S .\SALES_DEV  -U sa -P 12345  -Q "SELECT name FROM sys.databases" -s "|" -W -f 65001 -o %SCRIPT_PATH%\databases_list.txt
start notepad %SCRIPT_PATH%\databases_list.txt
set /p DB_NAME="Type Yor Databases Name: "
goto SQL_Server_List
:SQL_Server_List
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                           SQL Server   
echo                  -------------------------------------------------------------
echo.
echo                     1. Telegram                           2. Users Edite               
echo.
echo                     3. Backup                             4. GO Back               
echo.                 
echo                                           0. Exit              
echo. 
echo                  -------------------------------------------------------------
echo.
set /p choice="Please choose an option : "
if "%choice%"=="1"  goto Telgram 
if "%choice%"=="2"  goto Users_Edite 
if "%choice%"=="3"  goto Backup
if "%choice%"=="4" goto Main_Menu
if "%choice%"=="0" goto Exit
echo Invalid choice! Please choose again.
pause
goto SQL_Server_List
@REM -------------------------> Telgram  <----------------------------- 
:Telgram 
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                         Telegram
echo                  -------------------------------------------------------------
echo.
echo                     1. Add Chat id          2. Telegram Disable in setting
echo.
echo                     3. GO BACK              0. Exit 
echo.                     
echo                  -------------------------------------------------------------
echo.
set /p SPEEDOO_POS_choice="Please choose an option : "
if "%SPEEDOO_POS_choice%"=="1"  goto Add_Chat_Id
if "%SPEEDOO_POS_choice%"=="2"  goto Telegram_Disable
if "%SPEEDOO_POS_choice%"=="3" goto SQL_Server
if "%SPEEDOO_POS_choice%"=="0" goto Exit
echo Invalid choice! Please choose again.
pause
goto Telegram
@REM -------------------------> Add Chat Id  <----------------------------- 
:Add_Chat_Id
cls
@REM -----------> Set Chat ID
:chat_id
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                             Chat ID
echo                  -------------------------------------------------------------
echo.
 Set /P "chat_id=.     Enter Chat ID: "
Echo:-------------
    goto Add_Chat_Id_To_SQL
@REM -----------> Add_Chat_Id_To_SQL
:Add_Chat_Id_To_SQL
sqlcmd -S .\SALES_DEV  -U sa -P 12345 -d %DB_NAME% -Q "UPDATE T_CONFIGRATION  SET TL_ID = '%chat_id%' , TELEGRAM ='True;True;True;True;True;True;True;False;True;True;True;True;True;True;True;True;'"
pause
goto Main_Menu

@REM -------------------------> Telegram_Disable <----------------------------- 
:Telegram_Disable
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                        TelegramDisable
echo                  -------------------------------------------------------------
echo.
echo                          1. Wi-Fi                             2. Ethernet                  
echo.                     
echo                          3. GO BACK                           0. Exit
echo.
echo                  -------------------------------------------------------------
echo.
set /p Telegram_Disable_choice="choose Yor Entrenet Conection : "
if "%Telegram_Disable_choice%"=="1"   set dnsservers="Wi-Fi"& goto Start_Telegram_Disable
if "%Telegram_Disable_choice%"=="2"   set dnsservers="Ethernet"& goto Start_Telegram_Disable
if "%Telegram_Disable_choice%"=="3" goto SQL_Server_List
if "%Telegram_Disable_choice%"=="0" goto Exit
echo Invalid choice! Please choose again.
pause
goto Telegram_Disable
:Start_Telegram_Disable
@REM Delete Local
@RD /S /Q "%userprofile%\AppData\Local\IRAQSOFT/"
@REM set Telegram true
sqlcmd -S .\SALES_DEV  -U sa -P 12345 -d %DB_NAME% -Q "UPDATE T_CONFIGRATION  SET TELEGRAM ='True;True;True;True;True;True;True;False;True;True;True;True;True;True;True;True;'"
@REM Add DNS
netsh interface ipv4 set dnsservers %dnsservers% static 8.8.8.8 primary
netsh interface ipv4 add dnsservers %dnsservers% 8.8.4.4 index=2
pause
goto Main_Menu
:Users_Edite 
@REM -------------------------> Users_Edite  <-----------------------------
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                       Users Edite 
echo                  -------------------------------------------------------------
echo.
echo                     1. Add User                     2. Change Pass To Defulte         
echo.
echo                     3. Delet User                   4. Delet All
echo.
echo                     5. GO Back                      0. Exit
echo.
echo                  -------------------------------------------------------------
echo.
set /p choice="choose From List: "
if "%choice%"=="1"  goto Add_User 
if "%choice%"=="2"  goto Change_Pass_To_Defulte
if "%choice%"=="3"  goto Delet_User
if "%choice%"=="4"  goto Delet_All_User
if "%choice%"=="5" goto Main_Menu
if "%choice%"=="0" goto Exit
echo Invalid choice! Please choose again.
pause
goto Users_Edite 
@REM -------------------------> Add User  <-----------------------------
:Add_User 
set /p answer="Enter the password to continue : "
if /i "%answer%"=="%config%" (
    if "%DB_NAME_choice%"=="2" (
        sqlcmd %SQL_Connecction% -d %DB_NAME%  -Q "INSERT INTO T_USERS (  USER_CODE, USER_NAME, USER_PWD, LEVEL_CODE, ACTIVE, LOG_IN, IS_ENC, APP_PWD) VALUES ('0','IraqSoft','foiUfmc49d0iGecozsVrBA==','1','True','False','True','');"
        echo Your Password: IraqSoft
        pause
        goto Main_Menu
    ) else (
        sqlcmd %SQL_Connecction% -d %DB_NAME%  -Q "INSERT INTO T_USERS ( USER_CODE, USER_NAME, USER_PWD, LEVEL_CODE, ACTIVE, LOG_IN, BOX_CODE, IS_ENC, SECURETY_CODE, APP_PWD, TYPE_PRICE_CODE, STORE_CODE, MANDOOB_CODE, LEVEL_APP, DRIVER_CODE, TYPE_CH_OFFER) VALUES ('0','IraqSoft','foiUfmc49d0iGecozsVrBA==','1','True','False','5000','True','3','-10','-10','-10','','1','0','');"
        echo Your Password: IraqSoft
        pause
        goto Main_Menu
    ) 
    )
    echo Invalid config! Please try again.
    pause
    goto Add_User
@REM -------------------------> Change_Pass_To_Defulte <-----------------------------
:Change_Pass_To_Defulte
set /p answer="Enter the password to continue : "
if /i "%answer%"=="%config%" (
sqlcmd %SQL_Connecction% -d %DB_NAME%  -Q "UPDATE T_USERS  SET USER_PWD = 'fpd2Te7d3NwzGck5qAgK8g==' WHERE  USER_CODE = '1';"
echo Your Password : 22 
pause
goto Main_Menu
) else (
    goto Change_Pass_To_Defulte
)


@REM -------------------------> Delet_User <-----------------------------
:Delet_User
sqlcmd %SQL_Connecction% -d %DB_NAME%  -Q "SELECT USER_CODE as ID, USER_NAME as Name, CASE WHEN IS_ENC = 1 THEN 'True' ELSE 'False' END as Enc  FROM T_USERS" -s "|" -W    -f 65001 -o %SCRIPT_PATH%\Users.txt 
start notepad %SCRIPT_PATH%\Users.txt
set /p USER_CODE="Tye the User code to delete: "
set /p answer="Enter the password to continue : "
if /i "%answer%"=="%config%" (
sqlcmd %SQL_Connecction% -d %DB_NAME%  -Q "DELETE FROM T_USERS WHERE USER_CODE=%USER_CODE%"
pause
goto Main_Menu
) else (
    goto Delet_User
)

@REM -------------------------> Delet_All_User <-----------------------------
:Delet_All_User
set /p answer="Enter the password to continue : "
if /i "%answer%"=="%config%" (
    if "%DB_NAME_choice%"=="2" (
        sqlcmd %SQL_Connecction% -d %DB_NAME%  -Q "Delete from T_USERS;INSERT INTO T_USERS (  USER_CODE, USER_NAME, USER_PWD, LEVEL_CODE, ACTIVE, LOG_IN, IS_ENC, APP_PWD) VALUES ('1','ADMIN','fpd2Te7d3NwzGck5qAgK8g==','1','True','False','True','');"
        echo Your Password: IraqSoft
        pause
        goto Main_Menu
    ) else (
       sqlcmd %SQL_Connecction% -d %DB_NAME%  -Q "Delete from T_USERS; INSERT into T_USERS ( USER_CODE, USER_NAME, USER_PWD, LEVEL_CODE, ACTIVE, LOG_IN, BOX_CODE, IS_ENC, SECURETY_CODE, APP_PWD, TYPE_PRICE_CODE, STORE_CODE, MANDOOB_CODE, LEVEL_APP, DRIVER_CODE, TYPE_CH_OFFER) VALUES ('1','ADMIN','fpd2Te7d3NwzGck5qAgK8g==','1','True','False','5000','True','3','-10','-10','-10','','1','0','');"
        pause
    goto Main_Menu
    ) 
    )
    echo Invalid config! Please try again.
    pause
    goto Delet_All_User
@REM ------------------------->  Backup <----------------------------- 
:Backup 
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                            Backup   
echo                  -------------------------------------------------------------
echo.
echo                     1. Backup Selected Data         2. Backup All Data
echo.
echo                     3. Befor Format                 4. Befor Ubdate                  
echo.  
echo                     5. GO BACK                      0. Exit 
echo.                     
echo                  -------------------------------------------------------------
echo.
set /p SPEEDOO_POS_choice="Please choose an option : "
if "%SPEEDOO_POS_choice%"=="1"  goto Backup_Selected_Data
if "%SPEEDOO_POS_choice%"=="2"  goto Backup_All_Data
if "%SPEEDOO_POS_choice%"=="3"  goto Befor_Format
if "%SPEEDOO_POS_choice%"=="4"  goto Befor_Update
if "%SPEEDOO_POS_choice%"=="5" goto SQL_Server
if "%SPEEDOO_POS_choice%"=="0" goto Exit
echo Invalid choice! Please choose again.
pause
goto Backup 

@REM -------------------------> Backup_Selected_Data <----------------------------- 
:Backup_Selected_Data
rem Get current date and time
for /f "tokens=1-3 delims=/ " %%a in ('date /t') do (set mydate=%%a-%%b-%%c)
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (set mytime=%%a-%%b)

rem Format the date and time
set TIMESTAMP=%mydate%_%mytime%

rem Construct the backup file name
set BACKUP_FILE=%BACKUP_DIR%\%DB_NAME%_%TIMESTAMP%.bak

rem Perform the backup using sqlcmd
echo Backup is start .....
sqlcmd %SQL_Connecction% -Q "BACKUP DATABASE [%DB_NAME%] TO DISK='%BACKUP_FILE%' WITH NOFORMAT, NOINIT, NAME='%DB_NAME%-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS=10"

if not exist "%BACKUP_DIR%" (
    cls
    mkdir "%BACKUP_DIR%"
    echo Folder created: %BACKUP_DIR%
    goto Backup_Selected_Data
) 
cls
rem Check if the backup was successful
if errorlevel 1 (
    echo Backup failed!
) else (
    echo Backup successful: %BACKUP_FILE%
    echo in folder %BACKUP_DIR%
)
pause
goto Main_Menu

@REM -------------------------> Backup_All_Data <----------------------------- 
:Backup_All_Data
echo Backup is start .....
 sqlcmd %SQL_Connecction% -Q "DECLARE @name NVARCHAR(256); DECLARE @backupFile NVARCHAR(256); DECLARE @sql NVARCHAR(MAX); DECLARE @backupDir NVARCHAR(256); SET @backupDir = '%BACKUP_DIR%'; DECLARE db_cursor CURSOR FOR SELECT name FROM master.dbo.sysdatabases WHERE name NOT IN ('master', 'model', 'msdb', 'tempdb'); OPEN db_cursor; FETCH NEXT FROM db_cursor INTO @name; WHILE @@FETCH_STATUS = 0 BEGIN; SET @backupFile = @backupDir + '\' + @name + CONVERT(VARCHAR, GETDATE(), 112) + '_' + REPLACE(CONVERT(VARCHAR, GETDATE(), 108), ':', '-') + '.bak'; SET @sql = 'BACKUP DATABASE [' + @name + '] TO DISK = ''' + @backupFile + ''' WITH NOFORMAT, NOINIT, NAME = ''' + @name + '-Full Database Backup'', SKIP, NOREWIND, NOUNLOAD, STATS = 10'; EXEC sp_executesql @sql; FETCH NEXT FROM db_cursor INTO @name; END; CLOSE db_cursor; DEALLOCATE db_cursor;"
if not exist "%BACKUP_DIR%" (
    cls
    mkdir "%BACKUP_DIR%"
    echo Folder created: %BACKUP_DIR%
    goto Backup_All_Data
) 
cls 
echo Backup Successful in folder %BACKUP_DIR%

pause
goto Main_Menu

@REM -------------------------> Befor_Format <----------------------------- 
:Befor_Format
set Befor_Format_Path=%BACKUP_DIR%/Befor_Format
@REM -------------------------> Backup Data
:Befor_Format_Backup
set Befor_Format_Backup_Path=%BACKUP_DIR%/Befor_Format/Backup
echo Backup is start .....
 sqlcmd %SQL_Connecction% -Q "DECLARE @name NVARCHAR(256); DECLARE @backupFile NVARCHAR(256); DECLARE @sql NVARCHAR(MAX); DECLARE @backupDir NVARCHAR(256); SET @backupDir = '%Befor_Format_Backup_Path%'; DECLARE db_cursor CURSOR FOR SELECT name FROM master.dbo.sysdatabases WHERE name NOT IN ('master', 'model', 'msdb', 'tempdb'); OPEN db_cursor; FETCH NEXT FROM db_cursor INTO @name; WHILE @@FETCH_STATUS = 0 BEGIN; SET @backupFile = @backupDir + '\' + @name + CONVERT(VARCHAR, GETDATE(), 112) + '_' + REPLACE(CONVERT(VARCHAR, GETDATE(), 108), ':', '-') + '.bak'; SET @sql = 'BACKUP DATABASE [' + @name + '] TO DISK = ''' + @backupFile + ''' WITH NOFORMAT, NOINIT, NAME = ''' + @name + '-Full Database Backup'', SKIP, NOREWIND, NOUNLOAD, STATS = 10'; EXEC sp_executesql @sql; FETCH NEXT FROM db_cursor INTO @name; END; CLOSE db_cursor; DEALLOCATE db_cursor;"
if not exist "%Befor_Format_Backup_Path%" (
    cls
    mkdir "%Befor_Format_Backup_Path%"
    echo Folder created: %Befor_Format_Backup_Path%
    goto Befor_Format_Backup
) 
@REM -------------------------> Copy Mysetting Speedoo to file 
if "%DB_NAME_choice%" == "2" (
    set "Shortcut_Part=SPEEDOO REST"
    set "MySettingName=MySettingRESTAURANT"
) else (
    set "Shortcut_Part=SPEEDOO POS"
    set "MySettingName=MySettingSPEEDOO"
)
:start_serch_Shortcut_Format
set "UserDesktop=%USERPROFILE%\Desktop"
set "PublicDesktop=C:\Users\Public\Desktop"
set "TargetPath="
@REM -------------------------> check if shortcut in user desktop
for %%F in ("%UserDesktop%\%Shortcut_Part%*.lnk") do (
    for /f "delims=" %%A in ('powershell -command "(New-Object -ComObject WScript.Shell).CreateShortcut('%%F').TargetPath"') do (
        set "TargetPath=%%A"
        goto found_shortcut_Format
    )
)

@REM -------------------------> Search on Public Desktop if not found on the User's Desktop
if not defined TargetPath (
    for %%F in ("%PublicDesktop%\%Shortcut_Part%*.lnk") do (
        for /f "delims=" %%A in ('powershell -command "(New-Object -ComObject WScript.Shell).CreateShortcut('%%F').TargetPath"') do (
            set "TargetPath=%%A"
            goto found_shortcut_Format
        )
    )
)
@REM -------------------------> Prompt for path if shortcut is not found
if not defined TargetPath (
    if  "%DB_NAME_choice%" == "2" (
    set "Shortcut_Part=RESTAURANT_APP"
    goto start_serch_Shortcut
    ) else (
        set "Shortcut_Part=SPEEDOO_APP"
    goto start_serch_Shortcut_Format
    )
    )
@REM -------------------------> check if not defined
if not defined TargetPath (
    cls
    echo Could not find the shortcut for %Shortcut_File% on either User or Public Desktop.
    set /p TargetPath="Please type the path of Speedoo file location: "
)
:found_shortcut_Format
set "TargetDir=%TargetPath%\.."
mkdir "%Befor_Format_Path%\%MySettingName%"
robocopy "%TargetDir%\%MySettingName%" "%Befor_Format_Path%\%MySettingName%" /E /COPYALL /R:0 /W:0 /V /ZB

@REM -------------------------> Copy mdf to file 
net stop MSSQL$SALES_DEV
mkdir "%Befor_Format_Path%\MDF"
robocopy "C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SALES_DEV\MSSQL\DATA" "%Befor_Format_Path%\MDF" /E /COPYALL /R:0 /W:0 /V /ZB 
net start MSSQL$SALES_DEV
@REM -------------------------> Copy Serial to file 
if "%DB_NAME_choice%" == "2" (
  set Serial_File=SERIAL SPEEDOO REST.txt
) else (
    set Serial_File=SERIAL SPEEDOO.txt
) 
copy "C:\Users\%USERNAME%\Documents\%Serial_File%" "%Befor_Format_Path%\%Serial_File%" /Y
echo Backup Successful in %Befor_Format_Path%
pause
goto Main_Menu
@REM -------------------------> Befor_Updatet <----------------------------- 
:Befor_Update
set Befor_Update_Path=%BACKUP_DIR%/Befor_Update
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
@REM -------------------------> Backup Data
:Befor_Update_Backup
set Befor_Update_Backup_Path=%Befor_Update_Path%/Backup
echo Backup is start .....
 sqlcmd %SQL_Connecction% -Q "DECLARE @name NVARCHAR(256); DECLARE @backupFile NVARCHAR(256); DECLARE @sql NVARCHAR(MAX); DECLARE @backupDir NVARCHAR(256); SET @backupDir = '%Befor_Update_Backup_Path%'; DECLARE db_cursor CURSOR FOR SELECT name FROM master.dbo.sysdatabases WHERE name NOT IN ('master', 'model', 'msdb', 'tempdb'); OPEN db_cursor; FETCH NEXT FROM db_cursor INTO @name; WHILE @@FETCH_STATUS = 0 BEGIN; SET @backupFile = @backupDir + '\' + @name + CONVERT(VARCHAR, GETDATE(), 112) + '_' + REPLACE(CONVERT(VARCHAR, GETDATE(), 108), ':', '-') + '.bak'; SET @sql = 'BACKUP DATABASE [' + @name + '] TO DISK = ''' + @backupFile + ''' WITH NOFORMAT, NOINIT, NAME = ''' + @name + '-Full Database Backup'', SKIP, NOREWIND, NOUNLOAD, STATS = 10'; EXEC sp_executesql @sql; FETCH NEXT FROM db_cursor INTO @name; END; CLOSE db_cursor; DEALLOCATE db_cursor;"
if not exist "%Befor_Update_Backup_Path%" (
    cls
    mkdir "%Befor_Update_Backup_Path%"
    echo Folder created: %Befor_Update_Backup_Path%
    goto Befor_Update_Backup
) 
@REM -------------------------> Copy Mysetting Speedoo to file 
if "%DB_NAME_choice%" == "2" (
    set "Shortcut_Part=SPEEDOO REST"
    set "MySettingName=MySettingRESTAURANT"
) else (
    set "Shortcut_Part=SPEEDOO POS"
    set "MySettingName=MySettingSPEEDOO"
)
:start_serch_Shortcut_Update
set "UserDesktop=%USERPROFILE%\Desktop"
set "PublicDesktop=C:\Users\Public\Desktop"
set "TargetPath="
@REM -------------------------> check if shortcut in user desktop
for %%F in ("%UserDesktop%\%Shortcut_Part%*.lnk") do (
    for /f "delims=" %%A in ('powershell -command "(New-Object -ComObject WScript.Shell).CreateShortcut('%%F').TargetPath"') do (
        set "TargetPath=%%A"
        goto found_shortcut_Update
    )
)

@REM -------------------------> Search on Public Desktop if not found on the User's Desktop
if not defined TargetPath (
    for %%F in ("%PublicDesktop%\%Shortcut_Part%*.lnk") do (
        for /f "delims=" %%A in ('powershell -command "(New-Object -ComObject WScript.Shell).CreateShortcut('%%F').TargetPath"') do (
            set "TargetPath=%%A"
            goto found_shortcut_Update
        )
    )
)
@REM -------------------------> Prompt for path if shortcut is not found
if not defined TargetPath (
    if  "%DB_NAME_choice%" == "2" (
    set "Shortcut_Part=RESTAURANT_APP"
    goto start_serch_Shortcut
    ) else (
        set "Shortcut_Part=SPEEDOO_APP"
    goto start_serch_Shortcut_Update
    )
    )
@REM -------------------------> check if not defined
if not defined TargetPath (
    cls
    echo Could not find the shortcut for %Shortcut_File% on either User or Public Desktop.
    set /p TargetPath="Please type the path of Speedoo file location: "
)
:found_shortcut_Update
set "TargetDir=%TargetPath%\.."
mkdir "%Befor_Update_Path%\%MySettingName%"
robocopy "%TargetDir%\%MySettingName%" "%Befor_Update_Path%\%MySettingName%" /E /COPYALL /R:0 /W:0 /V /ZB
pause
goto Main_Menu
@REM -------------------------> Solutions <----------------------------- 
:Solutions
cls
echo.
echo.
echo                  -------------------------------------------------------------
echo.                                          Solutions
echo                  -------------------------------------------------------------
echo.
echo                     1. Date and Time                     2. Delet locale          
echo.
echo                     3. New Setup                         4. Stop windefend and Firewall
echo.   
echo                     5. Side By Side                      6. Active Windows and Office
echo.   
echo                     7. GO BACK                           0. Exit 
echo.  
echo                  -------------------------------------------------------------
echo.
set /p choice="Please choose an option : "
if "%choice%"=="1" goto Date_and_Time
if "%choice%"=="2" goto Delet_locale 
if "%choice%"=="3" goto New_Setup 
if "%choice%"=="4" goto Stop_windefend_and_Firewall
if "%choice%"=="5" goto Side_By_Side
if "%choice%"=="6" goto Active_Windows_Office
if "%choice%"=="7" goto Main_Menu
if "%choice%"=="0" goto Exit
echo Invalid choice! Please choose again.
pause
goto Solutions
@REM -------------------------> Date_and_Time <----------------------------- 
:Date_and_Time
@REM ----------->restart window time service
sc config w32time start= auto
net stop w32time && net start w32time
@REM ----------->start time server
w32tm /config /manualpeerlist:"time.google.com" /syncfromflags:manual /reliable:YES /update
@REM ----------->resync with time server
w32tm /resync
@REM ----------->check if time updated
w32tm /query /status
@REM -----------------set time zone Baghdad +3 
tzutil /s "Arabic Standard Time"
@REM ----------------- set the locale to "en-US" (United States)
powershell -command "Set-ItemProperty -Path 'HKCU:\Control Panel\International\' -Name 'LocaleName' -Value 'en-US'"
@REM ----------------- Set the short date format to yyyy/MM/dd
powershell -command "Set-ItemProperty -Path 'HKCU:\Control Panel\International\' -Name 'sShortDate' -Value 'yyyy/MM/dd'"
@REM ----------------- Set the long date format to a common US long format (optional)
powershell -command "Set-ItemProperty -Path 'HKCU:\Control Panel\International\' -Name 'sLongDate' -Value 'dddd, MMMM dd, yyyy'"
pause
goto Main_Menu
@REM ------------------------->  Delet locale  <-------------------------
:Delet_locale 
@RD /S /Q "%userprofile%\AppData\Local\IRAQSOFT/"
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

netsh advfirewall set publicprofile state off
netsh advfirewall set currentprofile state off
netsh advfirewall set domainprofile state off
netsh advfirewall set allprofiles state off
netsh advfirewall set privateprofile state off
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f 
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f
goto Main_Menu

@REM -------------------------> Side_By_Side <-------------------------
:Side_By_Side
set side_By_side_Files="C:\side_By_side_Files"
if not exist %side_By_side_Files% (
    mkdir %side_By_side_Files% )
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                           App Name
echo                  -------------------------------------------------------------
echo.
echo                     1. SPEEDOO POS                 2. SPEEDOO REST
echo.          
echo                     3. Point POS                 
echo.                
echo                  -------------------------------------------------------------
echo.
set /p App_NAME_choice="Please choose an option : "
if "%App_NAME_choice%"=="1" (
    set "Shortcut_Part=SPEEDOO POS"
    curl -o "%side_By_side_Files%/App.config" "https://raw.githubusercontent.com/Iraqsoft95/IraqSoft/refs/heads/main/SideBySide/App.config"
    curl -o "%side_By_side_Files%/SPEEDOO_APP.exe.Config" "https://raw.githubusercontent.com/Iraqsoft95/IraqSoft/refs/heads/main/SideBySide/SPEEDOO_APP.exe.Config"
)
if "%App_NAME_choice%"=="2" (
      set "Shortcut_Part=SPEEDOO REST"
     curl -o "%side_By_side_Files%/RESTAURANT_APP.exe.Config" "https://raw.githubusercontent.com/Iraqsoft95/IraqSoft/refs/heads/main/SideBySide/RESTAURANT_APP.exe.Config"

)
if "%App_NAME_choice%"=="3" (
      set "Shortcut_Part=Point"
     curl -o "%side_By_side_Files%/POINT_OF_SALES.exe.Config" "https://raw.githubusercontent.com/Iraqsoft95/IraqSoft/refs/heads/main/SideBySide/Point_Pos/POINT_OF_SALES.exe.Config"
    curl -o "%side_By_side_Files%/App.config" "https://raw.githubusercontent.com/Iraqsoft95/IraqSoft/refs/heads/main/SideBySide/Point_Pos/App.config"
)
:start_serch_Shortcut_sideByside
set "UserDesktop=%USERPROFILE%\Desktop"
set "PublicDesktop=C:\Users\Public\Desktop"
set "TargetPath="
@REM -------------------------> check if shortcut in user desktop
for %%F in ("%UserDesktop%\%Shortcut_Part%*.lnk") do (
    for /f "delims=" %%A in ('powershell -command "(New-Object -ComObject WScript.Shell).CreateShortcut('%%F').TargetPath"') do (
        set "TargetPath=%%A"
        goto found_shortcut_sideByside
    )
)

@REM -------------------------> Search on Public Desktop if not found on the User's Desktop
if not defined TargetPath (
    for %%F in ("%PublicDesktop%\%Shortcut_Part%*.lnk") do (
        for /f "delims=" %%A in ('powershell -command "(New-Object -ComObject WScript.Shell).CreateShortcut('%%F').TargetPath"') do (
            set "TargetPath=%%A"
            goto found_shortcut_sideByside
        )
    )
)
@REM -------------------------> Prompt for path if shortcut is not found
if not defined TargetPath (
    if  "%App_NAME_choice%" == "2" (
    set "Shortcut_Part=RESTAURANT_APP"
    goto start_serch_Shortcut_sideByside
    ) else if "%App_NAME_choice%" == "1" (
        set "Shortcut_Part=SPEEDOO_APP"
    goto start_serch_Shortcut_sideByside
    ) else if "%App_NAME_choice%" == "3" (
        set "Shortcut_Part=POINT_OF_SALES"
    goto start_serch_Shortcut_sideByside
    )
    )
@REM -------------------------> check if not defined
if not defined TargetPath (
    cls
    echo Could not find the shortcut for %Shortcut_File% on either User or Public Desktop.
    set /p TargetPath="Please type the path of Speedoo file location: "
)
:found_shortcut_sideByside
set "TargetDir=%TargetPath%\.."
robocopy "%side_By_side_Files%" "%TargetDir%" /E /COPYALL /R:0 /W:0 /V /ZB
start "" "%TargetPath%"
pause
rmdir /s /q  %side_By_side_Files%
goto Main_Menu
@REM -------------------------> Active_Windows_Office <----------------------------- 
:Active_Windows_Office
powershell -ExecutionPolicy Bypass -NoProfile -Command "irm https://get.activated.win | iex"
goto Main_Menu
@REM -------------------------> Connections <----------------------------- 
:Connections
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                           Connections   
echo                  -------------------------------------------------------------
echo.
echo                     1. IP Address Edite      
echo.
echo                     5. GO BACK                      0. Exit 
echo.                     
echo                  -------------------------------------------------------------
echo.
set /p choice="Please choose an option : "
if "%choice%"=="1"  goto IP_Address_Edite   
if "%choice%"=="5" goto Main_Menu
if "%choice%"=="0" goto Exit
echo Invalid choice! Please choose again.
pause
goto Connections
@REM -------------------------> IP_Address_Edite  <----------------------------- 
:IP_Address_Edite 
@REM -------------------------> select Connection  <----------------------------- 
:select_Connection
cls
echo.
echo                  -------------------------------------------------------------
echo                                          select Connection   
echo                  -------------------------------------------------------------
echo.
echo                     1. Wi-Fi                         2. Ethernet      
echo.
echo                     3. GO BACK                       0. Exit 
echo.                     
echo                  -------------------------------------------------------------
echo.
set /p choice_Connection="Please choose an option : "
if "%choice_Connection%"=="1" set Adapter_Name="Wi-Fi"& goto Main_IP_Address_Edite
if "%choice_Connection%"=="2" set Adapter_Name="Ethernet"& goto Main_IP_Address_Edite
if "%choice_Connection%"=="3" goto IP_Address_Edite  
if "%choice_Connection%"=="0" goto Exit
echo Invalid choice! Please choose again.
pause
goto select_IP_Address_Edite
@REM -------------------------> select Connection  <----------------------------- 
:Main_IP_Address_Edite
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                          IP Address Edite 
echo                  -------------------------------------------------------------
echo.
echo                     1. Add IP Address               2.Delet All IP Address
echo.
echo                     3. Show All IP Address            
echo.
echo                     5. GO BACK                      0. Exit 
echo.                     
echo                  -------------------------------------------------------------
echo.
set /p choice="Please choose an option : "
if "%choice%"=="1"  goto Add_IP_Address   
if "%choice%"=="2"  goto Delet_All_IP_Address  
if "%choice%"=="3"  goto Show_All_IP_Address  
if "%choice%"=="5" goto IP_Address_Edite
if "%choice%"=="0" goto Exit
echo Invalid choice! Please choose again.
pause
goto Main_IP_Address_Edite
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
powershell -Command "Get-NetIPAddress | Where-Object {$_.InterfaceAlias -like '*%Adapter_Name%*' -and $_.AddressFamily -eq 'IPv4'} | Select-Object IPAddress, State | Out-File '%SCRIPT_PATH%\ip_status.txt'"
start "" "%SCRIPT_PATH%\ip_status.txt"
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
:Exit
echo Exiting the program...
pause
exit
