Into this folder copy the libopenxr_loader.so for each HMD required to support, suffixed with the headset type:

libopenxr_loader_meta.so
libopenxr_loader_pico.so

Both libraries must keep DT_SONAME=libopenxr_loader.so. A link-time copy at Projects/AndroidPrebuilt/jni/libopenxr_loader.so is also needed for ndk-build (and is excluded from the APK by build.gradle).
