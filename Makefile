ARCHS = arm64 

DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1
export THEOS=/var/theos
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = 7AMOD

KITTYMEMORY_SRC = Tweak.xm $(wildcard KittyMemory/*.cpp)

7AMOD_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG
7AMOD_CFLAGS = -fobjc-arc #-w #-Wno-deprecated -Wno-deprecated-declarations
7AMOD_FILES = Tweak.xm $(KITTYMEMORY_SRC)  $(wildcard views/*.m)
7AMOD_LIBRARIES += substrate
# GO_EASY_ON_ME = 1

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 pubg || :"
