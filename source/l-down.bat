@echo off

set downdir=%~dp0download

set Path=%~dp0somebin;%Path%

::==================== LyX ========================
:downlyx

set lyxver=1.6.5
set lyxpath=ftp://ftp.lyx.org/pub/lyx/bin/%lyxver%
set lyxname=LyX-%lyxver%-1-Installer.exe

echo.
echo Downloading LyX installer...

if not exist %downdir%\%lyxname% (
wget -nv -N -P %downdir% %lyxpath%/%lyxname%
)

goto downmik
::goto downlive

::==================== MiKTeX ========================
:downmik

set mknet=ftp://ftp.ctex.org/mirrors/CTAN/systems/win32/miktex/setup
::set mkbin=miktex-portable-2.8.3582.exe
set mkbin=miktex-portable.exe

echo.
echo Downloading MiKTeX installer...

:: --retr-symlinks option is used for ftp connection
if not exist %downdir%\%mkbin% (
wget --retr-symlinks -nv -N -P  %downdir% %mknet%/%mkbin%
)

::pause

goto downend

::==================== TeXLive ========================
:downlive

set tlnet=ftp://ftp.ctex.org/mirrors/CTAN/systems/texlive/tlnet/archive

setlocal enabledelayedexpansion

goto downcoll

:allcolls

del collects.txt 2>nul

for /f "tokens=1,2*" %%i in (texlive.tlpdb) do (
    if %%i == name (
        for /f "tokens=1* delims=-" %%a in ("%%j") do (
            if %%a == collection (
            echo %%a %%b
            echo %%a %%b >>collects.txt
            )
        )
    ) 
)

:findcoll

find /n "name collection-basic" texlive.tlpdb

:downcoll

::pause

if not exist texlive mkdir texlive

set cdir=%~dp0sometex\tlcolls

for /r %cdir% %%a in (*.txt) do (
    echo handling %%a...
    set colout=%%a
    set colout=!colout:.txt=!
    set colout=!colout:tlcolls=texlive!
    echo output directory is !colout!
    ::pause
    if not exist !colout! mkdir !colout!
    set downlist=
    for /f "tokens=1*" %%i in (%%a) do (
        if %%i == depend (
            for /f "tokens=1* delims=-" %%u in ("%%j") do (
                if %%u equ bin (
                    set downlist=!downlist!%%j.tar.x?,%%j.win32.tar.x?,
                    ) else if %%u neq collection (
                    set downlist=!downlist!%%j.tar.x?,
                )
                
            )
        ) 
    )
    for /f "tokens=2 delims=-" %%e in ("!colout!") do set collname=%%e
    echo !collname!
    rem downlist should NOT end with comma!
    set downlist=!downlist!collection-!collname!.tar.x?
    :: echo !downlist!
    wget -r -nv -np -nd -N -P !colout! -A !downlist! %tlnet%
    echo.
)

:: Since string variables in dos script have length limitation,
:: We have to handle c-latexextra downloadding as two part.
:: http://support.microsoft.com/kb/830473/en-us/

set colout=%~dp0texlive\c-latexextra
echo output directory is !colout!

set downlist=
for /f "tokens=1*" %%i in (%cdir%\c-latexextra.a-l) do (
    if %%i == depend (
        for /f "tokens=1* delims=-" %%u in ("%%j") do (
            if %%u equ bin (
                set downlist=!downlist!%%j.tar.x?,%%j.win32.tar.x?,
                ) else if %%u neq collection (
                set downlist=!downlist!%%j.tar.x?,
            )
            
        )
    ) 
)
set downlist=!downlist!collection-latexextra.tar.x?
wget -r -nv -np -nd -N -P !colout! -A !downlist! %tlnet%
echo.

set downlist=
for /f "tokens=1*" %%i in (%cdir%\c-latexextra.m-z) do (
    if %%i == depend (
        for /f "tokens=1* delims=-" %%u in ("%%j") do (
            if %%u equ bin (
                set downlist=!downlist!%%j.tar.x?,%%j.win32.tar.x?,
                ) else if %%u neq collection (
                set downlist=!downlist!%%j.tar.x?,
            )
            
        )
    ) 
)
set downlist=!downlist!collection-latexextra.tar.x?
wget -r -nv -np -nd -N -P !colout! -A !downlist! %tlnet%
echo.

rem some latexextra packages include win32 files

set downlist=glossaries.win32.tar.x?,pax.win32.tar.x?,perltex.win32.tar.x?,ppower4.win32.tar.x?,vpe.win32.tar.x?
wget -r -nv -np -nd -N -P !colout! -A !downlist! %tlnet%
echo.

:::: we havn't downloaded this package yet
::wget -r -nv -np -nd -N -P %~dp0texlive\c-basicbin -A texlive.infra.win32.tar.x? %tlnet%


:: texlive core packages    
set colout=%~dp0texlive\tlcore
if not exist %colout% mkdir %colout%
echo output directory is %colout%
set downlist=tlperl.win32.tar.x?,tlgs.win32.tar.x?
wget -r -nv -np -nd -N -P %colout% -A %downlist% %tlnet%

:: some extra binary
set colout=%~dp0texlive\c-binextra
if not exist %colout% mkdir %colout%
echo output directory is %colout%
set downlist=pdftools.tar.x?,pdftools.win32.tar.x?
wget -r -nv -np -nd -N -P %colout% -A %downlist% %tlnet%

:: some extra fonts
set colout=%~dp0texlive\c-fontsextra
echo output directory is %colout%
set downlist=antt.tar.x?,bera.tar.x?,cmbright.tar.x?,eco.tar.x?,fourier.tar.x?,mnsymbol.tar.x?
wget -r -nv -np -nd -N -P %colout% -A %downlist% %tlnet%

:: texworks editor
set colout=%~dp0texlive\c-texworks
if not exist %colout% mkdir %colout%
echo output directory is %colout%
set downlist=texworks.tar.x?,texworks.win32.tar.x?
wget -r -nv -np -nd -N -P %colout% -A %downlist% %tlnet%

endlocal

::pause

goto downend

::==================== The End ========================
:downend

pause


