@echo off

for /f "eol=[ delims=" %%a in (ini.cfg) do (
    set "%%a"
)

set modname=off_plus_reforged_patch
set version=1.3

echo.
echo Creating temporary directory...
echo.

@REM  /i means create tmp\scripts if it's not there, /e means copy subdirectories even if empty, /f outputs full src/dst paths (if you want), /y means overwrite, /c ignores errors
mkdir "%~dp0\tmp_scripts"
xcopy "%~dp0\scripts\!mods_preload\mod_p_offp_reforged*" "%~dp0\tmp_scripts\!mods_preload" /i /e /y

cd "%modkitpath%"
CALL "%modkitpath%\masscompile.bat" "%~dp0\tmp_scripts"

REM %~dp0 refers to the drive letter + path of where THIS batch file lives

echo.
echo Copying files to dist\scripts
echo.

REM after build, copy scripts folder to dist\scripts folder. /i means create dist\scripts if it's not there, /e means copy subdirectories even if empty, /f outputs full src/dst paths (if you want), /y means overwrite, /c ignores errors
xcopy "%~dp0\tmp_scripts" "%~dp0\dist\scripts" /i /e /y /c

echo %~dp0

echo.
echo Removing temporary directory...
echo.

REM Remove tmp_scripts directory
rmdir "%~dp0\tmp_scripts" /s /q

echo.
echo Removing uncompiled source from dist...
echo.

REM Remove uncompiled source from dist\scripts directory
for /r "%~dp0\dist\scripts" %%f in (*.nut) do del /f /q "%%f"

echo.
echo Packaging mod into .zip...
echo.

REM Requires Powershell 5.0 / .NET Framework 4.x (some claim 4, some claim 4.5, some claim 4.8)
powershell.exe -nologo -noprofile -command "& { Compress-Archive -Force -Path '%~dp0\dist\scripts' -DestinationPath '%~dp0\dist\%modname%_%version%.zip' }"

echo.
echo Cleaning up dist\scripts
echo.

REM Remove dist\scripts directory
rmdir "%~dp0\dist\scripts" /s /q

echo Done.

pause
