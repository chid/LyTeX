@echo off

rem :: texname=MiKTeX or texname=TeXLive
rem set  texname=%~n0
rem :: echo %texname%

set mainver=1.6s
set mainbin=LyTeX-%mainver%-bin.exe

set Path=%~dp0somebin;%Path%
set downdir=%~dp0down

::if exist %~dp0lyxidea.txt goto buildnsi

:maketidy

if not exist %~dp0lyxidea.txt call l-down.bat
if not exist %~dp0lyxidea.txt call l-make.bat
call l-tidy.bat

:buildnsi

::if not exist %~dp0done\%lytexbin% (
call "%~dp0nsis\makensis.exe" %~dp0somensi\LyX.nsi
call "%~dp0nsis\makensis.exe" %~dp0somensi\TeXworks.nsi
call "%~dp0nsis\makensis.exe" %~dp0somensi\Setup.nsi
call "%~dp0nsis\makensis.exe" %~dp0somensi\LyTeX.nsi
::)

echo All are done!

::pause
