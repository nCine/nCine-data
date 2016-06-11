echo off

set SHADERS_DIR=../nCine/src/shaders
for /f "tokens=* USEBACKQ" %%a in (`adb shell "echo -n $EXTERNAL_STORAGE"`) do (set EXTERNAL_STORAGE=%%a)
set DEST_DIR=%EXTERNAL_STORAGE%/ncine

echo Copying data to %DEST_DIR%
if exist %SHADERS_DIR% (adb push %SHADERS_DIR% %DEST_DIR%/shaders)

for /f %%f in ('dir /b fonts\*.fnt') do (adb push fonts/%%f %DEST_DIR%/fonts/%%f)
for /f %%f in ('dir /b textures\testformats\*.ktx') do (adb push textures/testformats/%%f %DEST_DIR%/textures/testformats/%%f)
for /f %%f in ('dir /b textures\testformats\*.dds') do (adb push textures/testformats/%%f %DEST_DIR%/textures/testformats/%%f)
for /f %%f in ('dir /b textures\testformats\*.pvr') do (adb push textures/testformats/%%f %DEST_DIR%/textures/testformats/%%f)
adb push sounds %DEST_DIR%/sounds

adb push android/fonts %DEST_DIR%
adb push android/textures %DEST_DIR%
adb push android/textures/testformats %DEST_DIR%/textures
