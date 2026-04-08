#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/micro_MAC_final_project_v001.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/micro_MAC_final_project_v001.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=MAC_main_v1.c MAC_lcdLib_v1.c MAC_asmLib_v1.s MAC_soilSensorLib.c MAC_pumpLib.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/MAC_main_v1.o ${OBJECTDIR}/MAC_lcdLib_v1.o ${OBJECTDIR}/MAC_asmLib_v1.o ${OBJECTDIR}/MAC_soilSensorLib.o ${OBJECTDIR}/MAC_pumpLib.o
POSSIBLE_DEPFILES=${OBJECTDIR}/MAC_main_v1.o.d ${OBJECTDIR}/MAC_lcdLib_v1.o.d ${OBJECTDIR}/MAC_asmLib_v1.o.d ${OBJECTDIR}/MAC_soilSensorLib.o.d ${OBJECTDIR}/MAC_pumpLib.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/MAC_main_v1.o ${OBJECTDIR}/MAC_lcdLib_v1.o ${OBJECTDIR}/MAC_asmLib_v1.o ${OBJECTDIR}/MAC_soilSensorLib.o ${OBJECTDIR}/MAC_pumpLib.o

# Source Files
SOURCEFILES=MAC_main_v1.c MAC_lcdLib_v1.c MAC_asmLib_v1.s MAC_soilSensorLib.c MAC_pumpLib.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/micro_MAC_final_project_v001.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ64GA002
MP_LINKER_FILE_OPTION=,--script=p24FJ64GA002.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/MAC_main_v1.o: MAC_main_v1.c  .generated_files/flags/default/7bcc4132c4e935448cc8bf32c4a7a96d3fb48e0a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MAC_main_v1.o.d 
	@${RM} ${OBJECTDIR}/MAC_main_v1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MAC_main_v1.c  -o ${OBJECTDIR}/MAC_main_v1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MAC_main_v1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/MAC_lcdLib_v1.o: MAC_lcdLib_v1.c  .generated_files/flags/default/19107dfc07d75f0a59c903937632109b5a22e095 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MAC_lcdLib_v1.o.d 
	@${RM} ${OBJECTDIR}/MAC_lcdLib_v1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MAC_lcdLib_v1.c  -o ${OBJECTDIR}/MAC_lcdLib_v1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MAC_lcdLib_v1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/MAC_soilSensorLib.o: MAC_soilSensorLib.c  .generated_files/flags/default/edbb45298cad8c6afbd7a883d663be6d2fa6985a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MAC_soilSensorLib.o.d 
	@${RM} ${OBJECTDIR}/MAC_soilSensorLib.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MAC_soilSensorLib.c  -o ${OBJECTDIR}/MAC_soilSensorLib.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MAC_soilSensorLib.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/MAC_pumpLib.o: MAC_pumpLib.c  .generated_files/flags/default/346dbadc4e6b1b5e854aa39aee4cd19cfdee2338 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MAC_pumpLib.o.d 
	@${RM} ${OBJECTDIR}/MAC_pumpLib.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MAC_pumpLib.c  -o ${OBJECTDIR}/MAC_pumpLib.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MAC_pumpLib.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/MAC_main_v1.o: MAC_main_v1.c  .generated_files/flags/default/f8aa26a38c6a4e0949d812f37f30d067b64c0ab8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MAC_main_v1.o.d 
	@${RM} ${OBJECTDIR}/MAC_main_v1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MAC_main_v1.c  -o ${OBJECTDIR}/MAC_main_v1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MAC_main_v1.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/MAC_lcdLib_v1.o: MAC_lcdLib_v1.c  .generated_files/flags/default/617425ea96c0bc0c4ec66e4fda2afba2feb7cc71 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MAC_lcdLib_v1.o.d 
	@${RM} ${OBJECTDIR}/MAC_lcdLib_v1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MAC_lcdLib_v1.c  -o ${OBJECTDIR}/MAC_lcdLib_v1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MAC_lcdLib_v1.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/MAC_soilSensorLib.o: MAC_soilSensorLib.c  .generated_files/flags/default/c839c0470280d84c23853305fba33af44f87848f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MAC_soilSensorLib.o.d 
	@${RM} ${OBJECTDIR}/MAC_soilSensorLib.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MAC_soilSensorLib.c  -o ${OBJECTDIR}/MAC_soilSensorLib.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MAC_soilSensorLib.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/MAC_pumpLib.o: MAC_pumpLib.c  .generated_files/flags/default/bf8c6fd7d68bb7b8f795519bcad4c4173c6d9c1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MAC_pumpLib.o.d 
	@${RM} ${OBJECTDIR}/MAC_pumpLib.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  MAC_pumpLib.c  -o ${OBJECTDIR}/MAC_pumpLib.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MAC_pumpLib.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/MAC_asmLib_v1.o: MAC_asmLib_v1.s  .generated_files/flags/default/c249c3580f95253617e0ee5763f0a632796ef7f2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MAC_asmLib_v1.o.d 
	@${RM} ${OBJECTDIR}/MAC_asmLib_v1.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  MAC_asmLib_v1.s  -o ${OBJECTDIR}/MAC_asmLib_v1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/MAC_asmLib_v1.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/MAC_asmLib_v1.o: MAC_asmLib_v1.s  .generated_files/flags/default/21a01ed4ba8744059a14dce3d0809e033fb2b2ff .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MAC_asmLib_v1.o.d 
	@${RM} ${OBJECTDIR}/MAC_asmLib_v1.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  MAC_asmLib_v1.s  -o ${OBJECTDIR}/MAC_asmLib_v1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/MAC_asmLib_v1.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/micro_MAC_final_project_v001.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/micro_MAC_final_project_v001.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/micro_MAC_final_project_v001.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/micro_MAC_final_project_v001.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/micro_MAC_final_project_v001.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
