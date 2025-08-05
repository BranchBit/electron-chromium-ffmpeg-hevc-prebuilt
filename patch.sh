#!/bin/bash

## follow https://www.electronjs.org/docs/latest/development/build-instructions-gn
## change your source to checkout electron src v37.2.4
## then run this after the gclient sync step

electron_src_dir="$HOME/electron/src"   ## CHANGE THIS TO YOUR ELECTRON SOURCE DIRECTORY

# Download the necessary files
echo "Downloading necessary files..."
curl https://raw.githubusercontent.com/BranchBit/electron-chromium-ffmpeg-hevc-prebuilt/refs/heads/main/add-hevc-ffmpeg-decoder-parser.js -o add-hevc-ffmpeg-decoder-parser.js
curl https://raw.githubusercontent.com/BranchBit/electron-chromium-ffmpeg-hevc-prebuilt/refs/heads/main/add-hevc-ffmpeg-decoder-parser.patch -o add-hevc-ffmpeg-decoder-parser.patch
curl https://raw.githubusercontent.com/BranchBit/electron-chromium-ffmpeg-hevc-prebuilt/refs/heads/main/change-libavcodec-header.patch -o change-libavcodec-header.patch
curl https://raw.githubusercontent.com/BranchBit/electron-chromium-ffmpeg-hevc-prebuilt/refs/heads/main/enable-hevc-ffmpeg-decoding.patch -o enable-hevc-ffmpeg-decoding.patch


# Check if the current directory is correct
current_dir=$(pwd)
echo "Working directory is: $current_dir"
echo "Current directory is: $electron_src_dir"


# Check if the Electron source directory exists
if [ ! -d "$electron_src_dir" ]; then
  echo "Directory $electron_src_dir does not exist. Please clone the Electron repository first."
  exit 1
fi

# Change to the Electron source directory
cd "$electron_src_dir" || { echo "Failed to change directory to $electron_src_dir"; exit 1; }


# apply the patches from the old current dir to the new current dir
echo "Changed directory to: $(pwd)"
echo "Running directory is: $current_dir"
echo "Current directory is: $electron_src_dir"


read -p "Press any key to resume enable-hevc-ffmpeg-decoding.patch ..."

git apply --ignore-whitespace  "$current_dir/enable-hevc-ffmpeg-decoding.patch" --verbose



#change dir to old current dir/third_part/ffmpeg
cd "$electron_src_dir/third_party/ffmpeg" || { echo "Failed to change directory to $electron_src_dir/third_party/ffmpeg"; exit 1; }
echo "Changed directory to: $(pwd)"


read -p "Press any key to resume add-hevc-ffmpeg-decoder-parser.patch ..."

git apply --ignore-whitespace  "$current_dir/add-hevc-ffmpeg-decoder-parser.patch" --verbose


read -p "Press any key to resume change-libavcodec-header.patch ..."
# apply the patches from the old current dir to the new current dir
git apply --ignore-whitespace  "$current_dir/change-libavcodec-header.patch" --verbose

read -p "Press any key to resume add-hevc-ffmpeg-decoder-parser.js ..."
node "$current_dir/add-hevc-ffmpeg-decoder-parser.js"




#echo done finish script
echo "Patches applied successfully."
read -p "Press any key to end ..."


#add-hevc-ffmpeg-decoder-parser.js where ffmpeg_generated.gn is
#Update ffmpeg patch
#4 months ago
#add-hevc-ffmpeg-decoder-parser.patch src
#Update ffmpeg patch
#2 weeks ago
#change-libavcodec-header.patch before libavcodec
#Update ffmpeg patch
#2 weeks ago
#enable-hevc-ffmpeg-decoding.patch src
