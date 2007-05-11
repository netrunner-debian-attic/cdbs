export XDG_DATA_DIRS=/usr/share
export XDG_CONFIG_DIRS=/etc/xdg


include debian/cdbs/cmake.mk
include /usr/share/cdbs/1/rules/debhelper.mk
include /usr/share/cdbs/1/rules/patchsys-quilt.mk
include /usr/share/cdbs/1/rules/utils.mk

DEB_DH_INSTALL_ARGS = --sourcedir=debian/tmp
DEB_COMPRESS_EXCLUDE = .dcl .docbook -license .tag .sty .el
DEB_KDE_ENABLE_FINAL ?= 

DEB_CMAKE_EXTRA_FLAGS += -DKDE4_BUILD_TESTS=true -DKDE_DISTRIBUTION_TEXT="Debian packages"

ifeq (,$(findstring noopt,$(DEB_BUILD_OPTIONS)))
    cdbs_treat_me_gently_arches := arm m68k alpha ppc64 armel armeb
    ifeq (,$(filter $(DEB_HOST_ARCH_CPU),$(cdbs_treat_me_gently_arches)))
        KDE4-ENABLE-FINAL = $(if $(DEB_KDE_ENABLE_FINAL),-DKDE4_ENABLE_FINAL=true,)
    else
        KDE4-ENABLE-FINAL =
    endif
endif



ifeq (,$(findstring noopt,$(DEB_BUILD_OPTIONS)))
	#no optimizations, full debug
       DEB_CMAKE_DEBUG_FLAGS = -DCMAKE_BUILD_TYPE=debugfull
else
	#This is around -O2 -g
       DEB_CMAKE_DEBUG_FLAGS = -DCMAKE_BUILD_TYPE=relwithdebinfo
endif




