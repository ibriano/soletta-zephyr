KERNEL_TYPE ?= nano
BOARD ?= quark_se_devboard
MDEF_FILE ?= prj.mdef
CONF_FILE ?= prj_$(BOARD).conf
SOLETTA_CONF ?= $(realpath $(PWD)/sol_$(BOARD).conf)
#SOLETTA_FLOW_CONFIG ?= $(realpath $(BUILD_DIR)/sol-flow_$(BOARD).json)

# We need to export these, because they are used from the sub-make invocation
export SOLETTA_CONF
#export SOLETTA_FLOW_CONFIG

include $(ZEPHYR_BASE)/Makefile.inc

