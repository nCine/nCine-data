#!/usr/bin/env sh
SHADERS_DIR=../nCine/src/shaders
EXTERNAL_STORAGE=$(adb shell "echo -n \$EXTERNAL_STORAGE")
DEST_DIR=$EXTERNAL_STORAGE/ncine

echo "Copying data to $DEST_DIR"
if [ -d $SHADERS_DIR ]; then
	adb push $SHADERS_DIR $DEST_DIR/shaders
fi

for f in fonts/*.fnt; do
	adb push $f $DEST_DIR/fonts/$(basename $f)
done
for f in textures/testformats/*.{ktx,dds,pvr}; do
	adb push $f $DEST_DIR/textures/testformats/$(basename $f)
done
adb push sounds $DEST_DIR/sounds

adb push android/fonts/ $DEST_DIR
adb push android/textures $DEST_DIR
adb push android/textures/testformats $DEST_DIR/textures
