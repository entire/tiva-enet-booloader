################################################################################
# Automatically-generated file. Do not edit!
################################################################################

CG_TOOL_ROOT := /Applications/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.0.LTS

GEN_OPTS__FLAG := 
GEN_CMDS__FLAG := 

ORDERED_OBJS += \
"./boot_demo_emac_flash.obj" \
"./startup_ccs.obj" \
"./drivers/frame.obj" \
"./drivers/kentec320x240x16_ssd2119.obj" \
"./drivers/pinout.obj" \
"./utils/lwiplib.obj" \
"./utils/swupdate.obj" \
"./utils/ustdlib.obj" \
"../boot_demo_emac_flash_ccs.cmd" \
$(GEN_CMDS__FLAG) \
-llibc.a \
-l"/Users/ceylon/Code/TI/SW-TM4C-2.1.3.156/driverlib/ccs/Debug/driverlib.lib" \
-l"/Users/ceylon/Code/TI/SW-TM4C-2.1.3.156/grlib/ccs/Debug/grlib.lib" \

-include ../makefile.init

RM := rm -rf
RMDIR := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir_vars.mk
-include drivers/subdir_vars.mk
-include utils/subdir_vars.mk
-include subdir_rules.mk
-include drivers/subdir_rules.mk
-include utils/subdir_rules.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C55_DEPS)),)
-include $(C55_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
ifneq ($(strip $(S67_DEPS)),)
-include $(S67_DEPS)
endif
ifneq ($(strip $(S62_DEPS)),)
-include $(S62_DEPS)
endif
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(OPT_DEPS)),)
-include $(OPT_DEPS)
endif
ifneq ($(strip $(C??_DEPS)),)
-include $(C??_DEPS)
endif
ifneq ($(strip $(ASM_UPPER_DEPS)),)
-include $(ASM_UPPER_DEPS)
endif
ifneq ($(strip $(S??_DEPS)),)
-include $(S??_DEPS)
endif
ifneq ($(strip $(C64_DEPS)),)
-include $(C64_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(S64_DEPS)),)
-include $(S64_DEPS)
endif
ifneq ($(strip $(INO_DEPS)),)
-include $(INO_DEPS)
endif
ifneq ($(strip $(CLA_DEPS)),)
-include $(CLA_DEPS)
endif
ifneq ($(strip $(S55_DEPS)),)
-include $(S55_DEPS)
endif
ifneq ($(strip $(SV7A_DEPS)),)
-include $(SV7A_DEPS)
endif
ifneq ($(strip $(C62_DEPS)),)
-include $(C62_DEPS)
endif
ifneq ($(strip $(C67_DEPS)),)
-include $(C67_DEPS)
endif
ifneq ($(strip $(PDE_DEPS)),)
-include $(PDE_DEPS)
endif
ifneq ($(strip $(K_DEPS)),)
-include $(K_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(C43_DEPS)),)
-include $(C43_DEPS)
endif
ifneq ($(strip $(S43_DEPS)),)
-include $(S43_DEPS)
endif
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(SA_DEPS)),)
-include $(SA_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
EXE_OUTPUTS += \
boot_demo_emac_flash.out \

EXE_OUTPUTS__QUOTED += \
"boot_demo_emac_flash.out" \

BIN_OUTPUTS += \
boot_demo_emac_flash.bin \

BIN_OUTPUTS__QUOTED += \
"boot_demo_emac_flash.bin" \


# All Target
all: boot_demo_emac_flash.out

# Tool invocations
boot_demo_emac_flash.out: $(OBJS) $(CMD_SRCS) $(GEN_CMDS)
	@echo 'Building target: $@'
	@echo 'Invoking: ARM Linker'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.0.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 --abi=eabi -me -O2 --advice:power=all -g --gcc --define=ccs="ccs" --define=PART_TM4C129XNCZAD --define=TARGET_IS_TM4C129_RA0 --diag_wrap=off --diag_warning=225 --display_error_number --gen_func_subsections=on --ual -z -m"boot_demo_emac_flash_ccs.map" --heap_size=0 --stack_size=2048 -i"/Applications/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.0.LTS/lib" -i"/Applications/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.0.LTS/include" --reread_libs --display_error_number --diag_wrap=off --warn_sections --xml_link_info="boot_demo_emac_flash_linkInfo.xml" --rom_model -o "boot_demo_emac_flash.out" $(ORDERED_OBJS)
	@echo 'Finished building target: $@'
	@echo ' '
	@$(MAKE) --no-print-directory post-build

boot_demo_emac_flash.bin: $(EXE_OUTPUTS)
	@echo 'Invoking: ARM Hex Utility'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.0.LTS/bin/armhex"  -o "boot_demo_emac_flash.bin" $(EXE_OUTPUTS__QUOTED)
	@echo 'Finished building: $@'
	@echo ' '
	@$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	-$(RM) $(BIN_OUTPUTS__QUOTED)$(EXE_OUTPUTS__QUOTED)
	-$(RM) "boot_demo_emac_flash.obj" "startup_ccs.obj" "drivers/frame.obj" "drivers/kentec320x240x16_ssd2119.obj" "drivers/pinout.obj" "utils/lwiplib.obj" "utils/swupdate.obj" "utils/ustdlib.obj" 
	-$(RM) "boot_demo_emac_flash.d" "startup_ccs.d" "drivers/frame.d" "drivers/kentec320x240x16_ssd2119.d" "drivers/pinout.d" "utils/lwiplib.d" "utils/swupdate.d" "utils/ustdlib.d" 
	-@echo 'Finished clean'
	-@echo ' '

post-build:
	-"/Applications/ti/ccsv7/utils/tiobj2bin/tiobj2bin" "boot_demo_emac_flash.out" "boot_demo_emac_flash.bin" "/Applications/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.0.LTS/bin/armofd" "/Applications/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.0.LTS/bin/armhex" "/Applications/ti/ccsv7/utils/tiobj2bin/mkhex4bin"
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets

