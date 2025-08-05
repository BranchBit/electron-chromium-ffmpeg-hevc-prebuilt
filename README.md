# electron-chromium-ffmpeg-hevc-prebuilt
Big thank you to StaZhu for the original patches:

https://github.com/StaZhu/enable-chromium-hevc-hardware-decoding

=============================================================================



- Initially follow the build instructions: https://www.electronjs.org/docs/latest/development/build-instructions-gn

- After the gclient sync -f step, and run:
```/bin/bash
patch.sh /path/to/electron/src
```
- Add build args to electron/build/args/release.gn
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
