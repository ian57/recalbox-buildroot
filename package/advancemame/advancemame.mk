################################################################################
#
#advancemame
#
################################################################################

#latest
#ADVANCEMAME_VERSION = 339eab5a4b19a614b53efee2d62015c758694a4f
#stable
ADVANCEMAME_VERSION = advancemame-1.4
ADVANCEMAME_SITE = $(call github,amadvance,advancemame,$(ADVANCEMAME_VERSION))
ADVANCEMAME_DEPENDENCIES += rpi-userland sdl

define ADVANCEMAME_RUN_AUTOGEN
        cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef

ADVANCEMAME_PRE_CONFIGURE_HOOKS += ADVANCEMAME_RUN_AUTOGEN

ADVANCEMAME_CONF_ENV = LDFLAGS=-L$(STAGING_DIR)/usr/lib/

ADVANCEMAME_CONF_OPTS += \
	--with-emu=mame \
	--prefix=$(TARGET_DIR)/usr \
	--exec-prefix=$(TARGET_DIR)/usr \
	--enable-pthreads \
	--prefix=$(TARGET_DIR)/usr \
	--enable-sdl --with-sdl-prefix=$(STAGING_DIR)/usr \
	--enable-freetype --with-freetype-prefix=$(STAGING_DIR)/usr \
	--disable-kraw \
	--disable-kevent \
	--enable-alsa \
	--disable-oss

ADVANCEMAME_AUTORECONF = YES

$(eval $(autotools-package))
