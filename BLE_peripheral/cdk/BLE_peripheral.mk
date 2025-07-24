##
## Auto Generated makefile by CDK
## Do not modify this file, and any manual changes will be erased!!!   
##
## BuildSet
ProjectName            :=BLE_peripheral
ConfigurationName      :=BuildSet
WorkspacePath          :=./
ProjectPath            :=./
IntermediateDirectory  :=Obj
OutDir                 :=$(IntermediateDirectory)
User                   :=Administrator
Date                   :=23/07/2025
CDKPath                :=../../../../../../../../../C-Sky/CDK
ToolchainPath          :=D:/C-Sky/CDKRepo/Toolchain/XTGccElfNewlib/V3.1.0/R/
LinkerName             :=riscv64-unknown-elf-gcc
LinkerNameoption       :=
SIZE                   :=riscv64-unknown-elf-size
READELF                :=riscv64-unknown-elf-readelf
CHECKSUM               :=crc32
SharedObjectLinkerName :=
ObjectSuffix           :=.o
DependSuffix           :=.d
PreprocessSuffix       :=.i
DisassemSuffix         :=.asm
IHexSuffix             :=.ihex
BinSuffix              :=.bin
ExeSuffix              :=.elf
LibSuffix              :=.a
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
ElfInfoSwitch          :=-hlS
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
UnPreprocessorSwitch   :=-U
SourceSwitch           :=-c 
ObjdumpSwitch          :=-S
ObjcopySwitch          :=-O ihex
ObjcopyBinSwitch       :=-O binary
OutputFile             :=$(ProjectName)
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
PreprocessOnlyDisableLineSwitch   :=-P
ObjectsFileList        :=$(IntermediateDirectory)/BLE_peripheral.txt
MakeDirCommand         :=mkdir
LinkOptions            := -mcpu=e902m  -nostartfiles -Wl,--gc-sections -T"$(ProjectPath)/../../../components/core/cp800x_ble2g4_app.ld" -pipe 
LinkOtherFlagsOption   :=--specs=nano.specs -flto -Wl,-Map=$(ProjectPath)/Lst/$(OutputFile).map 
IncludePackagePath     :=
IncludeCPath           := $(IncludeSwitch).. $(IncludeSwitch)../../../components/ble/app $(IncludeSwitch)../../../components/ble/ota_service $(IncludeSwitch)../../../components/ble/service $(IncludeSwitch)../../../components/core/ $(IncludeSwitch)../../../components/core/riscv/E902 $(IncludeSwitch)../../../components/driver $(IncludeSwitch)../../../components/header $(IncludeSwitch)../../../components/libraries $(IncludeSwitch)../../../components/libraries/24g $(IncludeSwitch)../../../components/libraries/ble $(IncludeSwitch)../../../components/misc $(IncludeSwitch)../../../modules/hal_clock  
IncludeAPath           := $(IncludeSwitch).. $(IncludeSwitch)../../../components/ble/ota_service $(IncludeSwitch)../../../components/ble/service $(IncludeSwitch)../../../components/core/ $(IncludeSwitch)../../../components/core/riscv/E902 $(IncludeSwitch)../../../components/driver $(IncludeSwitch)../../../components/header $(IncludeSwitch)../../../components/libraries $(IncludeSwitch)../../../components/libraries/24g $(IncludeSwitch)../../../components/libraries/ble $(IncludeSwitch)../../../components/misc $(IncludeSwitch)../../../modules/hal_clock  
Libs                   :=
ArLibs                 := 
PackagesLibPath        :=
LibPath                :=$(LibraryPathSwitch)../../../components/libraries/ble/  $(PackagesLibPath) 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       :=riscv64-unknown-elf-ar rcu
CXX      :=riscv64-unknown-elf-g++
CC       :=riscv64-unknown-elf-gcc
AS       :=riscv64-unknown-elf-gcc
OBJDUMP  :=riscv64-unknown-elf-objdump
OBJCOPY  :=riscv64-unknown-elf-objcopy
CXXFLAGS :=-mcpu=e902m   $(PreprocessorSwitch)BLE_FOTA_EN=1  $(PreprocessorSwitch)BLE_MODE_SEL=1  $(PreprocessorSwitch)BLE_SLEEP_EN=1  -Os   -Wall -ffunction-sections -fdata-sections -flto -pipe 
CFLAGS   :=-mcpu=e902m   $(PreprocessorSwitch)BLE_FOTA_EN=1  $(PreprocessorSwitch)BLE_MODE_SEL=1  $(PreprocessorSwitch)BLE_SLEEP_EN=1  -Os   -Wall -ffunction-sections -fdata-sections -flto -pipe 
ASFLAGS  :=-mcpu=e902m  -Wa,-gdwarf-2 -ffunction-sections -fdata-sections -pipe 
PreprocessFlags  :=-mcpu=e902m   $(PreprocessorSwitch)BLE_FOTA_EN=1  $(PreprocessorSwitch)BLE_MODE_SEL=1  $(PreprocessorSwitch)BLE_SLEEP_EN=1  -Os   -Wall -ffunction-sections -fdata-sections -flto -pipe 


Objects0=$(IntermediateDirectory)/BLE_peripheral_main$(ObjectSuffix) $(IntermediateDirectory)/BLE_peripheral_app_main$(ObjectSuffix) $(IntermediateDirectory)/BLE_peripheral_app_isr$(ObjectSuffix) $(IntermediateDirectory)/hal_clock_hal_clock$(ObjectSuffix) $(IntermediateDirectory)/misc_log_dbg$(ObjectSuffix) $(IntermediateDirectory)/driver_driver_clkcal$(ObjectSuffix) $(IntermediateDirectory)/driver_driver_gpadc$(ObjectSuffix) $(IntermediateDirectory)/driver_driver_gpio$(ObjectSuffix) $(IntermediateDirectory)/driver_driver_iic$(ObjectSuffix) $(IntermediateDirectory)/driver_driver_spim$(ObjectSuffix) \
	$(IntermediateDirectory)/driver_driver_spis$(ObjectSuffix) $(IntermediateDirectory)/driver_driver_sys$(ObjectSuffix) $(IntermediateDirectory)/driver_driver_timer$(ObjectSuffix) $(IntermediateDirectory)/driver_driver_uart$(ObjectSuffix) $(IntermediateDirectory)/driver_driver_wdt$(ObjectSuffix) $(IntermediateDirectory)/driver_driver_flash$(ObjectSuffix) $(IntermediateDirectory)/ota_service_ble_ota_service$(ObjectSuffix) $(IntermediateDirectory)/service_ble_service$(ObjectSuffix) $(IntermediateDirectory)/app_ble_app$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all
all: $(IntermediateDirectory)/$(OutputFile)

$(IntermediateDirectory)/$(OutputFile):  $(Objects) Always_Link 
	$(LinkerName) $(OutputSwitch) $(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) $(LinkerNameoption) -Wl,-Map=$(ProjectPath)/Lst/$(OutputFile).map  @$(ObjectsFileList) $(LibraryPathSwitch)D:/AAwork_liuyuxiang/code/CP800X_SDKV1.0.7/SDK/sdk_CP800x_V108_20250627/sdk/components/libraries $(LibraryPathSwitch)D:/AAwork_liuyuxiang/code/CP800X_SDKV1.0.7/SDK/sdk_CP800x_V108_20250627/sdk/components/libraries/ble $(LibraryPathSwitch)D:/AAwork_liuyuxiang/code/CP800X_SDKV1.0.7/SDK/sdk_CP800x_V108_20250627/sdk/components/libraries/ble  -Wl,--whole-archive $(LibrarySwitch)startlib  $(LibrarySwitch)ble  $(LibrarySwitch)ble_base   -Wl,--no-whole-archive  $(LinkOptions) $(LibPath) $(Libs) $(LinkOtherFlagsOption)
	-@mv $(ProjectPath)/Lst/$(OutputFile).map $(ProjectPath)/Lst/$(OutputFile).temp && $(READELF) $(ElfInfoSwitch) $(ProjectPath)/Obj/$(OutputFile)$(ExeSuffix) > $(ProjectPath)/Lst/$(OutputFile).map && echo ====================================================================== >> $(ProjectPath)/Lst/$(OutputFile).map && cat $(ProjectPath)/Lst/$(OutputFile).temp >> $(ProjectPath)/Lst/$(OutputFile).map && rm -rf $(ProjectPath)/Lst/$(OutputFile).temp
	$(OBJCOPY) $(ObjcopySwitch) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)  $(ProjectPath)/Obj/$(OutputFile)$(IHexSuffix) 
	$(OBJDUMP) $(ObjdumpSwitch) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)  > $(ProjectPath)/Lst/$(OutputFile)$(DisassemSuffix) 
	@echo size of target:
	@$(SIZE) $(ProjectPath)$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@echo -n checksum value of target:  
	@$(CHECKSUM) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@BLE_peripheral.modify.bat $(IntermediateDirectory) $(OutputFile)$(ExeSuffix) 

Always_Link:


##
## Objects
##
$(IntermediateDirectory)/BLE_peripheral_main$(ObjectSuffix): ../main.c  
	$(CC) $(SourceSwitch) ../main.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/BLE_peripheral_main$(ObjectSuffix) -MF$(IntermediateDirectory)/BLE_peripheral_main$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/BLE_peripheral_main$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/BLE_peripheral_main$(PreprocessSuffix): ../main.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/BLE_peripheral_main$(PreprocessSuffix) ../main.c

$(IntermediateDirectory)/BLE_peripheral_app_main$(ObjectSuffix): ../app_main.c  
	$(CC) $(SourceSwitch) ../app_main.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/BLE_peripheral_app_main$(ObjectSuffix) -MF$(IntermediateDirectory)/BLE_peripheral_app_main$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/BLE_peripheral_app_main$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/BLE_peripheral_app_main$(PreprocessSuffix): ../app_main.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/BLE_peripheral_app_main$(PreprocessSuffix) ../app_main.c

$(IntermediateDirectory)/BLE_peripheral_app_isr$(ObjectSuffix): ../app_isr.c  
	$(CC) $(SourceSwitch) ../app_isr.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/BLE_peripheral_app_isr$(ObjectSuffix) -MF$(IntermediateDirectory)/BLE_peripheral_app_isr$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/BLE_peripheral_app_isr$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/BLE_peripheral_app_isr$(PreprocessSuffix): ../app_isr.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/BLE_peripheral_app_isr$(PreprocessSuffix) ../app_isr.c

$(IntermediateDirectory)/hal_clock_hal_clock$(ObjectSuffix): ../../../modules/hal_clock/hal_clock.c  
	$(CC) $(SourceSwitch) ../../../modules/hal_clock/hal_clock.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/hal_clock_hal_clock$(ObjectSuffix) -MF$(IntermediateDirectory)/hal_clock_hal_clock$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/hal_clock_hal_clock$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/hal_clock_hal_clock$(PreprocessSuffix): ../../../modules/hal_clock/hal_clock.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/hal_clock_hal_clock$(PreprocessSuffix) ../../../modules/hal_clock/hal_clock.c

$(IntermediateDirectory)/misc_log_dbg$(ObjectSuffix): ../../../components/misc/log_dbg.c  
	$(CC) $(SourceSwitch) ../../../components/misc/log_dbg.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/misc_log_dbg$(ObjectSuffix) -MF$(IntermediateDirectory)/misc_log_dbg$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/misc_log_dbg$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/misc_log_dbg$(PreprocessSuffix): ../../../components/misc/log_dbg.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/misc_log_dbg$(PreprocessSuffix) ../../../components/misc/log_dbg.c

$(IntermediateDirectory)/driver_driver_clkcal$(ObjectSuffix): ../../../components/driver/driver_clkcal.c  
	$(CC) $(SourceSwitch) ../../../components/driver/driver_clkcal.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/driver_driver_clkcal$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_driver_clkcal$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/driver_driver_clkcal$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/driver_driver_clkcal$(PreprocessSuffix): ../../../components/driver/driver_clkcal.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_driver_clkcal$(PreprocessSuffix) ../../../components/driver/driver_clkcal.c

$(IntermediateDirectory)/driver_driver_gpadc$(ObjectSuffix): ../../../components/driver/driver_gpadc.c  
	$(CC) $(SourceSwitch) ../../../components/driver/driver_gpadc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/driver_driver_gpadc$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_driver_gpadc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/driver_driver_gpadc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/driver_driver_gpadc$(PreprocessSuffix): ../../../components/driver/driver_gpadc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_driver_gpadc$(PreprocessSuffix) ../../../components/driver/driver_gpadc.c

$(IntermediateDirectory)/driver_driver_gpio$(ObjectSuffix): ../../../components/driver/driver_gpio.c  
	$(CC) $(SourceSwitch) ../../../components/driver/driver_gpio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/driver_driver_gpio$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_driver_gpio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/driver_driver_gpio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/driver_driver_gpio$(PreprocessSuffix): ../../../components/driver/driver_gpio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_driver_gpio$(PreprocessSuffix) ../../../components/driver/driver_gpio.c

$(IntermediateDirectory)/driver_driver_iic$(ObjectSuffix): ../../../components/driver/driver_iic.c  
	$(CC) $(SourceSwitch) ../../../components/driver/driver_iic.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/driver_driver_iic$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_driver_iic$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/driver_driver_iic$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/driver_driver_iic$(PreprocessSuffix): ../../../components/driver/driver_iic.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_driver_iic$(PreprocessSuffix) ../../../components/driver/driver_iic.c

$(IntermediateDirectory)/driver_driver_spim$(ObjectSuffix): ../../../components/driver/driver_spim.c  
	$(CC) $(SourceSwitch) ../../../components/driver/driver_spim.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/driver_driver_spim$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_driver_spim$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/driver_driver_spim$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/driver_driver_spim$(PreprocessSuffix): ../../../components/driver/driver_spim.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_driver_spim$(PreprocessSuffix) ../../../components/driver/driver_spim.c

$(IntermediateDirectory)/driver_driver_spis$(ObjectSuffix): ../../../components/driver/driver_spis.c  
	$(CC) $(SourceSwitch) ../../../components/driver/driver_spis.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/driver_driver_spis$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_driver_spis$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/driver_driver_spis$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/driver_driver_spis$(PreprocessSuffix): ../../../components/driver/driver_spis.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_driver_spis$(PreprocessSuffix) ../../../components/driver/driver_spis.c

$(IntermediateDirectory)/driver_driver_sys$(ObjectSuffix): ../../../components/driver/driver_sys.c  
	$(CC) $(SourceSwitch) ../../../components/driver/driver_sys.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/driver_driver_sys$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_driver_sys$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/driver_driver_sys$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/driver_driver_sys$(PreprocessSuffix): ../../../components/driver/driver_sys.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_driver_sys$(PreprocessSuffix) ../../../components/driver/driver_sys.c

$(IntermediateDirectory)/driver_driver_timer$(ObjectSuffix): ../../../components/driver/driver_timer.c  
	$(CC) $(SourceSwitch) ../../../components/driver/driver_timer.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/driver_driver_timer$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_driver_timer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/driver_driver_timer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/driver_driver_timer$(PreprocessSuffix): ../../../components/driver/driver_timer.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_driver_timer$(PreprocessSuffix) ../../../components/driver/driver_timer.c

$(IntermediateDirectory)/driver_driver_uart$(ObjectSuffix): ../../../components/driver/driver_uart.c  
	$(CC) $(SourceSwitch) ../../../components/driver/driver_uart.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/driver_driver_uart$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_driver_uart$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/driver_driver_uart$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/driver_driver_uart$(PreprocessSuffix): ../../../components/driver/driver_uart.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_driver_uart$(PreprocessSuffix) ../../../components/driver/driver_uart.c

$(IntermediateDirectory)/driver_driver_wdt$(ObjectSuffix): ../../../components/driver/driver_wdt.c  
	$(CC) $(SourceSwitch) ../../../components/driver/driver_wdt.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/driver_driver_wdt$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_driver_wdt$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/driver_driver_wdt$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/driver_driver_wdt$(PreprocessSuffix): ../../../components/driver/driver_wdt.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_driver_wdt$(PreprocessSuffix) ../../../components/driver/driver_wdt.c

$(IntermediateDirectory)/driver_driver_flash$(ObjectSuffix): ../../../components/driver/driver_flash.c  
	$(CC) $(SourceSwitch) ../../../components/driver/driver_flash.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/driver_driver_flash$(ObjectSuffix) -MF$(IntermediateDirectory)/driver_driver_flash$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/driver_driver_flash$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/driver_driver_flash$(PreprocessSuffix): ../../../components/driver/driver_flash.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/driver_driver_flash$(PreprocessSuffix) ../../../components/driver/driver_flash.c

$(IntermediateDirectory)/ota_service_ble_ota_service$(ObjectSuffix): ../../../components/ble/ota_service/ble_ota_service.c  
	$(CC) $(SourceSwitch) ../../../components/ble/ota_service/ble_ota_service.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/ota_service_ble_ota_service$(ObjectSuffix) -MF$(IntermediateDirectory)/ota_service_ble_ota_service$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/ota_service_ble_ota_service$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/ota_service_ble_ota_service$(PreprocessSuffix): ../../../components/ble/ota_service/ble_ota_service.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/ota_service_ble_ota_service$(PreprocessSuffix) ../../../components/ble/ota_service/ble_ota_service.c

$(IntermediateDirectory)/service_ble_service$(ObjectSuffix): ../../../components/ble/service/ble_service.c  
	$(CC) $(SourceSwitch) ../../../components/ble/service/ble_service.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/service_ble_service$(ObjectSuffix) -MF$(IntermediateDirectory)/service_ble_service$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/service_ble_service$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/service_ble_service$(PreprocessSuffix): ../../../components/ble/service/ble_service.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/service_ble_service$(PreprocessSuffix) ../../../components/ble/service/ble_service.c

$(IntermediateDirectory)/app_ble_app$(ObjectSuffix): ../../../components/ble/app/ble_app.c  
	$(CC) $(SourceSwitch) ../../../components/ble/app/ble_app.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/app_ble_app$(ObjectSuffix) -MF$(IntermediateDirectory)/app_ble_app$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/app_ble_app$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/app_ble_app$(PreprocessSuffix): ../../../components/ble/app/ble_app.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/app_ble_app$(PreprocessSuffix) ../../../components/ble/app/ble_app.c


-include $(IntermediateDirectory)/*$(DependSuffix)
