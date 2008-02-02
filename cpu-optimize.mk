# -*- mode: makefile; coding: utf-8 -*-
# Copyright © 2008 Matthew Rosewarne <mrosewarne@inoutbox.com>
# Description: Determines possible CPU optimisations.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2, or (at
# your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
# 02111-1307 USA.

ifndef _cdbs_bootstrap
_cdbs_scripts_path ?= /usr/lib/cdbs
_cdbs_rules_path ?= /usr/share/cdbs/1/rules
_cdbs_class_path ?= /usr/share/cdbs/1/class
endif

ifndef _cdbs_rules_cpu_optimize
_cdbs_rules_cpu_optimize := 1
endif

include $(_cdbs_rules_path)/buildvars.mk$(_cdbs_makefile_suffix)


_cdbs_cpu_opt_i386 := 3dnow mmx sse sse2 sse3
_cdbs_cpu_opt_amd64 := 3dnow mmx sse sse2 sse3
_cdbs_cpu_opt_powerpc := altivec


ifdef _cdbs_cpu_opt_$(DEB_BUILD_ARCH_CPU)
	DEB_BUILD_ARCH_CPU_OPT = $(_cdbs_cpu_opt_$(DEB_BUILD_ARCH_CPU))
else
	DEB_BUILD_ARCH_CPU_OPT =
endif

ifdef _cdbs_cpu_opt_$(DEB_HOST_ARCH_CPU)
	DEB_HOST_ARCH_CPU_OPT = $(_cdbs_cpu_opt_$(DEB_HOST_ARCH_CPU))
else
	DEB_HOST_ARCH_CPU_OPT =
endif
