@echo off
set ARCH=32
IF NOT DEFINED IS_ENV_READY (
    SET IS_ENV_READY=1
    CALL "%VSINSTALLDIR%\VC\Auxiliary\Build\vcvars%ARCH%.bat"
)
@echo off
setlocal EnableDelayedExpansion

:: Set compiler tools
set CC=cl
set AR=lib
set RM=del

:: Set compiler flags
set CFLAGS=/nologo /W4 /O2 /D_WIN32_WINNT=0x0501

:: Clean any previous build
%RM% *.obj *.lib *.exe 2>nul

:: Compile source files
%CC% /c %CFLAGS% libntldd.c
if %ERRORLEVEL% neq 0 goto :error

%CC% /c %CFLAGS% ntldd.c
if %ERRORLEVEL% neq 0 goto :error

:: Create library
%AR% /OUT:libntldd.lib libntldd.obj
if %ERRORLEVEL% neq 0 goto :error

:: Link executable
%CC% %CFLAGS% ntldd.obj libntldd.lib imagehlp.lib /Fe:ntldd.exe
if %ERRORLEVEL% neq 0 goto :error

:: Clean any previous build
%RM% *.obj *.lib 2>nul

echo Build completed successfully!
goto :end

:error
echo Build failed with error %ERRORLEVEL%
exit /b %ERRORLEVEL%

:end