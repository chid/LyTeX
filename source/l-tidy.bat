@echo off
::set PROMPT=# $G
set PROMPT=# 

set name=MiKTeX
::set name=TeXLive

cd LyTeX

rem ------------------------------------------

cd LyX
::echo %cd%

del /q lyx.usb
del /q temp.usb

del /q Uninstall-LyX.exe

rem rmdir /s /q Resources\doc\ca
rem rmdir /s /q Resources\doc\cs
rem rmdir /s /q Resources\doc\da
rem rmdir /s /q Resources\doc\de
rem rmdir /s /q Resources\doc\es
rem rmdir /s /q Resources\doc\eu
rem rmdir /s /q Resources\doc\fr
rem rmdir /s /q Resources\doc\gl
rem rmdir /s /q Resources\doc\he
rem rmdir /s /q Resources\doc\hu
rem rmdir /s /q Resources\doc\it
rem rmdir /s /q Resources\doc\ja
rem rmdir /s /q Resources\doc\nb
rem rmdir /s /q Resources\doc\nl
rem rmdir /s /q Resources\doc\pl
rem rmdir /s /q Resources\doc\pt
rem rmdir /s /q Resources\doc\ro
rem rmdir /s /q Resources\doc\ru
rem rmdir /s /q Resources\doc\sk
rem rmdir /s /q Resources\doc\sl
rem rmdir /s /q Resources\doc\sv
rem rmdir /s /q Resources\doc\uk

rem cd Resources\examples
rem for /D %%a in (*) do (
rem     if %%a neq en if %%a neq zh_CN if %%a neq zh_TW (
rem     rmdir /s /q %%a
rem     )
rem )
rem cd ..\..

rem cd Resources\locale
rem for /D %%a in (*) do (
rem     if %%a neq en if %%a neq zh_CN if %%a neq zh_TW (
rem     rmdir /s /q %%a
rem     )
rem )
rem cd ..\..

del /q python\Lib\*.pyc

rmdir /s /q local
xcopy /e/i/y %~dp0somelyx .

rem --------------------------------------------------

::cd ..\Common
::rmdir /s /q  download

:: ===================================================

if "%buildtex%"=="texlive" ( goto tidylive ) else ( goto tidymik )

::==================== MiKTeX ========================
:tidymik

cd ..\MiKTeX

rmdir /s /q texmf\doc
rmdir /s /q texmf\source

rmdir /s /q texmf\fonts\pk
rmdir /s /q texmf-local\fonts\pk
::rmdir /s /q texmf-dist\fonts\pk
rmdir /s /q texmf-var\fonts\pk

del /q texmf\fonts\cache\*
del /q texmf-local\fonts\cache\*
::del /q texmf-dist\fonts\cache\*
del /q texmf-var\fonts\cache\*

::rmdir /s /q texmf-var\web2c
rmdir /s /q temp

rem TeXworks
xcopy /e/i/y %~dp0sometex\basic-tw\TUG texmf-local\TUG

texmf\miktex\bin\texhash.exe

goto tidyend

::==================== TeXLive ========================
:tidylive

cd ..\TeXLive

rmdir /s /q texmf\fonts\pk
rmdir /s /q texmf-local\fonts\pk
rmdir /s /q texmf-dist\fonts\pk
rmdir /s /q texmf-var\fonts\pk

del /q texmf\fonts\cache\*
del /q texmf-local\fonts\cache\*
del /q texmf-dist\fonts\cache\*
del /q texmf-var\fonts\cache\*

del /q texmf\ls-R
del /q texmf-local\ls-R
del /q texmf-dist\ls-R
del /q texmf-var\ls-R

rmdir /s /q texmf-var\web2c
rmdir /s /q temp

bin\win32\texhash.exe

rem ------------------------------------------

cd ..\TexLive\tlpkg\texworks

rmdir /s /q  templates
xcopy /e/i/y %~dp0sometex\basic-tw .

rmdir /s /q  completion
rmdir /s /q  translations

goto tidyend

::==================== The End ======================== 
:tidyend

::pause

