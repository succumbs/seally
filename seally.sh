#!/bin/bash

IMG_DIR="assets"

if ! command -v img2sixel &> /dev/null; then
    echo "error: libsixel is not installed." >&2
    exit 1
fi

if ! [ -d "$IMG_DIR" ]; then
  echo "error: '$IMG_DIR' directory doesn't exist." >&2
  exit 1
fi

img=$(find "$IMG_DIR" -maxdepth 1 -type f | shuf -n 1)

if [ -z "$img" ]; then
    echo "error: no images were found in '$IMG_DIR'." >&2
    exit 1
fi

img2sixel "$img" -w 400 ; echo
