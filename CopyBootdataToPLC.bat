@echo off
echo "Copying bootdata to plc..."



REM Copy the file to the destination folder
copy "C:\TC_PersistentData_Backup\Port_851.bootdata" "C:\ProgramData\Beckhoff\TwinCAT\3.1\Boot\Plc\Port_851.bootdata"

if exist "C:\ProgramData\Beckhoff\TwinCAT\3.1\Boot\Plc\Port_851.bootdata" (
    echo "File copied successfully"
) else (
    echo "Failed to copy the file"
	pause
)

:end
