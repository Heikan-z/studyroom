@echo off
rem #
rem # COPYRIGHT NOTICE
rem # Copyright (C) 2017-2020 Xilinx, Inc. All Rights Reserved.
rem # 
set XMC_EXIT=

setlocal enableextensions enabledelayedexpansion

set XMC_ARGS_FUNCTION=
rem #
rem # Set OS architecture
rem #
set XMC_OS_ARCH=32
if [%PROCESSOR_ARCHITECTURE%] == [x86] (
	if defined PROCESSOR_ARCHITEW6432 (
		set XMC_OS_ARCH=64
	)
) else (
	if defined PROCESSOR_ARCHITECTURE (
		set XMC_OS_ARCH=64
	)
)
set XMC_PLATFORM=win%XMC_OS_ARCH%
set XMC_OPT_EXT=.o

rem #
rem # Set XMC_PRODUCT_ROOT, XMC_BIN_DIR, XMC_SIMULINK_DIR.
rem #
rem # XMC_BIN_DIR      - is the absolute path to the directory this script
rem #		   	was called from.
rem # XMC_PRODUCT_ROOT - is the absolute path to the directory above the
rem # 			product bin directory (XMC_BIN_DIR) 
rem # XMC_SIMULINK_DIR -	is the absolute path to the simulink directory
rem # XMC_HTMLHELP_DIR -	is the absolute path to the html help directory
rem #
set XMC_BIN_DIR=%~dp0
rem # Remove trailing '/'
set XMC_BIN_DIR=%XMC_BIN_DIR:~0,-1%
rem # Convert '\' to '/'
set XMC_BIN_DIR=%XMC_BIN_DIR:\=/%
call :DIRNAME "%XMC_BIN_DIR%" XMC_PRODUCT_ROOT
set XILINX_MODEL_COMPOSER=%XMC_PRODUCT_ROOT%
set XMC_SIMULINK_DIR=%XMC_PRODUCT_ROOT%/simulink
set XMC_HTMLHELP_DIR=%XMC_PRODUCT_ROOT%/doc/help/xmc

rem #
set XMC_CHECK_PROG=True

call "%XMC_BIN_DIR%/modelcomposerArgs.bat" %*

rem #
rem # Set the library load path. On Windows this is %PATH%
rem # Add Model Composer binary location to path
rem #
set XMC_LIB_DIR=%XMC_PRODUCT_ROOT%/lib/%XMC_PLATFORM%%XMC_OPT_EXT%
if not defined PATH (
	set PATH=%XMC_BIN_DIR%;%XMC_LIB_DIR%
) else (
	set PATH=%XMC_BIN_DIR%;%XMC_LIB_DIR%;!PATH!
)

rem #
rem # When XMC_EXIT is defined short circuit and exit.
rem # The batch command 'exit' should be avoided as it will cause the 
rem # cmd.exe which invoked this script to exit.
rem #
if not defined XMC_EXIT (
	if [%XMC_VERBOSE%] == [True] (
	echo      **** ENVIRONMENT DEBUG INFO ****
	echo        XILINX_VIVADO: "%XILINX_VIVADO%"
	echo           XMC_BIN_DIR: "%XMC_BIN_DIR%"
	echo           XMC_LIB_DIR: "%XMC_LIB_DIR%"
	echo      XMC_SIMULINK_DIR: "%XMC_SIMULINK_DIR%"
	echo      XMC_HTMLHELP_DIR: "%XMC_HTMLHELP_DIR%"
	echo              XMC_PROG: "%XMC_PROG%"
		if exist "%XMC_JAVAROOT%" (
			echo         XMC_JAVAROOT: "%XMC_JAVAROOT%"
		)
	echo                 PATH: "!PATH!"
	)
	if [%XMC_CHECK_PROG%] == [True] (
		if not exist "%XMC_PROG%" (
			if [%XMC_PLATFORM%] == [win64] (
				if defined XMC_PROG (
					echo ERROR: Could not find 64-bit MATLAB executable.
					echo ERROR: '%XMC_PROG%' does not exist.
				)
			) else (
				if defined XMC_PROG (
					echo ERROR: Could not find 32-bit MATLAB executable.
					echo ERROR: '%XMC_PROG%' does not exist.
				)
				if not defined XMC_SUPPORT_32 (
					if [%XMC_OS_ARCH%] == [64] (
						echo ERROR: -m32 switch is not supported.
					) else (
						echo ERROR: 32-bit platform is not supported.
					)
				)
			)
			exit /b 1
		)
	)

	call "%XMC_BIN_DIR%/modelcomposerArgs.bat" %XMC_ARGS%  
)
endlocal
exit /b %ERRORLEVEL%
goto :EOF


rem #
rem # Mimic Unix dirname where the dirname of %npath% will be stored in %rdir%
rem #
:DIRNAME %npath% %rdir%
	set _rdir=%~dp1
	set _rdir=%_rdir:~0,-1%
	set _rdir=%_rdir:\=/%
	set %2=%_rdir%
	set _rdir=
	goto :EOF


