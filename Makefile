MAKEARGS := -C $(CURDIR)/buildroot
MAKEARGS += BR2_EXTERNAL=$(CURDIR)/skarnet
MAKEARGS += BR2_DL_DIR=$(HOME)/sources/br2

MAKEFLAGS += --no-print-directory

specials := Makefile defconfig %_defconfig

all := $(filter-out $(specials),$(MAKECMDGOALS))

default:
	$(MAKE) $(MAKEARGS)

%_defconfig:
	$(MAKE) $(MAKEARGS) $@

_all:
	$(MAKE) $(MAKEARGS) $(all)

$(all): _all
	@:

%/: _all
	@:

Makefile:;

.PHONY: $(all) $(specials)
