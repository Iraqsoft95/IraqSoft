@ECHO OFF 
title IRAQSOFT SUPPORT TOOLS V 0.2
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
set "SCRIPT_PATH=%~dp0"
set "SCRIPT_NAME=%~nx0"
set File_Loc="%SCRIPT_PATH%%SCRIPT_NAME%"
set PC_Name=%COMPUTERNAME%
set Server_Name= .\SALES_DEV
set SQL_Connecction= -S .\SALES_DEV  -U sa -P 12345
set SQLCMD="C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\sqlcmd.exe"
set "Download_Path=%USERPROFILE%\Downloads"
@REM -------------------------> Downloads Info
@REM ----------> SPEEDOO POS 
set SPEEDOO_POS_FULL_URL="https://www.dropbox.com/scl/fi/inwa5nl2ua5hlm1blb7rf/SPEEDOO-POS-1.3.8.4-FULL.exe?rlkey=kpqtgcwg490kxqo01h0ygz746&e=1&dl=0"
set SPEEDOO_POS_FULL_FILE="%Download_Path%\SPEEDOO-POS-1.3.8.4-FULL.exe"
set SPEEDOO_POS_UPDATE_URL= "https://www.dropbox.com/scl/fi/p5svl5yfmihdyuva6c158/SPEEDOO-POS-1.3.8.4-UPDATE.exe?rlkey=tms77f0sc9xe5he1l2m9mmvxu&e=1&dl=0"
set SPEEDOO_POS_UPDATE_FILE= "%Download_Path%\SPEEDOO-POS-1.3.8.4-UPDATE.exe"
set SPEEDOO_POS_CLINT_URL= "https://www.dropbox.com/scl/fi/cvh53cxfptgrbl4th9ybf/SPEEDOO-POS-1.3.8.4-CLIENTS.exe?rlkey=engqaag83qnl4584g8hey1e3f&e=1&dl=0"
set SPEEDOO_POS_CLINT_FILE= "%Download_Path%\SPEEDOO-POS-1.3.8.4-CLIENTS.exe"

@REM -----------> SPEEDOO REST 
set SPEEDOO_REST_FULL_URL= "https://www.dropbox.com/scl/fi/dnyporwaojb1iysma0lk4/Speedoo-APP-3.0.5.7-FULL.exe?rlkey=b2rgp9yxvz2hn2cil5zv37she&st=1sulgbl7&dl=0"
set SPEEDOO_REST_FULL_FILE= "%Download_Path%\Speedoo-APP-3.0.5.7-FULL.exe"
set SPEEDOO_REST_UPDATE_URL= "https://www.dropbox.com/scl/fi/fsv5smyvtychtmqn3ncia/Speedoo-REST-3.0.5.7-CLIENTS.exe?rlkey=bg8zzdlkzl7g2h89367kljzg7&e=1&st=xiesetls&dl=0"
set SPEEDOO_REST_UPDATE_FILE= "%Download_Path%\Speedoo-REST-3.0.5.7-CLIENTS.exe"
set SPEEDOO_REST_CLINT_URL= "https://www.dropbox.com/scl/fi/39s6a36r0hzj7g8bgnbyd/Speedoo-REST-3.0.5.7-UPDATE.exe?rlkey=hv665vott91ebgngbxeu8mvt6&e=1&st=x78dtckx&dl=0"
set SPEEDOO_REST_CLINT_FILE= "%Download_Path%\Speedoo-REST-3.0.5.7-UPDATE.exe"

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
set config=iqs
cls
echo.
echo.                             
echo                  -------------------------------------------------------------
echo.                                 Welcom To IRAQSOFT SUPPORT TOOLE
echo                  -------------------------------------------------------------
echo.
set /p  Type_config=".       Type The Password To Enter to The Tool : " /i
echo.                                          

if "%Type_config%"=="%config%" goto Main_Menu
echo Invalid choice! Please choose again.
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
echo                     4. Solutions          5. Connections       6.Exit 
echo.
echo                  -------------------------------------------------------------
echo.
set /p choice="Please choose an option : "

if "%choice%"=="1" goto Downloads
if "%choice%"=="2" goto Printers
if "%choice%"=="3" goto SQL_Server
if "%choice%"=="4" goto Solutions
if "%choice%"=="5" goto Connections
if "%choice%"=="6" goto Exit

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
echo                                             00.Exit
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
if "%Download_choice%"=="00" goto Exit

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
echo                     1. 1.3.8.4 FULL          
echo.
echo                     2. 1.3.8.4 UPDATE
echo.
echo                     3. 1.3.8.4 CLIENTS 
echo.                     
echo                     4. GO BACK  
echo.
echo                     0. Exit 
echo.
echo                  -------------------------------------------------------------
echo.
set /p SPEEDOO_POS_choice="Please choose an option : "

if "%SPEEDOO_POS_choice%"=="1" set url= %SPEEDOO_POS_FULL_URL%& set output=%SPEEDOO_POS_FULL_FILE%& goto Start_Download
if "%SPEEDOO_POS_choice%"=="2" set url= %SPEEDOO_POS_UPDATE_URL%& set output=%SPEEDOO_POS_UPDATE_FILE%& goto Start_Download
if "%SPEEDOO_POS_choice%"=="3" set url= %SPEEDOO_POS_CLINT_URL%& set output=%SPEEDOO_POS_CLINT_FILE%& goto Start_Download
if "%Download_choice%"=="4" goto SPEEDOO_POS_Download
if "%Download_choice%"=="0" goto Exit

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
echo                     1. 3.0.5.7 FULL          
echo.
echo                     2. 3.0.5.7 UPDATE
echo.
echo                     3. 3.0.5.7 CLIENTS 
echo.                     
echo                     4. GO BACK  
echo.
echo                     0. Exit 
echo.
echo                  -------------------------------------------------------------
echo.
set /p SPEEDOO_POS_choice="Please choose an option : "

if "%SPEEDOO_POS_choice%"=="1" set url= %SPEEDOO_REST_FULL_URL%& set output=%SPEEDOO_REST_FULL_FILE%& goto Start_Download
if "%SPEEDOO_POS_choice%"=="2" set url= %SPEEDOO_REST_UPDATE_URL%& set output=%SPEEDOO_REST_UPDATE_FILE%& goto Start_Download
if "%SPEEDOO_POS_choice%"=="3" set url= %SPEEDOO_REST_CLINT_URL%& set output=%SPEEDOO_REST_CLINT_FILE%& goto Start_Download
if "%Download_choice%"=="4" goto SPEEDOO_POS_Download
if "%Download_choice%"=="0" goto Exit
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
echo                     1. 3.9.2 FULL          
echo.
echo                     2. 3.9.2 UPDATE
echo.
echo                     3. GO BACK   
echo.    
echo                     0. Exit  
echo.                 
echo.                     
echo.
echo                  -------------------------------------------------------------
echo.
set /p Point_Pos_choice="Please choose an option : "

if "%Point_POS_choice%"=="1" set url= %Point_Pos_FULL_URL%& set output=%Point_Pos_FULL_FILE%& goto Start_Download
if "%Point_POS_choice%"=="2" set url= %Point_Pos_UPDATE_URL%& set output=%Point_Pos_UPDATE_FILE%& goto Start_Download
if "%Download_choice%"=="3" goto SPEEDOO_POS_Download
if "%Download_choice%"=="0" goto Exit

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
echo                     1. 3.0.0.2 FULL          
echo.
echo                     2. 3.0.0.2 UPDATE
echo.
echo                     3. 3.0.0.2 CLIENTS 
echo.      
echo                     4. GO BACK   
echo.    
echo                     0. Exit  
echo.                    
echo                  -------------------------------------------------------------
echo.
set /p SPEEDOO_POS_choice="Please choose an option : "

if "%SPEEDOO_POS_choice%"=="1" set url= %Point_Super_FULL_URL%& set output=%Point_Super_FULL_FILE%& goto Start_Download
if "%SPEEDOO_POS_choice%"=="2" set url= %Point_Super_UPDATE_URL%& set output=%Point_Super_UPDATE_FILE%& goto Start_Download
if "%SPEEDOO_POS_choice%"=="3" set url= %Point_Super_CLINT_URL%& set output=%Point_Super_CLINT_FILE%& goto Start_Download
if "%Download_choice%"=="4" goto SPEEDOO_POS_Download
if "%Download_choice%"=="0" goto Exit

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
echo                                              0. Exit  
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
if "%Download_choice%"=="6" goto SPEEDOO_POS_Download
if "%Download_choice%"=="0" goto Exit

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
if "%Download_choice%"=="5" goto SPEEDOO_POS_Download
if "%Download_choice%"=="0" goto Exit

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
echo                     5. GO Back                       0. Exit                
echo.
echo                  -------------------------------------------------------------
echo.
set /p SQL_choice="Please choose an option : "

if "%SQL_choice%"=="1" set url= %dControl_URL%& set output=%dControl_FILE%& goto Start_Download
if "%SQL_choice%"=="2" set url= %WUB_URL%& set output=%WUB_FILE%& goto Start_Download
if "%SQL_choice%"=="3" set url= %Windows_Activity_URL%& set output=%Windows_Activity_FILE%& goto Start_Download
if "%SQL_choice%"=="4" set url=%Winrar_URL%& set output= %Winrar_FILE%& goto Start_Download
if "%Download_choice%"=="5" goto SPEEDOO_POS_Download
if "%Download_choice%"=="0" goto Exit

echo Invalid choice! Please choose again.
pause
goto Service_Programs_Download

@REM -------------------------> Printers <----------------------------- 
:Printers
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
if "%Download_choice%"=="11" goto Main_Menu
if "%Download_choice%"=="0" goto Exit

echo Invalid choice! Please choose again.
pause
goto Printers

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
echo                     1. SPEEDOO_DB         
echo.
echo                     2. RESTAURANT_DB
echo.                     
echo                     3. Other Name 
echo.
echo                     4. GO BACK
echo.
echo                     0. Exit 
echo.
echo                  -------------------------------------------------------------
echo.
set /p DB_NAME_choice="choose Yor Databases Name: "
if "%DB_NAME_choice%"=="1"   set DB_NAME=SPEEDOO_DB & goto SQL_Server_List
if "%DB_NAME_choice%"=="2"   set DB_NAME=RESTAURANT_DB & goto SQL_Server_List
if "%DB_NAME_choice%"=="3"  set /p DB_NAME="Typ Your Database NAME  :  "&  goto SQL_Server_List
if "%Download_choice%"=="4" goto Main_Menu
if "%Download_choice%"=="0" goto Exit

echo Invalid choice! Please choose again.
pause
goto SQL_Server 
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
echo                     3. GO BACK                            0. Exit               
echo.
echo.                  
echo                  -------------------------------------------------------------
echo.
set /p choice="Please choose an option : "
if "%choice%"=="1"  goto Telgram 
if "%choice%"=="2"  goto Users_Edite 
if "%Download_choice%"=="3" goto Main_Menu
if "%Download_choice%"=="0" goto Exit

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
echo                     1. Add Chat id          
echo.
echo                     2. Telegram Disable in setting
echo.                     
echo                     3. GO BACK  
echo.
echo                     0. Exit 
echo.
echo                  -------------------------------------------------------------
echo.
set /p SPEEDOO_POS_choice="Please choose an option : "
if "%SPEEDOO_POS_choice%"=="1"  goto Add_Chat_Id
if "%SPEEDOO_POS_choice%"=="2"  goto Telegram_Disable
if "%Download_choice%"=="3" goto SQL_Server
if "%Download_choice%"=="0" goto Exit

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
if "%Download_choice%"=="3" goto SQL_Server_List
if "%Download_choice%"=="0" goto Exit

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

@REM -------------------------> Users_Edite  <-----------------------------
:Users_Edite 
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
echo                     5. GO Back                       4. Delet All
echo.
echo                  -------------------------------------------------------------
echo.
set /p choice="choose From List: "
if "%choice%"=="1"  goto Add_User 
if "%choice%"=="2"  set /p DB_NAME="Typ Your Database NAME  :  "&  goto chat_id
if "%Download_choice%"=="0" goto Main_Menu
if "%Download_choice%"=="00" goto Exit

echo Invalid choice! Please choose again.
pause
goto Users_Edite 

@REM -------------------------> Add User   <-----------------------------
:Add_User 
sqlcmd %SQL_Connecction% -d SPEEDOO_DB  -Q "INSERT INTO T_USERS VALUES ('0','IRAQSOFT','i/AnLHA+8LvROCNy6n6IlA==','1','True','False','5000','True','3','-10','-10','-10','NULL','1','0',NULL);"
echo Your Password ( 00 )
pause
goto Main_Menu
@REM -------------------------> Start_Download <----------------------------- 
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
