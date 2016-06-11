#!/usr/bin/env sh
EXTERNAL_STORAGE=$(adb shell "echo -n \$EXTERNAL_STORAGE")
DEST_DIR=$EXTERNAL_STORAGE/ncine

echo "Deleting $DEST_DIR"
adb shell rm -r $DEST_DIR
