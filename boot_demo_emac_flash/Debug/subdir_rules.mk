################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
boot_demo_emac_flash.obj: ../boot_demo_emac_flash.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.0.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 --abi=eabi -me -O2 --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.0.LTS/include" --include_path="/Users/ceylon/workspace_v7/boot_demo_emac_flash" --include_path="/Users/ceylon/Code/TI/SW-TM4C-2.1.3.156/examples/boards/dk-tm4c129x" --include_path="/Users/ceylon/Code/TI/SW-TM4C-2.1.3.156" --include_path="/Users/ceylon/Code/TI/SW-TM4C-2.1.3.156/third_party" --include_path="/Users/ceylon/Code/TI/SW-TM4C-2.1.3.156/third_party/bget" --include_path="/Users/ceylon/Code/TI/SW-TM4C-2.1.3.156/third_party/lwip-1.4.1/src/include" --include_path="/Users/ceylon/Code/TI/SW-TM4C-2.1.3.156/third_party/lwip-1.4.1/src/include/ipv4" --include_path="/Users/ceylon/Code/TI/SW-TM4C-2.1.3.156/third_party/lwip-1.4.1/apps" --include_path="/Users/ceylon/Code/TI/SW-TM4C-2.1.3.156/third_party/lwip-1.4.1/ports/tiva-tm4c129/include" --advice:power=all -g --gcc --define=ccs="ccs" --define=PART_TM4C129XNCZAD --define=TARGET_IS_TM4C129_RA0 --diag_wrap=off --diag_warning=225 --display_error_number --gen_func_subsections=on --ual --preproc_with_compile --preproc_dependency="boot_demo_emac_flash.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '

startup_ccs.obj: ../startup_ccs.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Compiler'
	"/Applications/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.0.LTS/bin/armcl" -mv7M4 --code_state=16 --float_support=FPv4SPD16 --abi=eabi -me -O2 --include_path="/Applications/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.0.LTS/include" --include_path="/Users/ceylon/workspace_v7/boot_demo_emac_flash" --include_path="/Users/ceylon/Code/TI/SW-TM4C-2.1.3.156/examples/boards/dk-tm4c129x" --include_path="/Users/ceylon/Code/TI/SW-TM4C-2.1.3.156" --include_path="/Users/ceylon/Code/TI/SW-TM4C-2.1.3.156/third_party" --include_path="/Users/ceylon/Code/TI/SW-TM4C-2.1.3.156/third_party/bget" --include_path="/Users/ceylon/Code/TI/SW-TM4C-2.1.3.156/third_party/lwip-1.4.1/src/include" --include_path="/Users/ceylon/Code/TI/SW-TM4C-2.1.3.156/third_party/lwip-1.4.1/src/include/ipv4" --include_path="/Users/ceylon/Code/TI/SW-TM4C-2.1.3.156/third_party/lwip-1.4.1/apps" --include_path="/Users/ceylon/Code/TI/SW-TM4C-2.1.3.156/third_party/lwip-1.4.1/ports/tiva-tm4c129/include" --advice:power=all -g --gcc --define=ccs="ccs" --define=PART_TM4C129XNCZAD --define=TARGET_IS_TM4C129_RA0 --diag_wrap=off --diag_warning=225 --display_error_number --gen_func_subsections=on --ual --preproc_with_compile --preproc_dependency="startup_ccs.d" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '


