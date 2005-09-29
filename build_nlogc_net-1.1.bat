@echo off
set DOTNETSDK_DIR=C:\Program Files\Microsoft Visual Studio .NET 2003\SDK\v1.1
set VS_DIR=C:\Program Files\Microsoft Visual Studio .NET 2003
set VC_DIR=%VS_DIR%\VC7
set FRAMEWORK_DIR=%WINDIR%\Microsoft.NET\Framework\v1.1.4322
set NLOG_BASE_DIR=%CD%

set PATH=%VC_DIR%\bin;%VS_DIR%\Common7\ide;%PATH%
set INCLUDE=%VC_DIR%\include
set LIB=%VC_DIR%\lib;%DOTNETSDK_DIR%\Lib
set NLOG_BIN_DIR=%1
set SOURCE_DIR=src\NLogC
set OUTPUT_DIR=%2\bin\net-1.1
set OUTPUT_FILE=NLogC

mkdir %OUTPUT_DIR%

cl /nologo /O2 /AI %NLOG_BIN_DIR% /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_USRDLL" /D "NLOGC_EXPORTS" /D "_WINDLL" /D "_MBCS" /FD /EHsc /MT /GS /W3 /c /Wp64 /Zi /clr /TP /FU "%FRAMEWORK_DIR%\mscorlib.dll" /FU "%NLOG_BIN_DIR%\NLog.dll" /Fo%OUTPUT_DIR%\%OUTPUT_FILE%.obj %SOURCE_DIR%\NLogC.cpp
link /nologo /OUT:"%OUTPUT_DIR%\%OUTPUT_FILE%.dll" /INCREMENTAL:NO /NOLOGO /DLL /DEBUG /PDB:"%OUTPUT_DIR%\%OUTPUT_FILE%.pdb" /SUBSYSTEM:WINDOWS /OPT:REF /OPT:ICF /IMPLIB:"%OUTPUT_DIR%\%OUTPUT_FILE%.lib" /MACHINE:X86 /FIXED:No /NOENTRY /NODEFAULTLIB:nochkclr.obj /INCLUDE:__DllMainCRTStartup@12 %OUTPUT_DIR%\%OUTPUT_FILE%.obj
del "%OUTPUT_DIR%\%OUTPUT_FILE%.obj"
