APP_PLATFORM := android-32

APPLICATIONMK_PATH = $(call my-dir)
NDK_MODULE_PATH := $(APPLICATIONMK_PATH)/../..

XASH_SDL ?= 0

APP_CFLAGS += -Wl,--no-undefined
# NDK r30 (Clang 19+) promotes legacy C99 implicit declarations/conversions and
# defaults C++ to C++17 (forbidding 'register') in upstream Xash3D/gl4es/HLSDK.
APP_CONLYFLAGS += -Wno-error=implicit-function-declaration -Wno-error=int-conversion -Wno-error=incompatible-function-pointer-types
APP_CPPFLAGS += -std=gnu++14

# if non-zero, works only if single ABI selected
XASH_THREAD_NUM ?= 0

TOP_DIR			:= $(APPLICATIONMK_PATH)/src
GL4ES_PATH := $(APPLICATIONMK_PATH)/src/gl4es/include
XASH3D_PATH := $(APPLICATIONMK_PATH)/src/Xash3D/xash3d
HLSDK_PATH  := $(APPLICATIONMK_PATH)/src/HLSDK/halflife/

# ndk-r14 introduced failure for missing dependencies. If 'false', the clean
# step will error as we currently remove prebuilt artifacts on clean.
APP_ALLOW_MISSING_DEPS=true

APP_MODULES := gl4es xash menu client server client_bshift server_bshift client_opfor server_opfor client_aomdc server_aomdc client_theyhunger server_theyhunger
APP_STL := c++_static


