export TARGETCC = $(strip $(CC))
export TARGETAR = $(strip $(AR))

override CFLAGS = $(KBUILD_CFLAGS) $(KBUILD_CPPFLAGS) $(ZEPHYRINCLUDE) -Wno-missing-include-dirs

include $(SOLETTA_BASE_DIR)/Makefile.smallos

export SOLETTA_NODE_DESCRIPTIONS ?= $(soletta_node_descriptions)
export FBPGEN ?= $(shell which sol-fbp-generator)

ZEPHYRINCLUDE += -I$(soletta_include_dir)

KBUILD_ZEPHYR_APP = $(soletta_target)

scripts_basic: $(KBUILD_ZEPHYR_APP)
