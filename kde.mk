include debian/cdbs/cmake.mk
include /usr/share/cdbs/1/rules/debhelper.mk
include /usr/share/cdbs/1/rules/patchsys-quilt.mk
include /usr/share/cdbs/1/rules/utils.mk

DEB_DH_INSTALL_ARGS = --sourcedir=debian/tmp
DEB_COMPRESS_EXCLUDE = .dcl .docbook -license .tag .sty .el



ifeq (,$(findstring noopt,$(DEB_BUILD_OPTIONS)))
	#no optimizations, full debug
       DEB_CMAKE_DEBUG_FLAGS = -DCMAKE_BUILD_TYPE=debugfull
else
	#This is around -O2 -g
       DEB_CMAKE_DEBUG_FLAGS = -DCMAKE_BUILD_TYPE=relwithdebinfo
endif


