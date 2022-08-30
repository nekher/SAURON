@echo off
rem script para obtener datos de la pc

:vermemoria
echo Chequearemos la memoria total del sistema
echo hay un total de:
wmic computersystem get totalphysicalmemory
pause

:vernombre
echo El nombre de la PC es:
hostname
pause

:verwindows
echo Procederemos a revisar que version de windows tenemos
winver

:verlicenciaWyO
wmic path SoftwareLicensingProduct where (PartialProductKey is not null) get Name,LicenseStatus /format:list



:verprogramas
echo Realizaremos un chequeo de los programas basicos de la PC
echo en caso que alguno de ellos no este instalado, no aparecera su leyenda y habra que instalarlo.
echo.
echo.
echo los programas que revisaremos seran:
echo 1.CHROME
echo 2.FIREFOX
echo 3.ADOBE READER
echo 4.WINRAR
echo 5.OFFICE 2016
echo 6.CITRIX
echo 7.SISSEX
pause
if exist "c:\Program Files\Google\Chrome" echo 1.CHROME EXISTE!
if exist "C:\Program Files\Mozilla Firefox" echo 2.FIREFOX EXISTE!
if exist "C:\Program Files\Adobe\Acrobat DC" echo 3.ADOBE READER EXISTE!
if exist "C:\Program Files\WinRAR" echo 4.WINRAR EXISTE!
if exist "C:\Program Files\Microsoft Office\Office16" echo 5.OFFICE 2016 EXISTE!
if exist "C:\Program Files (x86)\Citrix\Receiver" echo 6.CITRIX EXISTE!
if exist "C:\Program Files (x86)\SISSEX" echo 7.SISSEX EXISTE!
pause

