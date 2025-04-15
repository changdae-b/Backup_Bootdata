@echo off
echo "Copying C:\Users\YourName\Documents\my_file.txt to a folder named with the current date and time..."

REM REM Format ex) [04/15/2025 Tue]
REM for /f "tokens=3 delims=/ " %%a in ('date /t') do set yyyy=%%a
REM for /f "tokens=2 delims=/ " %%a in ('date /t') do set dd=%%a
REM for /f "tokens=1 delims=/ " %%a in ('date /t') do set mm=%%a


rem format ex) [Tue 04/15/2025]
for /f "tokens=4 delims=/ " %%a in ('date /t') do set yyyy=%%a
for /f "tokens=3 delims=/ " %%a in ('date /t') do set dd=%%a
for /f "tokens=2 delims=/ " %%a in ('date /t') do set mm=%%a

echo %dd%d
echo %mm%m
echo %yyyy%y
echo %yyyy%y

REM 현재 시간 가져오기 (11:14 AM 형식에서 시, 분 추출)
for /f "tokens=1 delims=:" %%a in ('time /t') do set hh=%%a
for /f "tokens=2 delims=: " %%a in ('time /t') do set mn=%%a

REM 초는 00으로 고정 (필요하다면 더 복잡한 방법으로 추출해야 함)

set timestamp=%yyyy%y%mm%m%dd%d_%hh%h%mn%m

REM PATH
set path=C:\TC_PersistentData_Backup\

set destinationFolder=%path%%timestamp%


echo timestamp %timestamp%
echo path %path%
echo destinationFolder %destinationFolder%



REM Create the destination folder if it doesn't exist
if not exist "%destinationFolder%" (
    echo "Creating folder: %destinationFolder%..."
    mkdir "%destinationFolder%"
    if exist "%destinationFolder%" (
        echo "Folder created successfully."
    ) else (
        echo "Failed to create folder."
        goto end
    )
)

REM Copy the file to the destination folder
copy "C:\ProgramData\Beckhoff\TwinCAT\3.1\Boot\Plc\Port_851.bootdata" "%destinationFolder%\"
copy "C:\ProgramData\Beckhoff\TwinCAT\3.1\Boot\Plc\Port_851.bootdata" "%path%\"

if exist "%destinationFolder%\Port_851.bootdata" (
    echo "File copied successfully to %destinationFolder%."
) else (
    echo "Failed to copy the file to %destinationFolder%."
)

:end
pause