echo off

for /f "tokens=* USEBACKQ" %%a in (`adb shell "echo -n $EXTERNAL_STORAGE"`) do (set EXTERNAL_STORAGE=%%a)
set DEST_DIR=%EXTERNAL_STORAGE%/ncine

echo Deleting %DEST_DIR%
adb shell rm -r %DEST_DIR%
