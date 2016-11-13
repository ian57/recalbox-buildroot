################################################################################
#
# FBA
#
################################################################################
<<<<<<< HEAD
#LIBRETRO_FBA_VERSION = d5a2be323e334035cbfd471439d42c7957c5a99d
LIBRETRO_FBA_VERSION = b9ef7c1349c720de6ce6242a710a306cf12dc35d
=======
LIBRETRO_FBA_VERSION = 43d71c74c2f5d8c47296baacf6e86cfde0bbed9a
>>>>>>> 518de218baf5a14e8550aafb331081cc78dff52b
LIBRETRO_FBA_SITE = $(call github,libretro,fbalpha,$(LIBRETRO_FBA_VERSION))

define LIBRETRO_FBA_BUILD_CMDS
	CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f makefile.libretro
endef

define LIBRETRO_FBA_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/fbalpha_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/fba_libretro.so
endef

$(eval $(generic-package))
