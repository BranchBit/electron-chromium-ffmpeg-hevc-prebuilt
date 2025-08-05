# electron-chromium-ffmpeg-hevc-prebuilt
Built using patches provided by StaZhu:
https://github.com/StaZhu/enable-chromium-hevc-hardware-decoding


Initiall follow the build instructions: https://www.electronjs.org/docs/latest/development/build-instructions-gn

- after the gclient sync -f step, **EDIT** and run the patch.sh script

- add build args to electron/build/args/release.gn
```
is_debug = false
proprietary_codecs = true
ffmpeg_branding = "Chrome"
media_use_ffmpeg = true
media_use_libvpx = true
media_use_openh264 = true
enable_nacl=false
symbol_level=0
blink_symbol_level=0
v8_symbol_level=0
proprietary_codecs=true
enable_hevc_parser_and_hw_decoder=true
enable_platform_hevc=true
platform_has_optional_hevc_support=true
```



- continue the rest of the build
