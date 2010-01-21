@echo off
set PROMPT=# 

set downdir=%~dp0download

set Path=%~dp0somebin;%Path%

::==================== LyX ========================
:makelyx

set lyxver=1.6.5
set lyxname=LyX-%lyxver%-1-Installer.exe

:lyxinst

rem if not exist %downdir%\%lyxname% goto altinst

echo.
echo Extracting LyX...

7z x -y -o%~dp0LyTeX\LyX %downdir%\%lyxname%

::pause

:: move command sucks when destination directory is not empty
::move /y %~dp0LyTeX\LyX\$_OUTDIR\Resources %~dp0LyTeX\LyX
if not exist %~dp0LyTeX\LyX\Resources mkdir %~dp0LyTeX\LyX\Resources
xcopy /e/i/y %~dp0LyTeX\LyX\$_OUTDIR\Resources %~dp0LyTeX\LyX\Resources

rmdir /s /q %~dp0LyTeX\LyX\$_OUTDIR
rmdir /s /q %~dp0LyTeX\LyX\$PLUGINSDIR
rmdir /s /q %~dp0LyTeX\LyX\$[33]
rmdir /s /q %~dp0LyTeX\LyX\aiksaurus\$PLUGINSDIR

copy %~dp0LyTeX\LyX\bin\Microsoft.VC90.CRT.manifest %~dp0LyTeX\LyX\ghostscript
copy %~dp0LyTeX\LyX\bin\msvcp90.dll %~dp0LyTeX\LyX\ghostscript
copy %~dp0LyTeX\LyX\bin\msvcr90.dll %~dp0LyTeX\LyX\ghostscript
rem there is an aspelldata.exe file in this directory
rmdir /s /q %~dp0LyTeX\LyX\ghostscript\$PLUGINSDIR

copy %~dp0LyTeX\LyX\bin\Microsoft.VC90.CRT.manifest %~dp0LyTeX\LyX\python
copy %~dp0LyTeX\LyX\bin\msvcp90.dll %~dp0LyTeX\LyX\python
copy %~dp0LyTeX\LyX\bin\msvcr90.dll %~dp0LyTeX\LyX\python
rem LyX-Installer doesn't put msvcrt in this directiory
copy %~dp0LyTeX\LyX\bin\Microsoft.VC90.CRT.manifest %~dp0LyTeX\LyX\imagemagick
copy %~dp0LyTeX\LyX\bin\msvcp90.dll %~dp0LyTeX\LyX\imagemagick
copy %~dp0LyTeX\LyX\bin\msvcr90.dll %~dp0LyTeX\LyX\imagemagick
rem LyX-Installer doesn't put these two files in this directiory

xcopy /e/i/y %~dp0somelyx %~dp0LyTeX\LyX

goto document

rem :altinst

rem set lyxaltname=LyX-163-4-19-AltInstaller-Small.exe

rem if not exist %downdir%\%lyxaltname% (
rem echo.
rem echo Downloading LyX alternative installer...
rem wget -nv -N -P %downdir% %lyxpath%/%lyxaltname%
rem )

rem echo.
rem echo Extracting LyX...

rem 7z x -y -o%~dp0LyTeX\LyX %downdir%\%lyxaltname%

rem rmdir /s /q %~dp0LyTeX\LyX\$[81]
rem move /y %~dp0LyTeX\LyX\$_OUTDIR\Resources %~dp0LyTeX\LyX
rem move /y %~dp0LyTeX\LyX\$_OUTDIR\Aiksaurus %~dp0LyTeX\LyX
rem move /y %~dp0LyTeX\LyX\$_OUTDIR\Aspell %~dp0LyTeX\LyX

rem if not exist %~dp0LyTeX\LyX\python mkdir %~dp0LyTeX\LyX\python
rem move /y %~dp0LyTeX\LyX\$_OUTDIR\bin\DLLs\unicodedata.pyd %~dp0LyTeX\LyX\python
rem move /y %~dp0LyTeX\LyX\$_OUTDIR\bin\Lib %~dp0LyTeX\LyX\python
rem move /y %~dp0LyTeX\LyX\$_OUTDIR\bin\python.exe %~dp0LyTeX\LyX\python
rem move /y %~dp0LyTeX\LyX\$_OUTDIR\bin\python26.dll %~dp0LyTeX\LyX\python
rem copy %~dp0LyTeX\LyX\$_OUTDIR\bin\Microsoft.VC90.CRT.manifest %~dp0LyTeX\LyX\python
rem copy %~dp0LyTeX\LyX\$_OUTDIR\bin\msvcp90.dll %~dp0LyTeX\LyX\python
rem copy %~dp0LyTeX\LyX\$_OUTDIR\bin\msvcr90.dll %~dp0LyTeX\LyX\python

rem move /y %~dp0LyTeX\LyX\$_OUTDIR\bin\* %~dp0LyTeX\LyX\bin
rem ::move /y %~dp0LyTeX\LyX\$_OUTDIR\dvipost %~dp0LyTeX\LyX
rem :: Ghostscript directory doesn't have fonts and Resource subdirectory!
rem move /y %~dp0LyTeX\LyX\$_OUTDIR\etc\Ghostscript %~dp0LyTeX\LyX
rem move /y %~dp0LyTeX\LyX\$_OUTDIR\etc\Imagemagick %~dp0LyTeX\LyX

rem xcopy /e/i/y %~dp0LyTeX\LyX\$_OUTDIR\etc\Metafile2eps %~dp0LyTeX\LyX\bin
rem rmdir /s /q %~dp0LyTeX\LyX\$_OUTDIR
rem rmdir /s /q %~dp0LyTeX\LyX\$APPDATA
rem del /q %~dp0LyTeX\LyX\Aspell\Uninstall-AspellData.exe
rem rmdir /s /q %~dp0LyTeX\LyX\bin\$PLUGINSDIR

rem move /y %~dp0LyTeX\LyX\Imagemagick\config\* %~dp0LyTeX\LyX\Imagemagick
rem move /y %~dp0LyTeX\LyX\Imagemagick\modules\coders\* %~dp0LyTeX\LyX\Imagemagick
rem move /y %~dp0LyTeX\LyX\Imagemagick\modules\filters\* %~dp0LyTeX\LyX\Imagemagick
rem rmdir /s /q %~dp0LyTeX\LyX\Imagemagick\config
rem rmdir /s /q %~dp0LyTeX\LyX\Imagemagick\modules
rem copy %~dp0LyTeX\LyX\bin\Microsoft.VC90.CRT.manifest %~dp0LyTeX\LyX\ImageMagick
rem copy %~dp0LyTeX\LyX\bin\msvcp90.dll %~dp0LyTeX\LyX\ImageMagick
rem copy %~dp0LyTeX\LyX\bin\msvcr90.dll %~dp0LyTeX\LyX\ImageMagick

rem xcopy /e/i/y %~dp0sometex\basic-lyx %~dp0LyTeX\LyX

::pause

:document

echo Copying Documents...
if not exist %~dp0LyTeX\Manual mkdir %~dp0LyTeX\Manual
xcopy /e/i/y %~dp0somedoc %~dp0LyTeX\Manual

:version

echo Writing LyX version...
if not exist %~dp0LyTeX\Common\update mkdir %~dp0LyTeX\Common\update
>%~dp0LyTeX\Common\update\lyxver.usb echo %lyxver%

echo Copying LyX update files...
copy %~dp0somebin\wget.exe %~dp0LyTeX\Common\update
copy %~dp0somebin\7z.dll %~dp0LyTeX\Common\update
copy %~dp0somebin\7z.exe %~dp0LyTeX\Common\update
copy %~dp0somebin\update.bat %~dp0LyTeX\Common\update

if not exist %~dp0LyTeX\Common\download mkdir %~dp0LyTeX\Common\download

goto makemik
::goto makelive

::==================== MiKTeX ========================
:makemik

::set mkbin=miktex-portable-2.8.3582.exe
set mkbin=miktex-portable.exe

if not exist %~dp0LyTeX\MiKTeX md %~dp0LyTeX\MiKTeX
set texdir=%~dp0LyTeX\MiKTeX

echo.
echo Extracting MiKTeX...

if not exist %~dp0LyTeX\MiKTeX\texmf md %~dp0LyTeX\MiKTeX\texmf

7z x -y -o%~dp0LyTeX\MiKTeX\texmf %downdir%\%mkbin%

rmdir /s /q %texdir%\texmf\doc
rmdir /s /q %texdir%\texmf\source

xcopy /e/i/y sometex\basic-mik %texdir%
move /y %texdir%\About.htm %~dp0LyTeX

xcopy /e/i/y sometex\basic-bin %texdir%\texmf\miktex\bin

rem texmf-local 

if not exist %texdir%\texmf-local mkdir %texdir%\texmf-local

xcopy /e/i/y sometex\basic-tex %texdir%
xcopy /e/i/y sometex\basic-cct %texdir%
xcopy /e/i/y sometex\basic-cjk %texdir%

rem editor

:: texworks config file lies in UserConfig or UserData dir 

if not exist %texdir%\texmf-local\TeXworks mkdir %texdir%\texmf-local\TeXworks
if not exist %texdir%\texmf-local\TeXworks\configuration mkdir %texdir%\texmf-local\TeXworks\configuration
xcopy /e/i/y %~dp0sometex\basic-tw\configuration %texdir%\texmf-local\TeXworks\configuration

if not exist %texdir%\texmf-local\TUG  mkdir %texdir%\texmf-local\TUG
xcopy /e/i/y %~dp0sometex\basic-tw\TUG %texdir%\texmf-local\TUG

::pause

goto makeend

::==================== TeXLive ========================
:makelive

if not exist %~dp0LyTeX\TeXLive md %~dp0LyTeX\TeXLive
set outdir=%~dp0LyTeX\TeXLive

::goto addons

:extracttl

echo ===========================================
echo Now starting to extract TeXLive packages...
echo ===========================================

set indir=texlive\c-basic
echo.
echo handing %indir% directory...
echo.
for /r %indir% %%a in (*.xz) do (
    echo tar -Jxf %%a
    tar -C%outdir% -Jxf %%a
)

set indir=texlive\c-basicbin
echo.
echo handing %indir% directory...
echo.
for /r %indir% %%a in (*.xz) do (
    echo tar -Jxf %%a
    tar -C%outdir% -Jxf %%a
)

set indir=texlive\c-bibtexextra
echo.
echo handing %indir% directory...
echo.
for /r %indir% %%a in (*.xz) do (
    echo tar -Jxf %%a
    tar -C%outdir% -Jxf %%a
)

set indir=texlive\c-fontsextra
echo.
echo handing %indir% directory...
echo.
rem antt and mnsymbol include opentype fonts
set pkg=antt
echo tar -Jxf %pkg%.tar.xz
tar -C%outdir% -Jxf %indir%\%pkg%.tar.xz
set pkg=bera
echo tar -Jxf %pkg%.tar.xz
tar -C%outdir% -Jxf %indir%\%pkg%.tar.xz
set pkg=cmbright
echo tar -Jxf %pkg%.tar.xz
tar -C%outdir% -Jxf %indir%\%pkg%.tar.xz
set pkg=eco
echo tar -Jxf %pkg%.tar.xz
tar -C%outdir% -Jxf %indir%\%pkg%.tar.xz
set pkg=fourier
echo tar -Jxf %pkg%.tar.xz
tar -C%outdir% -Jxf %indir%\%pkg%.tar.xz
set pkg=mnsymbol
echo tar -Jxf %pkg%.tar.xz
tar -C%outdir% -Jxf %indir%\%pkg%.tar.xz

set indir=%~dp0texlive\c-fontsrecommended
echo.
echo handing %indir% directory...
echo.
for /r %indir% %%a in (*.xz) do (
    ::echo %%a
    if "%%a" neq "%indir%\collection-fontsrecommended.tar.xz" (
        echo tar -Jxf %%a
        tar -C%outdir%\texmf-dist -Jxf %%a
    )
)

set indir=texlive\c-fontutils
echo.
echo handing %indir% directory...
echo.
for /r %indir% %%a in (*.xz) do (
    echo tar -Jxf %%a
    tar -C%outdir% -Jxf %%a
)

set indir=texlive\c-games
echo.
echo handing %indir% directory...
echo.
for /r %indir% %%a in (*.xz) do (
    echo tar -Jxf %%a
    tar -C%outdir% -Jxf %%a
)

set indir=texlive\c-genericextra
echo.
echo handing %indir% directory...
echo.
for /r %indir% %%a in (*.xz) do (
    echo tar -Jxf %%a
    tar -C%outdir% -Jxf %%a
)

set indir=texlive\c-genericrecommended
echo.
echo handing %indir% directory...
echo.
for /r %indir% %%a in (*.xz) do (
    echo tar -Jxf %%a
    tar -C%outdir% -Jxf %%a
)

set indir=texlive\c-humanities
echo.
echo handing %indir% directory...
echo.
for /r %indir% %%a in (*.xz) do (
    echo tar -Jxf %%a
    tar -C%outdir% -Jxf %%a
)

set indir=texlive\c-langcjk
echo.
echo handing %indir% directory...
echo.
for /r %indir% %%a in (*.xz) do (
    echo tar -Jxf %%a
    tar -C%outdir%\texmf-dist -Jxf %%a
)

set indir=texlive\c-langcyrillic
echo.
echo handing %indir% directory...
echo.
set pkg=ruhyphen
echo tar -Jxf %pkg%.tar.xz
tar -C%outdir% -Jxf %indir%\%pkg%.tar.xz
set pkg=ukrhyph
echo tar -Jxf %pkg%.tar.xz
tar -C%outdir% -Jxf %indir%\%pkg%.tar.xz

set indir=texlive\c-langgerman
echo.
echo handing %indir% directory...
echo.
set pkg=dehyph-exptl
echo tar -Jxf %pkg%.tar.xz
tar -C%outdir% -Jxf %indir%\%pkg%.tar.xz
set pkg=hyphen-german
echo tar -Jxf %pkg%.tar.xz
tar -C%outdir% -Jxf %indir%\%pkg%.tar.xz

set indir=texlive\c-langgreek
echo.
echo handing %indir% directory...
echo.
set pkg=hyphen-ancientgreek
echo tar -Jxf %pkg%.tar.xz
tar -C%outdir% -Jxf %indir%\%pkg%.tar.xz
set pkg=hyphen-greek
echo tar -Jxf %pkg%.tar.xz
tar -C%outdir% -Jxf %indir%\%pkg%.tar.xz

set indir=texlive\c-langother
echo.
echo handing %indir% directory...
echo.
set pkg=hyphen-coptic
echo tar -Jxf %pkg%.tar.xz
tar -C%outdir% -Jxf %indir%\%pkg%.tar.xz

set indir=texlive\c-latex
echo.
echo handing %indir% directory...
echo.
for /r %indir% %%a in (*.xz) do (
    echo tar -Jxf %%a
    tar -C%outdir% -Jxf %%a
)

set indir=texlive\c-latexextra
echo.
echo handing %indir% directory...
echo.
for /r %indir% %%a in (*.xz) do (
    echo tar -Jxf %%a
    tar -C%outdir% -Jxf %%a
)

::pause

set indir=texlive\c-latexrecommended
echo.
echo handing %indir% directory...
echo.
for /r %indir% %%a in (*.xz) do (
    echo tar -Jxf %%a
    tar -C%outdir% -Jxf %%a
)

set indir=texlive\c-mathextra
echo.
echo handing %indir% directory...
echo.
for /r %indir% %%a in (*.xz) do (
    echo tar -Jxf %%a
    tar -C%outdir% -Jxf %%a
)

set indir=texlive\c-music
echo.
echo handing %indir% directory...
echo.
for /r %indir% %%a in (*.xz) do (
    echo tar -Jxf %%a
    tar -C%outdir% -Jxf %%a
)

set indir=texlive\c-pictures
echo.
echo handing %indir% directory...
echo.
for /r %indir% %%a in (*.xz) do (
    echo tar -Jxf %%a
    tar -C%outdir% -Jxf %%a
)

set indir=texlive\c-plainextra
echo.
echo handing %indir% directory...
echo.
for /r %indir% %%a in (*.xz) do (
    echo tar -Jxf %%a
    tar -C%outdir% -Jxf %%a
)

set indir=texlive\c-pstricks
echo.
echo handing %indir% directory...
echo.
for /r %indir% %%a in (*.xz) do (
    echo tar -Jxf %%a
    tar -C%outdir% -Jxf %%a
)

set indir=texlive\c-publishers
echo.
echo handing %indir% directory...
echo.
for /r %indir% %%a in (*.xz) do (
    echo tar -Jxf %%a
    tar -C%outdir% -Jxf %%a
)

set indir=texlive\c-science
echo.
echo handing %indir% directory...
echo.
for /r %indir% %%a in (*.xz) do (
    echo tar -Jxf %%a
    tar -C%outdir% -Jxf %%a
)

set indir=texlive\c-xetex
echo.
echo handing %indir% directory...
echo.
for /r %indir% %%a in (*.xz) do (
    echo tar -Jxf %%a
    tar -C%outdir% -Jxf %%a
)

set indir=texlive\tlcore
echo.
echo handing %indir% directory...
echo tar -Jxf %pkg%.tar.xz
set pkg=tlperl.win32
echo tar -C%outdir% -Jxf %indir%\%pkg%.tar.xz
tar -C%outdir% -Jxf %indir%\%pkg%.tar.xz
set pkg=tlgs.win32
echo tar -C%outdir% -Jxf %indir%\%pkg%.tar.xz
tar -C%outdir% -Jxf %indir%\%pkg%.tar.xz

set indir=texlive\c-binextra
echo.
echo handing %indir% directory...
echo.
set pkg=pdftools
echo tar -Jxf %pkg%.tar.xz
tar -C%outdir% -Jxf %indir%\%pkg%.tar.xz
set pkg=pdftools.win32
echo tar -Jxf %pkg%.tar.xz
tar -C%outdir% -Jxf %indir%\%pkg%.tar.xz

set indir=texlive\c-texworks
echo.
echo handing %indir% directory...
echo.
set pkg=texworks
echo tar -Jxf %pkg%.tar.xz
tar -C%outdir% -Jxf %indir%\%pkg%.tar.xz
set pkg=texworks.win32
echo tar -Jxf %pkg%.tar.xz
tar -C%outdir% -Jxf %indir%\%pkg%.tar.xz

::pause

:::::::::::::::::::::::::::::::::::::::::::::::::::::

rem c-mathextra
rem tar -C%outdir%\share -Jxvf tlbasic\mh.tar.xz

rem c-pictures
rem tar -C%outdir%\share -Jxvf tlbasic\pgf.tar.xz

rem c-publishers
rem tar -C%outdir%\share -Jxvf tlbasic\revtex.tar.xz

::::::::::::::::::::::::::::::::::::::::::::::::::::::

::pause

rem since texlive 2009, some packages support relocation
xcopy /e/i/y "%outdir%\bibtex"     "%outdir%\texmf-dist\bibtex" && rmdir /s /q "%outdir%\bibtex"
xcopy /e/i/y "%outdir%\doc"        "%outdir%\texmf-dist\doc" && rmdir /s /q "%outdir%\doc"
xcopy /e/i/y "%outdir%\dvips"      "%outdir%\texmf-dist\dvips"  && rmdir /s /q "%outdir%\dvips"
xcopy /e/i/y "%outdir%\fonts"      "%outdir%\texmf-dist\fonts" && rmdir /s /q "%outdir%\fonts"
xcopy /e/i/y "%outdir%\makeindex"  "%outdir%\texmf-dist\makeindex"  && rmdir /s /q "%outdir%\makeindex"
xcopy /e/i/y "%outdir%\metafont"   "%outdir%\texmf-dist\metafont"  && rmdir /s /q "%outdir%\metafont"
xcopy /e/i/y "%outdir%\metapost"   "%outdir%\texmf-dist\metapost"  && rmdir /s /q "%outdir%\metapost"
xcopy /e/i/y "%outdir%\mft"        "%outdir%\texmf-dist\mft"  && rmdir /s /q "%outdir%\mft"
xcopy /e/i/y "%outdir%\omega"      "%outdir%\texmf-dist\omega" && rmdir /s /q "%outdir%\omega"
xcopy /e/i/y "%outdir%\scripts"    "%outdir%\texmf-dist\scripts"  && rmdir /s /q "%outdir%\scripts"
xcopy /e/i/y "%outdir%\source"     "%outdir%\texmf-dist\source"  && rmdir /s /q "%outdir%\source"
xcopy /e/i/y "%outdir%\tex"        "%outdir%\texmf-dist\tex"  && rmdir /s /q "%outdir%\tex"
xcopy /e/i/y "%outdir%\vtex"       "%outdir%\texmf-dist\vtex"  && rmdir /s /q "%outdir%\vtex"

xcopy /e/i/y "%outdir%\texmf-dist\tlpkg"  "%outdir%\tlpkg"  && rmdir /s /q "%outdir%\texmf-dist\tlpkg"

::pause

:cleartl

rem remove tlpkg, doc and source dir
:: rmdir /s /q %outdir%\tlpkg
rmdir /s /q %outdir%\texmf-dist\doc
rmdir /s /q %outdir%\texmf-dist\source
rmdir /s /q %outdir%\texmf\doc
rmdir /s /q %outdir%\texmf\source
rmdir /s /q %outdir%\texmf-dist\doc
rmdir /s /q %outdir%\texmf-dist\source
rmdir /s /q %outdir%\texmf-local\doc
rmdir /s /q %outdir%\texmf-local\source
:: rmdir /s /q %outdir%\ctxdir

rmdir /s /q %outdir%\readme-html.dir
rmdir /s /q %outdir%\readme-txt.dir
del /q %outdir%\install-tl.log
del /q %outdir%\doc.html
del /q %outdir%\index.html
del /q %outdir%\texmf.cnf 
del /q %outdir%\README.usergroups
del /q %outdir%\README
del /q %outdir%\install-tl
del /q %outdir%\tl-portable
del /q %outdir%\install-tl.bat
del /q %outdir%\install-tl-advanced.bat
del /q %outdir%\tl-portable.bat

:: =============================================

::pause

:addons

xcopy /e/i/y sometex\basic-live %outdir%
move /y %outdir%\About.htm %~dp0LyTeX\Manual

set tlpdb=%outdir%\tlpkg\texlive.tlpdb
set objdir=%outdir%\tlpkg\tlpobj

if exist %tlpdb% del /q %tlpdb%
::echo type %objdir%\00texlive-installation.config.tlpobj
::type %objdir%\00texlive-installation.config.tlpobj > %tlpdb%
::echo. >> %tlpdb%

for /f %%a in ('dir /b /o n %objdir%') do (
    echo type %objdir%\%%a
    type %objdir%\%%a >>%tlpdb%
    echo.>>%tlpdb%
) 

::for /r %objdir% %%a in (*.tlpobj) do (
::    echo type %%a
::    type %%a >>%tlpdb%
::    echo. >>%tlpdb%
::)

rem texlive 2009 supports RELOCATION of package
rem thus we replace texlive.tlpdb using perl here
"%outdir%\tlpkg\tlperl\bin\perl.exe" -p -i".txt" -e "s/RELOC/texmf-dist/g" "%outdir%\tlpkg\texlive.tlpdb"
del /q %outdir%\tlpkg\texlive.tlpdb.txt 

xcopy /e/i/y sometex\basic-bin %outdir%\bin\win32

rem editor

if not exist %outdir%\tlpkg\texworks mkdir %outdir%\tlpkg\texworks
xcopy /e/i/y %~dp0sometex\basic-tw %outdir%\tlpkg\texworks

rem texmf-local 

if not exist %outdir%\texmf-local mkdir %outdir%\texmf-local

xcopy /e/i/y sometex\basic-tex %outdir%
xcopy /e/i/y sometex\basic-cct %outdir%
xcopy /e/i/y sometex\basic-cjk %outdir%

::pause

goto makeend

::==================== TheEnd ========================
:makeend

echo All are done!

pause


