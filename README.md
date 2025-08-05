# electron-chromium-ffmpeg-hevc-prebuilt
Built using patches provided by StaZhu:
https://github.com/StaZhu/enable-chromium-hevc-hardware-decoding


follow: https://www.electronjs.org/docs/latest/development/build-instructions-gn
after the gclient sync -f step, run the patch script

add build args to electron/build/args/release.gn

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
#enable_platform_ac3_eac3_audio=true
#enable_platform_dolby_vision=true
#enable_platform_ac4_audio=true
#enable_platform_mpeg_h_audio=true

continue the rest of the build
