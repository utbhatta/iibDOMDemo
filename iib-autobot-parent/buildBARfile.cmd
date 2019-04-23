@REM *****************************************************************
@REM
@REM IBM Confidential
@REM
@REM Licensed Materials - Property of IBM
@REM
@REM (C) Copyright IBM Corp. 2017 All Rights Reserved.
@REM
@REM The source code for this program is not published or otherwise
@REM divested of its trade secrets, irrespective of what has been
@REM deposited with the U.S. Copyright Office.
@REM
@REM *****************************************************************

@echo OFF
if NOT defined ECHO_FLAG set ECHO_FLAG=OFF
@echo %ECHO_FLAG%

SETLOCAL
:init
:check
	if "%IIB_HOME%" == "" @echo %0 error: environment variable 'IIB_HOME' is not defined : Fix then try again.& goto end
	if NOT exist "%IIB_HOME%\server\bin\mqsipackagebar.bat" @echo %0 error: required file '%IIB_HOME%\server\bin\mqsipackagebar.bat' is missing : Fix then try again.& goto end

:main
	@echo call "%IIB_HOME%\server\bin\mqsiprofile.cmd"
	call "%IIB_HOME%\server\bin\mqsiprofile.cmd"

	@echo call "%IIB_HOME%\server\bin\mqsipackagebar.bat" %*
	call "%IIB_HOME%\server\bin\mqsipackagebar.bat" %*

:done
:end
ENDLOCAL
