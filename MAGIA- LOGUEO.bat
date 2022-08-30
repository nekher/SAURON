echo off
rem Script de automatizacion de logueo a los discos de soporte y Jebus
cd\

echo -----------------------------------------------------------------------------------------------------------
echo -----------------------------------------------------------------------------------------------------------
echo --------- ---------									--------- ---------
echo --------- ---------									--------- ---------
echo --------- ---------			BIENVENIDO AL SCRIPT				--------- ---------
echo --------- ---------			DE LOGUEO AUTOMATICO				--------- ---------
echo --------- ---------			Alabado sea Jebus!				--------- ---------
echo --------- ---------									--------- ---------
echo --------- ---------									--------- ---------
echo -----------------------------------------------------------------------------------------------------------
echo -----------------------------------------------------------------------------------------------------------


echo Iniciando la carga de Jebus y Soporte como discos de forma automatica...


echo Por favor, ingrese los passwords que hagan falta, en caso que el script lo solicite:

rem:COLOCANDO-ADMIN
rem echo %username%
rem set name=%username%
rem echo %name%

rem net localgroup administradores %name%@sds_domain_1.local /add

:mapdrive
net use v: \\jebus\s * /USER:sds_domain_1\nmrodriguez
net use w: \\fs01-9dj\soporte *  /USER:sds_domain_1\nmrodriguez

:LINK-GDE
copy V:\LNK\GDE.url "C:\%HOMEPATH%\Desktop\"

:LINK-OWA

copy V:\LNK\OWA.url "C:\%HOMEPATH%\Desktop\"


echo NO CIERRES ESTA VENTANA. realiza las tareas que necesitas, cuando hayas FINALIZADO, apreta cualquier tecla
pause
echo ENTENDISTE? NO CIERRES LA VENTANA HASTA FINALIZAR
pause
net localgroup administradores %name%@sds_domain_1.local /delete
net use v:  /delete
net use w:  /delete
echo -----LISTO------ Todos los discos han desaparecido del usuario. Exito!
pause
:END