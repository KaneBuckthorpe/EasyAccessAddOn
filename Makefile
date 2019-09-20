ARCHS := armv7 armv7s arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = EasyAccessAddOn
EasyAccessAddOn_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
