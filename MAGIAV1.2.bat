@echo off
rem Script de menu basico para ser modificado en otros proyectos
Title NO FUE MAGIA V1.2
:MENU 
color 1f
cls
echo                              #######                                           
echo                             *#,    ##*            ##  (##                      
echo                              ##     ##          ##     ##                      
echo                               ##     ##        ##     (#                       
echo                               ,##     ##      ##      #.                       
echo                                ##      ##    ##      ##                        
echo                                 ##     *##  ##      ##                         
echo                                  ##     ##.##      ##                          
echo                                   ##              *#*                          
echo                            *########(#########    ##                           
echo                            ##    ####         ##  ##                           
echo                        ######     .#######/     ####                           
echo                       ##    ##.     ##   *#.     ###                           
echo                        ##     ##     ##   ##      (#(                          
echo                        ###     ###  .##            ##                          
echo                        ## ##. ##                  ##                           
echo                         ##                       ##                            
echo                         *#.    NO FUE MAGIA    ##,                             
echo                           ###      V1.2      /##                               
echo                             ##HECHO POR NMRD##                                
echo                             ###################      
echo.
echo ....................................................................................................
echo                     Presione el numero del Script que desee ejecutar
echo.
echo .......... 1- Iniciar el Script de Mejoras de Windows 10 (recomendado)                    ..........
echo .......... 2- Menu para elegir el modulo de mejora de forma individual                    ..........
echo .......... 3- Iniciar el Script que restaura las opciones a default (en construccion)     ..........
echo .......... 4- Iniciar el Script de Logueo a Jebus y Archivos GDE y OWA                    ..........
echo .......... 5- DATOS SOBRE LA PC (Nombre, Programas, etc)                                  ..........
echo .......... 6- PROXY                                                                       ..........
echo .......... 7- Datos importantes para tener en cuenta en Soporte                           ..........
echo .......... 8- IMPRESORAS
echo .......... 9- Salir del Programa                                                          ..........
echo.
echo ....................................................................................................

SET /P M=Selecciona 1, 2, 3, 4 o 5 y apreta ENTER: 
IF %M%==1 GOTO INICIO
IF %M%==2 GOTO INDIVIDUAL
IF %M%==3 GOTO CONSTRUCCION
IF %M%==4 GOTO JEBUS
IF %M%==5 GOTO INFO
IF %M%==6 GOTO PROXY
IF %M%==7 GOTO SOPORTE
IF %M%==8 GOTO IMPRESORAS
IF %M%==9 GOTO FIN

:INICIO

echo El script esta compuesto de varios modulos. Antes de realizar cada modulo, se consulta si se quiere o no realizar dicha modificacion.
echo Quedara en el tecnico que lo ejecute, determinar cuando es necesario o no, realizar cada modulo.
echo Sin embargo, se pueden ejecutar TODOS los modulos aun cuando ya se hayan hecho parcialmente en otro momento.
echo Ante algun error, el Script continuara de todas formas.
echo.
echo ****EMPEZEMOS****
echo.
pause

:UPDATES
cls
color 17
echo Lo primero que hay que hacer, es actualizar completamente la PC. 
set "respuesta=y"
set /p "respuesta=Estan todos los Updates realizados? [y|n]: "
if /i not "%respuesta%" == "y" goto :UPDATEFALLO
set "respuesta=y"
set /p "respuesta=Estas SEGURO? es importante hacerlo ANTES de continuar con todos los modulos [y|n]: "
if /i not "%respuesta%" == "y" goto :UPDATEFALLO

:DRIVERSOFICIALES
cls
color 02
echo El segundo paso es descargar los drivers originales de la motherboard e instalarlos.
echo.
echo Ejemplo: las DELL 3050 tienen la posibilidad de descargar el DELL SUPPORT desde la pagina oficial.
echo Esto permitira instalar varias mejoras para el rendimiento del disco rigido.
set "respuesta=y"
set /p "respuesta=Ya lo hiciste? [y|n]: "
if /i not "%respuesta%" == "y" goto :UPDATEFALLO
echo.

:ENERGIA
cls
color 03
echo 3- CAMBIAR EL PLAN DE ENERGIA (MAXIMO)
echo.
rem echo Tendras que SELECCIONAR el codigo del plan que deseas.
rem echo A continuacion estan los codigos de los planes:

echo aca hay una lista de los planes de energia activos y cual es el que esta seleccionado actualmente.
powercfg /list
set "respuesta=y"
set /p "respuesta= Queres poner el plan de energia Maximo? [y|n]: "
if /i not "%respuesta%" == "y" goto :OTRAENERGIA
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
echo.
echo.
echo ....................................................................................................
SET /P M=1 para CONTINUAR, 2 para IR AL MENU o 3 para SALIR. Luego apreta ENTER!: 
echo.
IF %M%==1 GOTO SERVICES
IF %M%==2 GOTO MENU
IF %M%==3 GOTO FIN
echo.
echo ....................................................................................................

:OTRAENERGIA
cls
powercfg /list
set "respuesta=y"
set /p "respuesta= Queres elegir otro plan de energia? [y|n]: "
if /i not "%respuesta%" == "y" goto :MENUENERGIA
echo Cuando Hayas identificado cual es el plan de energia que queres, copialo:
set "respuesta= "
set /p "respuesta=LUEGO PEGA ACA EL CODIGO y DALE ENTER: "
powercfg /setactive %respuesta%
if /i not "%respuesta%" == "n" goto :MENUENERGIA
:MENUENERGIA
echo.
echo.
echo ....................................................................................................
SET /P M=1 para CONTINUAR, 2 para IR AL MENU o 3 para SALIR. Luego apreta ENTER!: 
echo.
IF %M%==1 GOTO SERVICES
IF %M%==2 GOTO MENU
IF %M%==3 GOTO FIN
echo.
echo ....................................................................................................



:SERVICES
cls
color 04
echo 4-DESACTIVAR SERVICIOS
echo se desactivaran los siguientes servicios: 
echo ********** SysMain ***************************************************** 
echo ********** Windows Search **********************************************
echo ********** Experiencias del usuario y telemetria asociadas *************
echo ********** Servicios de plataforma de dispositivos conectados ********** 
set "respuesta=y"
set /p "respuesta= Desea continuar? [y|n]: "
if /i not "%respuesta%" == "y" goto :MENUSERVICIOS
sc config SysMain start=disabled
sc config WSearch start=disabled
sc config DiagTrack start=disabled
sc config CDPSvc start=disabled
echo Todos los servicios fueron correctamente deshabilitados
pause
:MENUSERVICIOS
echo.
echo.
echo ....................................................................................................
SET /P M=1 para CONTINUAR, 2 para IR AL MENU o 3 para SALIR. Luego apreta ENTER!: 
echo.
IF %M%==1 GOTO CORTANA
IF %M%==2 GOTO MENU
IF %M%==3 GOTO FIN
echo.
echo ....................................................................................................


:CORTANA
cls
color 75
echo 5- Ok, vamos a desconectar los servicios de WEBSEARCH y CORTANA. Procedemos?
set "respuesta=y"
set /p "respuesta= Desea continuar? [y|n]: "
if /i not "%respuesta%" == "y" goto :MENUCORTANA
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d 0
:MENUCORTANA
echo.
echo.
echo ....................................................................................................
SET /P M=1 para CONTINUAR, 2 para IR AL MENU o 3 para SALIR. Luego apreta ENTER!: 
echo.
IF %M%==1 GOTO TEMPORIZADOREVENTOS
IF %M%==2 GOTO MENU
IF %M%==3 GOTO FIN
echo.
echo ....................................................................................................

:TEMPORIZADOREVENTOS 
cls
color 06
echo 6- Esto desactivara definitivamente el Temporizador de eventos de alta precision y el Synthethic timer
echo ==== CUIDADO ====
echo Este proceso puede Mejorar el sistema, pero tambien puede introducir problemas. USAR SOLO si es necesario
echo Por este motivo se da la opcion de volver los cambios atras
set "respuesta=y"
set /p "respuesta= DESEA REALIZAR ESTOS CAMBIOS? [y|n]: "
if /i not "%respuesta%" == "y" goto :TEMPORIZADORNO
bcdedit /set useplatformclock No
bcdedit /set disabledynamictick Yes
echo Se abrira el menu del administrador de dispositivos. Por favor, vayan a la seccion
echo DISPOSITIVOS DEL SISTEMA
echo Alli busquen el item: Temporizador de Eventos de Alta Precision
echo DESHABILITEN ESTA OPCION
devmgmt.msc
echo.
echo.
echo ....................................................................................................
SET /P M=1 para CONTINUAR, 2 para IR AL MENU o 3 para SALIR. Luego apreta ENTER!: 
echo.
IF %M%==1 GOTO DEFRAGMENTADOR
IF %M%==2 GOTO MENU
IF %M%==3 GOTO FIN
echo.
echo ....................................................................................................

:TEMPORIZADORNO
set "respuesta=y"
set /p "respuesta= Desea VOLVER LOS VALORES A DEFAULT? [y|n]: "
if /i not "%respuesta%" == "y" goto :MENUTEMP
bcdedit /set useplatformclock Yes
bcdedit /set disabledynamictick No
echo Se abrira el menu del administrador de dispositivos. Por favor, vayan a la seccion
echo DISPOSITIVOS DEL SISTEMA
echo Alli busquen el item: Temporizador de Eventos de Alta Precision
echo HABILITEN ESTA OPCION
devmgmt.msc
:MENUTEMP
echo.
echo.
echo ....................................................................................................
SET /P M=1 para CONTINUAR, 2 para IR AL MENU o 3 para SALIR. Luego apreta ENTER!: 
echo.
IF %M%==1 GOTO DEFRAGMENTADOR
IF %M%==2 GOTO MENU
IF %M%==3 GOTO FIN
echo.
echo ....................................................................................................

:DEFRAGMENTADOR
cls
color 07
echo 7- Esto desactivara el defragmentador automatico de Windows
set "respuesta=y"
set /p "respuesta= Desea continuar? [y|n]: "
if /i not "%respuesta%" == "y" goto :MENUDEFRAG
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag"
rem schtasks /Delete /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /F
:MENUDEFRAG
echo.
echo.
echo ....................................................................................................
SET /P M=1 para CONTINUAR, 2 para IR AL MENU o 3 para SALIR. Luego apreta ENTER!: 
echo.
IF %M%==1 GOTO ANIMACIONES
IF %M%==2 GOTO MENU
IF %M%==3 GOTO FIN
echo.
echo ....................................................................................................


:ANIMACIONES
cls
color f0
echo 8- Esto desactivara las animaciones del sistema.
set "respuesta=y"
set /p "respuesta= Desea continuar? [y|n]: "
if /i not "%respuesta%" == "y" goto :MENUANIM
rem sc stop uxsms
rem reg.exe add "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting /t REG_DWORD /d 00000002"
echo Se abrira el menu de opciones de rendimiento. Bajo la pestaña de efectos visuales, deberas marcar la opcion:
echo AJUSTAR PARA OBTENER EL MEJOR RENDIMIENTO
echo luego volver a marcar las opciones
echo GUARDAR VISTAS PREVIAS DE MINIATURAS...
echo MOSTRAR VISTAS EN MINIATURAS...
echo SUAVIZAR BORDES PARA LAS FUENTES...
echo Aplicar y aceptar
pause
%windir%\system32\SystemPropertiesPerformance.exe
pause
:MENUANIM
echo.
echo.
echo ....................................................................................................
SET /P M=1 para CONTINUAR, 2 para IR AL MENU o 3 para SALIR. Luego apreta ENTER!: 
echo.
IF %M%==1 GOTO PAGINACION
IF %M%==2 GOTO MENU
IF %M%==3 GOTO FIN
echo.
echo ....................................................................................................


:PAGINACION
cls
color e0
echo 9- Modificaremos el tamaño de la paginacion.
echo.
echo.
echo Lo primero que debemos hacer es saber cual es la memoria total REAL de la PC.
echo.
set "respuesta=y"
set /p "respuesta= La PC, tiene 4gb de ram? [y|n]: "
if /i not "%respuesta%" == "y" goto :PAGINACION8GB

:PAGINACION4GB
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=false
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=1373,MaximumSize=6144
goto :MENUMEMORIA

:PAGINACION8GB
set "respuesta=y"
set /p "respuesta= La PC, tiene 8gb de ram? [y|n]: "
if /i not "%respuesta%" == "y" goto :PAGINACIONESPECIAL
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=false
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=2746,MaximumSize=12288
goto :MENUMEMORIA

:PAGINACIONESPECIAL
cls
echo Ok, la complicaste...Lo mejor que podes hacer es lo siguiente:
echo Ahora se va a abrir el menu de OPCIONES DE RENDIMIENTO, alli deberas ir a la pestaña
echo OPCIONES AVANZADAS
echo luego dentro del SUBMENU MEMORIA VIRTUAL ingresa en CAMBIAR 
echo Aqui, deberas DESTILDAR la opcion "Administrar automaticamente..."
echo Marcar la opcion tamaño personalizado
echo en tamaño inicial, coloca el numero que dice abajo donde dice RECOMENDADO
echo y en tamaño maximo tenes que calcular tu memoria ram 1.5 veces
echo esto se hace haciendo lo siguiente:
echo 1GB = 1024MB
echo por lo tanto si tu pc tiene 16gb RAM = 16x1024 = 16388 y a este numero hay que multiplicarlo por 1.5
echo dando un total de 24576 (el cual colocaras donde dice EL MAXIMO)
echo luego deberar poner ESTABLECER y aceptar todo.
echo Eventualmente deberas reiniciar, pero podes seguir con el script mientras tanto...
%windir%\system32\SystemPropertiesPerformance.exe
pause
:MENUMEMORIA
echo.
echo.
echo ....................................................................................................
SET /P M=1 para CONTINUAR, 2 para IR AL MENU o 3 para SALIR. Luego apreta ENTER!: 
echo.
IF %M%==1 GOTO 2DOPLANO
IF %M%==2 GOTO MENU
IF %M%==3 GOTO FIN
echo.
echo ....................................................................................................


:2DOPLANO
cls
color a
echo 10- Ahora procederemos a realizar la desactivacion de las aplicaciones en segundo plano.
set "respuesta=y"
set /p "respuesta=Continuamos? [y|n]: "
if /i not "%respuesta%" == "y" goto :MENU2DOPLANO
Reg Add HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications /v GlobalUserDisabled /t REG_DWORD /d 1 /f
:MENU2DOPLANO
echo.
echo.
echo ....................................................................................................
SET /P M=1 para CONTINUAR, 2 para IR AL MENU o 3 para SALIR. Luego apreta ENTER!: 
echo.
IF %M%==1 GOTO SERVICIOSINICIO
IF %M%==2 GOTO MENU
IF %M%==3 GOTO FIN
echo.
echo ....................................................................................................

:SERVICIOSINICIO
cls
color f
echo Por ultimo desactivaremos los servicios que se cargan al iniciar la PC
echo Se abrira el menu de CONFIGURACION DEL SISTEMA
echo deben ir a la pestaña de SERVICIOS
echo ABAJO marquen la opcion OCULTAR TODOS LOS SERVICIOS DE MICROSOFT
echo Luego...DESHABILITEN TODO.
pause
echo SI. POSTA. TODO.
pause
echo una vez hayan hecho esto, deben ir a la Pestaña INICIO DE WINDOWS
echo alli deberan clickear en "abrir el administrador de tareas" 
echo En ese lugar, deben deshabilitar aquellas cosas que consideren que no son importantes
echo para el inicio de la PC. 
echo Por ultimo, APLIQUEN y ACEPTEN.
pause
msconfig
cls
echo TERMINARON!!! Ahora reinicien la PC y si todo sale bien, deberian notar un cambio importante en como funciona luego de esto.
echo Cualquier problema que tengan pueden comunicarse con el 0-800-SIGAPARTICIPANDO.
echo Nos vemos en la V1.1
pause
cls
color 1f
echo                              #######                                           
echo                             *#,    ##*            ##  (##                      
echo                              ##     ##          ##     ##                      
echo                               ##     ##        ##     (#                       
echo                               ,##     ##      ##      #.                       
echo                                ##      ##    ##      ##                        
echo                                 ##     *##  ##      ##                         
echo                                  ##     ##.##      ##                          
echo                                   ##              *#*                          
echo                            *########(#########    ##                           
echo                            ##    ####         ##  ##                           
echo                        ######     .#######/     ####                           
echo                       ##    ##.     ##   *#.     ###                           
echo                        ##     ##     ##   ##      (#(                          
echo                        ###     ###  .##            ##                          
echo                        ## ##. ##                  ##                           
echo                         ##                       ##                            
echo                         *#.    NO FUE MAGIA    ##,                             
echo                           ###      V1.2      /##                               
echo                             ##HECHO POR NMRD##                                
echo                             ###################      
echo                                    FIN
pause
echo.
echo.
echo ....................................................................................................
SET /P M=1 para IR AL MENU o 2 para SALIR. Luego apreta ENTER!: 
echo.
IF %M%==1 GOTO MENU
IF %M%==2 GOTO FIN
echo.
echo ....................................................................................................


:UPDATEFALLO
cls
color 97
echo OK!, no problem, actualiza todo, instala los drivers de la motherboard y volve a empezar despues!
echo.
echo.
echo ....................................................................................................
SET /P M=1 para IR AL MENU o 2 para SALIR. Luego apreta ENTER!: 
echo.
IF %M%==1 GOTO MENU
IF %M%==2 GOTO FIN
echo.
echo ....................................................................................................



:CONSTRUCCION
echo Esto aun no se implemento. Pero si tenes suerte, y lo pedis con buena onda, capaz que se haga algun Dia.
echo.
echo.
echo ....................................................................................................
SET /P M= 1 para IR AL MENU o 2 para SALIR. Luego apreta ENTER!: 
echo.
IF %M%==1 GOTO MENU
IF %M%==2 GOTO FIN
echo.
echo ....................................................................................................


rem A PARTIR DE ACA, COMIENZA UN MENU QUE SIRVE UNICAMENTE PARA EJECUTAR EL SCRIPT MODULO A MODULO

:INDIVIDUAL
cls
color 01
echo ....................................................................................................
echo                    TOTAL DE SCRIPTS DE MEJORA PARA WINDOWS 10
echo.
echo .......... 1- Editar el plan de energia                                                   ..........
echo .......... 2- Deshabilitar servicios no escenciales                                       ..........
echo .......... 3- Desactivar Cortana y Websearch                                              ..........
echo .......... 4- Deshabilitar el HPET                                                        ..........
echo .......... 5- Desactivar el Defragmentador de Discos (scheduled task)                     ..........
echo .......... 6- Desactivar las Animaciones                                                  ..........
echo .......... 7- Modificar el tamaño de la Paginacion                                        ..........
echo .......... 8- Desactivar las Aplicaciones en Segundo Plano                                ..........
echo .......... 9- Desactivar Servicios de Inicio                                              ..........
echo .......... 10- Salir de MAGIA                                                              ..........
echo.
echo ....................................................................................................

SET /P M=Selecciona 1, 2, 3, 4, 5, 6, 7, 8, 9 o 10 y apreta ENTER: 
IF %M%==1 GOTO ENERGIA
IF %M%==2 GOTO SERVICES
IF %M%==3 GOTO CORTANA
IF %M%==4 GOTO TEMPORIZADOREVENTOS
IF %M%==5 GOTO DEFRAGMENTADOR
IF %M%==6 GOTO ANIMACIONES
IF %M%==7 GOTO PAGINACION
IF %M%==8 GOTO 2DOPLANO
IF %M%==9 GOTO SERVICIOSINICIO
IF %M%==10 GOTO FIN


rem A partir de aca comienza el script de logueo automatico a jebus

:JEBUS
cls
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

echo ------------------------------------CUIDADO------------------------------------------------
echo.
echo ---- ESTE SCRIPT SOLO FUNCIONA SI SE EJECUTA COMO USUARIO COMUN, NO COMO ADMINISTRADOR ----
echo.
echo ------------------------------------CUIDADO------------------------------------------------

echo Iniciando la carga de Jebus y Soporte como discos de forma automatica...


echo Por favor, ingrese los passwords que hagan falta, en caso que el script lo solicite:
pause
net use v: \\jebus\s * /USER:sds_domain_1\nmrodriguez
net use w: \\fs01-9dj\soporte *  /USER:sds_domain_1\nmrodriguez

echo JEBUS y SOPORTE estan actualmente conectadas.
echo.
echo Queres aprovechar y copiar los Accesos directos a OWA y GDE en el escritorio?
SET /P M=Selecciona 1 para HACERLO o 2 para esperar y desconectar los discos: 
IF %M%==1 GOTO LINK-GDE
IF %M%==2 GOTO DESCONECTARJEBUS

:LINK-GDE
copy V:\LNK\GDE.url "C:\%HOMEPATH%\Desktop\"
:LINK-OWA
copy V:\LNK\OWA.url "C:\%HOMEPATH%\Desktop\"

echo Recorda realizar todo lo que necesites con JEBUS y EL DISCO DE SOPORTE ANTES de continuar.
pause
echo.
echo.
echo Si ya terminaste, aprovechamos y desconectamos JEBUS Y SOPORTE? 
SET /P M=Selecciona 1 para HACERLO o 2 para FINALIZAR SIN DESCONECTAR: 
IF %M%==1 GOTO DESCONECTARJEBUS
IF %M%==2 GOTO WARNING

:DESCONECTARJEBUS
net use v:  /delete
net use w:  /delete
echo -----LISTO------ Todos los discos han desaparecido del usuario. Exito!
pause
SET /P M=Selecciona 1 para IR AL MENU o 2 para FINALIZAR EL PROGRAMA: 
IF %M%==1 GOTO MENU
IF %M%==2 GOTO FIN

:WARNING
echo ESTAS SEGURO? si no los desactivas y te vas...vas a dejarles habilitado los discos al usuario.
echo.
echo.

SET /P M=Selecciona 1 para DESCONECTAR, 2 para IR AL MENU o 3 para FINALIZAR EL PROGRAMA (no es recomendable): 
IF %M%==1 GOTO DESCONECTARJEBUS
IF %M%==2 GOTO MENU
IF %M%==2 GOTO FIN


rem A partir de aca, comienza el script que recauda informacion sobre la pc objetivo

:INFO
cls
echo -----------------------------------------------------------------------------------------------------------
echo -----------------------------------------------------------------------------------------------------------
echo --------- ---------									--------- ---------
echo --------- ---------									--------- ---------
echo --------- ---------			BIENVENIDO AL SCRIPT				--------- ---------
echo --------- ---------			DE RECOPILACION DE DATOS			--------- ---------
echo --------- ---------			Powered by ME.			--------- ---------
echo --------- ---------									--------- ---------
echo --------- ---------									--------- ---------
echo -----------------------------------------------------------------------------------------------------------
echo -----------------------------------------------------------------------------------------------------------
echo.
echo.

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

echo Si bajo LicenseStatus dice 1, eso significa que ESTA ACTIVADO
echo Si dice 5, significa que NO ESTA activado



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
echo.
echo.
echo.
pause

:CHROME
if exist "c:\Program Files\Google\Chrome" goto :CHROMEEXISTE
:CHROMENOEXISTE
echo 1.CHROME NO ESTA INSTALADO!.
set /p respuesta="Queres instalarlo? [y|n]: "
if /i not "%respuesta%" == "y" goto :FIREFOX9999999999

rem \\jebus\s\BASICOS\ChromeSetup.exe /S
goto :FIREFOX

:CHROMEEXISTE
echo 1.CHROME EXISTE!
pause
goto :FIREFOX

:FIREFOX
if exist "C:\Program Files\Mozilla Firefox" goto :FIREFOXEXISTE
:FIREFOXNOEXISTE
echo 2.FIREFOX NO ESTA INSTALADO!.
set /p respuesta="Queres instalarlo? [y|n]: "
if /i not "%respuesta%" == "y" goto :ADOBE

rem \\jebus\s\BASICOS\Firefox Setup 92.0.exe /S
goto :ADOBE

:FIREFOXEXISTE
echo 2.FIREFOX EXISTE!
pause
goto :ADOBE

:ADOBE
if exist "C:\Program Files\Adobe\Acrobat DC" goto :ADOBEEXISTE
:ADOBENOEXISTE
echo ADOBE READER NO ESTA INSTALADO!.
set /p respuesta="Queres instalarlo? [y|n]: "
if /i not "%respuesta%" == "y" goto :WINRAR
rem \\jebus\s\BASICOS\AcroRdrDC1902120047_es_ES.exe /S
goto :WINRAR

:ADOBEEXISTE
echo 3.ADOBE READER EXISTE!
pause
goto :WINRAR


:WINRAR
if exist "C:\Program Files\WinRAR" goto :WINRAREXISTE
:WINRARNOEXISTE
echo WINRAR NO ESTA INSTALADO!.
set /p respuesta="Queres instalarlo? [y|n]: "
if /i not "%respuesta%" == "y" goto :OFFICE2016

rem \\jebus\s\BASICOS\winrar-x64-580es.exe /S
goto :OFFICE2016


:WINRAREXISTE
echo 4.WINRAR EXISTE!
pause
goto :OFFICE2016

:OFFICE2016
if exist "C:\Program Files\Microsoft Office\Office16" goto :OFFICE2016EXISTE
:OFFICE2016NOEXISTE
echo OFFICE 2016 NO ESTA INSTALADO!.
set /p respuesta="Queres instalarlo? [y|n]: "
if /i not "%respuesta%" == "y" goto :CITRIX

rem \\jebus\s\BASICOS\Office 2016 x64\setup.exe /S
goto :CITRIX

:OFFICE2016EXISTE
echo 5.OFFICE 2016 EXISTE!
pause
goto :CITRIX

:CITRIX
if exist "C:\Program Files (x86)\Citrix\Receiver" goto :CITRIXEXISTE
:CITRIXNOEXISTE
echo CITRIX NO ESTA INSTALADO!.
set /p respuesta="Queres instalarlo? [y|n]: "
if /i not "%respuesta%" == "y" goto :SISSEX

rem \\jebus\s\BASICOS\Citrix Nuevo\CitrixReceiver.exe /S
goto :SISSEX

:CITRIXEXISTE
echo 6.CITRIX EXISTE!
pause
goto :SISSEX

:SISSEX
if exist "C:\Program Files (x86)\SISSEX" goto :SISSEXEXISTE
:SISSEXNOEXISTE
echo SISSEX NO ESTA INSTALADO!.
set /p respuesta="Queres instalarlo? [y|n]: "
if /i not "%respuesta%" == "y" goto :EXITPROGRAMAS
rem \\jebus\s\BASICOS\SISEXsetup.exe /S
goto :EXITPROGRAMAS


:SISSEXEXISTE
echo 7.SISSEX EXISTE! 
pause
goto :EXITPROGRAMAS

:EXITPROGRAMAS
echo.
echo.
echo Esto concluye este modulo. ahora volveran al menu anterior.
pause
goto :MENU

:PROXY
cls
cls
color 01
echo ....................................................................................................
echo                    PROXY ON / OFF
echo.
echo .......... 1- PROXY ON                                                                    ..........
echo .......... 2- PROXY OFF                                                                   ..........
echo .......... 3- VOLVER AL MENU                                                              ..........
echo.
echo ....................................................................................................

SET /P M=Selecciona 1, 2, o 3 y apreta ENTER: 
IF %M%==1 GOTO PROXYON
IF %M%==2 GOTO PROXYOFF
IF %M%==3 GOTO MENU

:PROXYON
echo procedamos a revisar el proxy.
set "respuesta=y"
set /p "respuesta=El Proxy sigue siendo IWSVA:8080 [y|n]: "
if /i not "%respuesta%" == "y" goto :CAMBIARPROXY
echo.
echo.
set "respuesta=n"
set /p "respuesta=Queres poner el proxy? [y|n]: "
if /i not "%respuesta%" == "n" goto :PRIMERAVEZ
echo Ok, volvemos al menu
pause
goto :MENU

:PRIMERAVEZ
set "respuesta=n"
set /p "respuesta=Ok, es la primera vez que se coloca el proxy en esta PC? [y|n]: "
if /i not "%respuesta%" == "n" goto :PORXYPRIMERAVEZ

:PROXYON
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
echo.
echo.
echo El proxy ahora es IWSVA:8080
echo Volvamos al MENU
pause
goto :MENU

:PORXYPRIMERAVEZ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d iwsva:8080
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyUser /t REG_SZ /d 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyPass /t REG_SZ /d 
netsh winhttp import proxy source=ie

echo OK, el proxy fue correctamente seteado!
echo Volvamos al Menu
pause
goto :MENU

:CAMBIARPROXY
echo Ups, parece que nos encontramos con un leve problema tecnico. Vuelva cuando sepa como modificar esto!.
pause
goto :MENU



:PROXYOFF
set "respuestay"
set /p "respuesta=Queres desactivar el PROXY? [y|n]: "
if /i not "%respuesta%" == "y" goto :MENU
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
echo.
echo El proxy fue desactivado correctamente.
echo Volvamos al MENU.
SET /P M=Selecciona 1 para IR AL MENU o 2 para FINALIZAR EL PROGRAMA: 
IF %M%==1 GOTO MENU
IF %M%==2 GOTO FIN


:SOPORTE
cls
echo Aun estamos trabajando en esto!. vuelva pronto!
echo.
echo.
SET /P M=Selecciona 1 para IR AL MENU o 2 para FINALIZAR EL PROGRAMA: 
IF %M%==1 GOTO MENU
IF %M%==2 GOTO FIN

:IMPRESORAS

color 02
cls
REM Script original creado por conankiz (07-02-2021) Modificado por NMRD en 2022

echo ....................................................................................................
echo                            MENU DE INSTALACION DE IMPRESORAS TCP/IP
echo.
echo .......... 1- RICOH C307                                                                  ..........
echo .......... 2- RICOH IM 430                                                                ..........
echo .......... 3- RICOH P 502                                                                 ..........
echo .......... 4- RICOH IM 550                                                                ..........
echo .......... 5- RICOH 4054                                                                  ..........
echo .......... 6- RICOH C4503                                                                 ..........
echo .......... 7- RICOH SP 5300DN                                                             ..........
echo .......... 8- SAMSUNG MULTIEXPRESS 6555                                                   ..........
echo .......... 9- HP x476dw                                                                   ..........
echo .......... 10- Volver al MENU                                                             ..........
echo.
echo ....................................................................................................

SET /P M=Selecciona 1, 2, 3, 4, 5, 6, 7, 8, 9 o 10 y apreta ENTER: 
IF %M%==1 GOTO RICOH307
IF %M%==2 GOTO RICOH430
IF %M%==3 GOTO RICOH502
IF %M%==4 GOTO RICOH550
IF %M%==5 GOTO RICOH4054
IF %M%==6 GOTO RICOH4503
IF %M%==7 GOTO RICOH5300
IF %M%==8 GOTO SAMSUNG6555
IF %M%==9 GOTO HPx476
IF %M%==10 GOTO MENU




:RICOH307

echo ----------------------------------------------------------------------------------------------------------
echo.
echo.
echo -------------------------- SCRIPT DE INSTALACION DE IMPRESORA RICOH 307 ----------------------------------
echo.
echo.
echo ----------------------------------------------------------------------------------------------------------

echo Vamos a proceder a realizar la instacion de la impresora RICOH 307 en la maquina de destino
echo Para esto, debemos conocer la direccion IP que tiene asignada nuestra impresora
echo.
echo.
rem aca generamos la variable con el valor IP de cada impresora
set /p Ip_Printer="Por favor, escribi el numero de IP que tiene la impresora : "

rem aca buscamos la direccion donde se encuentra el archivo (distintos IDIOMAS tienen distintas rutas. OJO)
set Printingvbs=C:\Windows\System32\Printing_Admin_Scripts\es-ES

set "respuesta=y"
set /p "respuesta= Estas en una PC de 64bits? [y|n]: "
if /i not "%respuesta%" == "y" goto :R307-32

:R307-64
rem aca colocamos la ruta que tendra la carpeta que contenga todos los drivers. 
set DriversFolder="\\jebus\i\DRIVERS PARA IMAGENES\RICOH\Ricoh MP C307\x64\disk1"

rem Aca colocamos el nombre que tiene que tener la impresora. El nombre debe ser el mismo que figura en el .inf de instalacion.
set NamePrinter="RICOH MP C307 PCL 6"

rem Aca colocamos el nombre que tiene el .inf
set NamePrinterInstall="RICOH MP C307 PCL 6"
goto :RICOH307-GO

:R307-32
rem aca colocamos la ruta que tendra la carpeta que contenga todos los drivers. 
set DriversFolder="\\jebus\i\DRIVERS PARA IMAGENES\RICOH\Ricoh MP C307\x32\disk1"

rem Aca colocamos el nombre que tiene que tener la impresora. El nombre debe ser el mismo que figura en el .inf de instalacion.
set NamePrinter="RICOH MP C307 PCL 6"

rem Aca colocamos el nombre que tiene el .inf
set NamePrinterInstall="RICOH MP C307 PCL 6"

:RICOH307-GO

echo Primero borramos cualquier impresora que tenga el nombre de aquella que queremos instalar. Para evitar conflictos.
cscript %Printingvbs%\Prnmngr.vbs -d -p %NamePrinterInstall%
cscript %Printingvbs%\Prnport.vbs -d -r %Ip_Printer%
pause

echo Luego procedemos a generar un puerto con el numero IP que colocamos previamente (%Ip_Printer%)
Cscript %Printingvbs%\Prnport.vbs -a -r %Ip_Printer% -h %Ip_Printer% -o raw -n 9100

pause
echo Ahora instalaremos el driver de la impresora.
Cscript %Printingvbs%\Prndrvr.vbs -a -m %NamePrinter% -i %DriversFolder%\oemsetup.inf -h %DriversFolder%

pause
echo Por ultimo, le damos nombre a la impresora. 
REM Cscript %Printingvbs%\Prnmngr.vbs -a -p %NamePrintInstall% -m %NamePrinter% -r %Ip_Printer%
Cscript %Printingvbs%\Prnmngr.vbs -a -p %NamePrinterInstall% -m %NamePrinter% -r %Ip_Printer%

pause
echo.
echo.
echo FINALIZADO. Deberian poder ver la impresora ya instalada.
echo.
echo.
echo Actualmente la impresora predeterminada es:
Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -g

set "respuesta=y"
set /p "respuesta= Queres cambiar la impresora determinada a la que instalaste recien (%NamePrinter%) [y|n]: "
if /i not "%respuesta%" == "y" goto :R307-TEST

Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -t -p "RICOH MP C307 PCL 6"

echo.
echo.
echo Revisemos si se cambio, ahora la impresora por defecto es:
Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -g

:R307-TEST
echo.
echo.
set "respuesta=y"
set /p "respuesta= Queres imprimir una pagina de prueba? (%NamePrinter%) [y|n]: "
if /i not "%respuesta%" == "y" goto :MENU-PRINTER
rundll32 printui.dll,PrintUIEntry /k /n"RICOH MP C307 PCL 6"
goto :MENU-PRINTER


:RICOH430
cls
echo ----------------------------------------------------------------------------------------------------------
echo.
echo.
echo -------------------------- SCRIPT DE INSTALACION DE IMPRESORA RICOH IM 430 -------------------------------
echo.
echo.
echo ----------------------------------------------------------------------------------------------------------

echo Vamos a proceder a realizar la instacion de la impresora RICOH 430 en la maquina de destino
echo Para esto, debemos conocer la direccion IP que tiene asignada nuestra impresora
echo.
echo.
rem aca generamos la variable con el valor IP de cada impresora
set /p Ip_Printer="Por favor, escribi el numero de IP que tiene la impresora : "

rem aca buscamos la direccion donde se encuentra el archivo (distintos IDIOMAS tienen distintas rutas. OJO)
set Printingvbs=C:\Windows\System32\Printing_Admin_Scripts\es-ES

set "respuesta=y"
set /p "respuesta= Estas en una PC de 64bits? [y|n]: "
if /i not "%respuesta%" == "y" goto :R430-32

:R430-64
rem aca colocamos la ruta que tendra la carpeta que contenga todos los drivers. 
set DriversFolder="\\jebus\i\DRIVERS PARA IMAGENES\RICOH\Ricoh IM 430F\64bit\disk1"

rem Aca colocamos el nombre que tiene que tener la impresora. El nombre debe ser el mismo que figura en el .inf de instalacion.
set NamePrinter="RICOH IM 430 PCL 6"

rem Aca colocamos el nombre que tiene el .inf
set NamePrinterInstall="RICOH IM 430 PCL 6"
goto :RICOH430-GO

:R430-32
rem aca colocamos la ruta que tendra la carpeta que contenga todos los drivers. 
set DriversFolder="\\jebus\i\DRIVERS PARA IMAGENES\RICOH\Ricoh IM 430F\32bit\disk1"

rem Aca colocamos el nombre que tiene que tener la impresora. El nombre debe ser el mismo que figura en el .inf de instalacion.
set NamePrinter="RICOH IM 430 PCL 6"

rem Aca colocamos el nombre que tiene el .inf
set NamePrinterInstall="RICOH IM 430 PCL 6"

:RICOH430-GO

echo Primero borramos cualquier impresora que tenga el nombre de aquella que queremos instalar. Para evitar conflictos.
cscript %Printingvbs%\Prnmngr.vbs -d -p %NamePrinterInstall%
cscript %Printingvbs%\Prnport.vbs -d -r %Ip_Printer%
pause

echo Luego procedemos a generar un puerto con el numero IP que colocamos previamente (%Ip_Printer%)
Cscript %Printingvbs%\Prnport.vbs -a -r %Ip_Printer% -h %Ip_Printer% -o raw -n 9100

pause
echo Ahora instalaremos el driver de la impresora.
Cscript %Printingvbs%\Prndrvr.vbs -a -m %NamePrinter% -i %DriversFolder%\oemsetup.inf -h %DriversFolder%

pause
echo Por ultimo, le damos nombre a la impresora. 
REM Cscript %Printingvbs%\Prnmngr.vbs -a -p %NamePrintInstall% -m %NamePrinter% -r %Ip_Printer%
Cscript %Printingvbs%\Prnmngr.vbs -a -p %NamePrinterInstall% -m %NamePrinter% -r %Ip_Printer%

pause
echo.
echo.
echo FINALIZADO. Deberian poder ver la impresora ya instalada.
echo.
echo.
echo Actualmente la impresora predeterminada es:
Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -g

set "respuesta=y"
set /p "respuesta= Queres cambiar la impresora determinada a la que instalaste recien (%NamePrinter%) [y|n]: "
if /i not "%respuesta%" == "y" goto :R430-TEST

Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -t -p "RICOH IM 430 PCL 6"

echo.
echo.
echo Revisemos si se cambio, ahora la impresora por defecto es:
Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -g

:R430-TEST
echo.
echo.
set "respuesta=y"
set /p "respuesta= Queres imprimir una pagina de prueba? (%NamePrinter%) [y|n]: "
if /i not "%respuesta%" == "y" goto :MENU-PRINTER
rundll32 printui.dll,PrintUIEntry /k /n"RICOH IM 430 PCL 6"
goto :MENU-PRINTER


:RICOH502

echo ----------------------------------------------------------------------------------------------------------
echo.
echo.
echo -------------------------- SCRIPT DE INSTALACION DE IMPRESORA RICOH P 502 --------------------------------
echo.
echo.
echo ----------------------------------------------------------------------------------------------------------

echo Vamos a proceder a realizar la instacion de la impresora RICOH P 502 en la maquina de destino
echo Para esto, debemos conocer la direccion IP que tiene asignada nuestra impresora
echo.
echo.
rem aca generamos la variable con el valor IP de cada impresora
set /p Ip_Printer="Por favor, escribi el numero de IP que tiene la impresora : "

rem aca buscamos la direccion donde se encuentra el archivo (distintos IDIOMAS tienen distintas rutas. OJO)
set Printingvbs=C:\Windows\System32\Printing_Admin_Scripts\es-ES

set "respuesta=y"
set /p "respuesta= Estas en una PC de 64bits? [y|n]: "
if /i not "%respuesta%" == "y" goto :R502-32

:R502-64
rem aca colocamos la ruta que tendra la carpeta que contenga todos los drivers. 
set DriversFolder="\\jebus\i\DRIVERS PARA IMAGENES\RICOH\Ricoh P 502\x 64\disk1"

rem Aca colocamos el nombre que tiene que tener la impresora. El nombre debe ser el mismo que figura en el .inf de instalacion.
set NamePrinter="RICOH P 502 PCL 6"

rem Aca colocamos el nombre que tiene el .inf
set NamePrinterInstall="RICOH P 502 PCL 6"
goto :RICOH502-GO

:R502-32
rem aca colocamos la ruta que tendra la carpeta que contenga todos los drivers. 
set DriversFolder="\\jebus\i\DRIVERS PARA IMAGENES\RICOH\Ricoh P 502\x 32\disk1"

rem Aca colocamos el nombre que tiene que tener la impresora. El nombre debe ser el mismo que figura en el .inf de instalacion.
set NamePrinter="RICOH P 502 PCL 6"

rem Aca colocamos el nombre que tiene el .inf
set NamePrinterInstall="RICOH P 502 PCL 6"

:RICOH502-GO

echo Primero borramos cualquier impresora que tenga el nombre de aquella que queremos instalar. Para evitar conflictos.
cscript %Printingvbs%\Prnmngr.vbs -d -p %NamePrinterInstall%
cscript %Printingvbs%\Prnport.vbs -d -r %Ip_Printer%
pause

echo Luego procedemos a generar un puerto con el numero IP que colocamos previamente (%Ip_Printer%)
Cscript %Printingvbs%\Prnport.vbs -a -r %Ip_Printer% -h %Ip_Printer% -o raw -n 9100

pause
echo Ahora instalaremos el driver de la impresora.
Cscript %Printingvbs%\Prndrvr.vbs -a -m %NamePrinter% -i %DriversFolder%\oemsetup.inf -h %DriversFolder%

pause
echo Por ultimo, le damos nombre a la impresora. 
REM Cscript %Printingvbs%\Prnmngr.vbs -a -p %NamePrintInstall% -m %NamePrinter% -r %Ip_Printer%
Cscript %Printingvbs%\Prnmngr.vbs -a -p %NamePrinterInstall% -m %NamePrinter% -r %Ip_Printer%

pause
echo.
echo.
echo FINALIZADO. Deberian poder ver la impresora ya instalada.
echo.
echo.
echo Actualmente la impresora predeterminada es:
Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -g

set "respuesta=y"
set /p "respuesta= Queres cambiar la impresora determinada a la que instalaste recien (%NamePrinter%) [y|n]: "
if /i not "%respuesta%" == "y" goto :R502-TEST

Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -t -p "RICOH P 502 PCL 6"

echo.
echo.
echo Revisemos si se cambio, ahora la impresora por defecto es:
Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -g

:R502-TEST
echo.
echo.
set "respuesta=y"
set /p "respuesta= Queres imprimir una pagina de prueba? (%NamePrinter%) [y|n]: "
if /i not "%respuesta%" == "y" goto :MENU-PRINTER
rundll32 printui.dll,PrintUIEntry /k /n"RICOH P 502 PCL 6"
goto :MENU-PRINTER



:RICOH550

echo ----------------------------------------------------------------------------------------------------------
echo.
echo.
echo -------------------------- SCRIPT DE INSTALACION DE IMPRESORA RICOH IM 550 -------------------------------
echo.
echo.
echo ----------------------------------------------------------------------------------------------------------

echo Vamos a proceder a realizar la instacion de la impresora RICOH P 550 en la maquina de destino
echo Para esto, debemos conocer la direccion IP que tiene asignada nuestra impresora
echo.
echo.
rem aca generamos la variable con el valor IP de cada impresora
set /p Ip_Printer="Por favor, escribi el numero de IP que tiene la impresora : "

rem aca buscamos la direccion donde se encuentra el archivo (distintos IDIOMAS tienen distintas rutas. OJO)
set Printingvbs=C:\Windows\System32\Printing_Admin_Scripts\es-ES

set "respuesta=y"
set /p "respuesta= Estas en una PC de 64bits? [y|n]: "
if /i not "%respuesta%" == "y" goto :R550-32

:R550-64
rem aca colocamos la ruta que tendra la carpeta que contenga todos los drivers. 
set DriversFolder="\\jebus\i\DRIVERS PARA IMAGENES\RICOH\Ricoh IM 550\x64\disk1"

rem Aca colocamos el nombre que tiene que tener la impresora. El nombre debe ser el mismo que figura en el .inf de instalacion.
set NamePrinter="RICOH IM 550 PCL 6"

rem Aca colocamos el nombre que tiene el .inf
set NamePrinterInstall="RICOH IM 550 PCL 6"
goto :RICOH550-GO

:R550-32
rem aca colocamos la ruta que tendra la carpeta que contenga todos los drivers. 
set DriversFolder="\\jebus\i\DRIVERS PARA IMAGENES\RICOH\Ricoh IM 550\x32\disk1"

rem Aca colocamos el nombre que tiene que tener la impresora. El nombre debe ser el mismo que figura en el .inf de instalacion.
set NamePrinter="RICOH IM 550 PCL 6"

rem Aca colocamos el nombre que tiene el .inf
set NamePrinterInstall="RICOH IM 550 PCL 6"

:RICOH550-GO

echo Primero borramos cualquier impresora que tenga el nombre de aquella que queremos instalar. Para evitar conflictos.
cscript %Printingvbs%\Prnmngr.vbs -d -p %NamePrinterInstall%
cscript %Printingvbs%\Prnport.vbs -d -r %Ip_Printer%
pause

echo Luego procedemos a generar un puerto con el numero IP que colocamos previamente (%Ip_Printer%)
Cscript %Printingvbs%\Prnport.vbs -a -r %Ip_Printer% -h %Ip_Printer% -o raw -n 9100

pause
echo Ahora instalaremos el driver de la impresora.
Cscript %Printingvbs%\Prndrvr.vbs -a -m %NamePrinter% -i %DriversFolder%\oemsetup.inf -h %DriversFolder%

pause
echo Por ultimo, le damos nombre a la impresora. 
REM Cscript %Printingvbs%\Prnmngr.vbs -a -p %NamePrintInstall% -m %NamePrinter% -r %Ip_Printer%
Cscript %Printingvbs%\Prnmngr.vbs -a -p %NamePrinterInstall% -m %NamePrinter% -r %Ip_Printer%

pause
echo.
echo.
echo FINALIZADO. Deberian poder ver la impresora ya instalada.
echo.
echo.
echo Actualmente la impresora predeterminada es:
Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -g

set "respuesta=y"
set /p "respuesta= Queres cambiar la impresora determinada a la que instalaste recien (%NamePrinter%) [y|n]: "
if /i not "%respuesta%" == "y" goto :R550-TEST

:R550-TEST
echo.
echo.
set "respuesta=y"
set /p "respuesta= Queres imprimir una pagina de prueba? (%NamePrinter%) [y|n]: "
if /i not "%respuesta%" == "y" goto :MENU-PRINTER
rundll32 printui.dll,PrintUIEntry /k /n"RICOH MP 4054 PCL 6"
goto :MENU-PRINTER




:RICOH4054

echo ----------------------------------------------------------------------------------------------------------
echo.
echo.
echo -------------------------- SCRIPT DE INSTALACION DE IMPRESORA RICOH 4054 ----------------------------------
echo.
echo.
echo ----------------------------------------------------------------------------------------------------------
echo Vamos a proceder a realizar la instacion de la impresora RICOH MP 4054 PCL 6 en la maquina de destino
echo Para esto, debemos conocer la direccion IP que tiene asignada nuestra impresora
echo.
echo.
rem aca generamos la variable con el valor IP de cada impresora
set /p Ip_Printer="Por favor, escribi el numero de IP que tiene la impresora : "

rem aca buscamos la direccion donde se encuentra el archivo (distintos IDIOMAS tienen distintas rutas. OJO)
set Printingvbs=C:\Windows\System32\Printing_Admin_Scripts\es-ES

set "respuesta=y"
set /p "respuesta= Estas en una PC de 64bits? [y|n]: "
if /i not "%respuesta%" == "y" goto :R4054-32

:R4054-64
rem aca colocamos la ruta que tendra la carpeta que contenga todos los drivers. 
set DriversFolder="\\jebus\s\Drivers\RICOH\Ricoh 4054\64 bits\disk1"

rem Aca colocamos el nombre que tiene que tener la impresora. El nombre debe ser el mismo que figura en el .inf de instalacion.
set NamePrinter="RICOH MP 4054 PCL 6"

rem Aca colocamos el nombre que tiene el .inf
set NamePrinterInstall="RICOH MP 4054 PCL 6"
goto :RICOH4054-GO

:R4054-32
rem aca colocamos la ruta que tendra la carpeta que contenga todos los drivers. 
set DriversFolder="\\jebus\s\Drivers\RICOH\Ricoh 4054\32 bits\disk1"

rem Aca colocamos el nombre que tiene que tener la impresora. El nombre debe ser el mismo que figura en el .inf de instalacion.
set NamePrinter="RICOH MP 4054 PCL 6"

rem Aca colocamos el nombre que tiene el .inf
set NamePrinterInstall="RICOH MP 4054 PCL 6"

:RICOH4054-GO

echo Primero borramos cualquier impresora que tenga el nombre de aquella que queremos instalar. Para evitar conflictos.
cscript %Printingvbs%\Prnmngr.vbs -d -p %NamePrinterInstall%
cscript %Printingvbs%\Prnport.vbs -d -r %Ip_Printer%
pause

echo Luego procedemos a generar un puerto con el numero IP que colocamos previamente (%Ip_Printer%)
Cscript %Printingvbs%\Prnport.vbs -a -r %Ip_Printer% -h %Ip_Printer% -o raw -n 9100

pause
echo Ahora instalaremos el driver de la impresora.
Cscript %Printingvbs%\Prndrvr.vbs -a -m %NamePrinter% -i %DriversFolder%\oemsetup.inf -h %DriversFolder%

pause
echo Por ultimo, le damos nombre a la impresora. 
REM Cscript %Printingvbs%\Prnmngr.vbs -a -p %NamePrintInstall% -m %NamePrinter% -r %Ip_Printer%
Cscript %Printingvbs%\Prnmngr.vbs -a -p %NamePrinterInstall% -m %NamePrinter% -r %Ip_Printer%

pause
echo.
echo.
echo FINALIZADO. Deberian poder ver la impresora ya instalada.
echo.
echo.
echo Actualmente la impresora predeterminada es:
Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -g

set "respuesta=y"
set /p "respuesta= Queres cambiar la impresora determinada a la que instalaste recien (%NamePrinter%) [y|n]: "
if /i not "%respuesta%" == "y" goto :R4054-TEST

Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -t -p "RICOH MP 4054 PCL 6"

echo.
echo.
echo Revisemos si se cambio, ahora la impresora por defecto es:
Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -g

:R4054-TEST
echo.
echo.
set "respuesta=y"
set /p "respuesta= Queres imprimir una pagina de prueba? (%NamePrinter%) [y|n]: "
if /i not "%respuesta%" == "y" goto :MENU-PRINTER
rundll32 printui.dll,PrintUIEntry /k /n"RICOH MP 4054 PCL 6"
goto :MENU-PRINTER


:RICOH4503

echo ----------------------------------------------------------------------------------------------------------
echo.
echo.
echo -------------------------- SCRIPT DE INSTALACION DE IMPRESORA RICOH C 4503 -------------------------------
echo.
echo.
echo ----------------------------------------------------------------------------------------------------------
echo Vamos a proceder a realizar la instacion de la impresora RICOH C 4503 en la maquina de destino
echo Para esto, debemos conocer la direccion IP que tiene asignada nuestra impresora
echo.
echo.
rem aca generamos la variable con el valor IP de cada impresora
set /p Ip_Printer="Por favor, escribi el numero de IP que tiene la impresora : "

rem aca buscamos la direccion donde se encuentra el archivo (distintos IDIOMAS tienen distintas rutas. OJO)
set Printingvbs=C:\Windows\System32\Printing_Admin_Scripts\es-ES

set "respuesta=y"
set /p "respuesta= Estas en una PC de 64bits? [y|n]: "
if /i not "%respuesta%" == "y" goto :R4503-32

:R4503-64
rem aca colocamos la ruta que tendra la carpeta que contenga todos los drivers. 
set DriversFolder="\\jebus\i\DRIVERS PARA IMAGENES\RICOH\Ricoh MP C4503\x64\disk1"

rem Aca colocamos el nombre que tiene que tener la impresora. El nombre debe ser el mismo que figura en el .inf de instalacion.
set NamePrinter="RICOH MP C4503 PCL 6"

rem Aca colocamos el nombre que tiene el .inf
set NamePrinterInstall="RICOH MP C4503 PCL 6"
goto :RICOH4503-GO

:R4503-32
rem aca colocamos la ruta que tendra la carpeta que contenga todos los drivers. 
set DriversFolder="\\jebus\i\DRIVERS PARA IMAGENES\RICOH\Ricoh MP C4503\x32\disk1"

rem Aca colocamos el nombre que tiene que tener la impresora. El nombre debe ser el mismo que figura en el .inf de instalacion.
set NamePrinter="RICOH MP C4503 PCL 6"

rem Aca colocamos el nombre que tiene el .inf
set NamePrinterInstall="RICOH MP C4503 PCL 6"

:RICOH4503-GO

echo Primero borramos cualquier impresora que tenga el nombre de aquella que queremos instalar. Para evitar conflictos.
cscript %Printingvbs%\Prnmngr.vbs -d -p %NamePrinterInstall%
cscript %Printingvbs%\Prnport.vbs -d -r %Ip_Printer%
pause

echo Luego procedemos a generar un puerto con el numero IP que colocamos previamente (%Ip_Printer%)
Cscript %Printingvbs%\Prnport.vbs -a -r %Ip_Printer% -h %Ip_Printer% -o raw -n 9100

pause
echo Ahora instalaremos el driver de la impresora.
Cscript %Printingvbs%\Prndrvr.vbs -a -m %NamePrinter% -i %DriversFolder%\oemsetup.inf -h %DriversFolder%

pause
echo Por ultimo, le damos nombre a la impresora. 
REM Cscript %Printingvbs%\Prnmngr.vbs -a -p %NamePrintInstall% -m %NamePrinter% -r %Ip_Printer%
Cscript %Printingvbs%\Prnmngr.vbs -a -p %NamePrinterInstall% -m %NamePrinter% -r %Ip_Printer%

pause
echo.
echo.
echo FINALIZADO. Deberian poder ver la impresora ya instalada.
echo.
echo.
echo Actualmente la impresora predeterminada es:
Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -g

set "respuesta=y"
set /p "respuesta= Queres cambiar la impresora determinada a la que instalaste recien (%NamePrinter%) [y|n]: "
if /i not "%respuesta%" == "y" goto :R4503-TEST

Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -t -p "RICOH MP C4503 PCL 6"

echo.
echo.
echo Revisemos si se cambio, ahora la impresora por defecto es:
Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -g

:R4503-TEST
echo.
echo.
set "respuesta=y"
set /p "respuesta= Queres imprimir una pagina de prueba? (%NamePrinter%) [y|n]: "
if /i not "%respuesta%" == "y" goto :MENU-PRINTER
rundll32 printui.dll,PrintUIEntry /k /n"RICOH MP C4503 PCL 6"
goto :MENU-PRINTER




:RICOH5300

echo ----------------------------------------------------------------------------------------------------------
echo.
echo.
echo -------------------------- SCRIPT DE INSTALACION DE IMPRESORA RICOH SP 5300DN ----------------------------
echo.
echo.
echo ----------------------------------------------------------------------------------------------------------
echo Vamos a proceder a realizar la instacion de la impresora RICOH SP 5300 PCL 6 en la maquina de destino
echo Para esto, debemos conocer la direccion IP que tiene asignada nuestra impresora
echo.
echo.
rem aca generamos la variable con el valor IP de cada impresora
set /p Ip_Printer="Por favor, escribi el numero de IP que tiene la impresora : "

rem aca buscamos la direccion donde se encuentra el archivo (distintos IDIOMAS tienen distintas rutas. OJO)
set Printingvbs=C:\Windows\System32\Printing_Admin_Scripts\es-ES

set "respuesta=y"
set /p "respuesta= Estas en una PC de 64bits? [y|n]: "
if /i not "%respuesta%" == "y" goto :R5300-32

:R5300-64
rem aca colocamos la ruta que tendra la carpeta que contenga todos los drivers. 
set DriversFolder="\\jebus\s\Drivers\RICOH\Ricoh SP 5300DN\64 Bits\disk1"

rem Aca colocamos el nombre que tiene que tener la impresora. El nombre debe ser el mismo que figura en el .inf de instalacion.
set NamePrinter="RICOH SP 5300 PCL 6"

rem Aca colocamos el nombre que tiene el .inf
set NamePrinterInstall="RICOH SP 5300 PCL 6"
goto :RICOH5300-GO

:R5300-32
rem aca colocamos la ruta que tendra la carpeta que contenga todos los drivers. 
set DriversFolder="\\jebus\s\Drivers\RICOH\Ricoh SP 5300DN\32 Bits\disk1"

rem Aca colocamos el nombre que tiene que tener la impresora. El nombre debe ser el mismo que figura en el .inf de instalacion.
set NamePrinter="RICOH SP 5300 PCL 6"

rem Aca colocamos el nombre que tiene el .inf
set NamePrinterInstall="RICOH SP 5300 PCL 6"

:RICOH5300-GO

echo Primero borramos cualquier impresora que tenga el nombre de aquella que queremos instalar. Para evitar conflictos.
cscript %Printingvbs%\Prnmngr.vbs -d -p %NamePrinterInstall%
cscript %Printingvbs%\Prnport.vbs -d -r %Ip_Printer%
pause

echo Luego procedemos a generar un puerto con el numero IP que colocamos previamente (%Ip_Printer%)
Cscript %Printingvbs%\Prnport.vbs -a -r %Ip_Printer% -h %Ip_Printer% -o raw -n 9100

pause
echo Ahora instalaremos el driver de la impresora.
Cscript %Printingvbs%\Prndrvr.vbs -a -m %NamePrinter% -i %DriversFolder%\oemsetup.inf -h %DriversFolder%

pause
echo Por ultimo, le damos nombre a la impresora. 
REM Cscript %Printingvbs%\Prnmngr.vbs -a -p %NamePrintInstall% -m %NamePrinter% -r %Ip_Printer%
Cscript %Printingvbs%\Prnmngr.vbs -a -p %NamePrinterInstall% -m %NamePrinter% -r %Ip_Printer%

pause
echo.
echo.
echo FINALIZADO. Deberian poder ver la impresora ya instalada.
echo.
echo.
echo Actualmente la impresora predeterminada es:
Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -g

set "respuesta=y"
set /p "respuesta= Queres cambiar la impresora determinada a la que instalaste recien (%NamePrinter%) [y|n]: "
if /i not "%respuesta%" == "y" goto :R5300-TEST

Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -t -p "RICOH SP 5300 PCL 6"

echo.
echo.
echo Revisemos si se cambio, ahora la impresora por defecto es:
Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -g

:R5300-TEST
echo.
echo.
set "respuesta=y"
set /p "respuesta= Queres imprimir una pagina de prueba? (%NamePrinter%) [y|n]: "
if /i not "%respuesta%" == "y" goto :MENU-PRINTER
rundll32 printui.dll,PrintUIEntry /k /n"RICOH SP 5300 PCL 6"
goto :MENU-PRINTER



:SAMSUNG6555

echo ----------------------------------------------------------------------------------------------------------
echo.
echo.
echo -------------------------- SCRIPT DE INSTALACION DE IMPRESORA MULTIEXPRESS 6555 --------------------------
echo.
echo.
echo ----------------------------------------------------------------------------------------------------------

echo Vamos a proceder a realizar la instacion de la impresora Samsung MULTIEXPRESS 6555 en la maquina de destino
echo Para esto, debemos conocer la direccion IP que tiene asignada nuestra impresora
echo.
echo.
rem aca generamos la variable con el valor IP de cada impresora
set /p Ip_Printer="Por favor, escribi el numero de IP que tiene la impresora : "

rem aca buscamos la direccion donde se encuentra el archivo (distintos IDIOMAS tienen distintas rutas. OJO)
set Printingvbs=C:\Windows\System32\Printing_Admin_Scripts\es-ES

set "respuesta=y"
set /p "respuesta= Estas en una PC de 64bits? [y|n]: "
if /i not "%respuesta%" == "y" goto :R6555-32

:R6555-64
rem aca colocamos la ruta que tendra la carpeta que contenga todos los drivers. 
set DriversFolder="\\jebus\s\Drivers\SAMSUNG\MultiExpress 6555 GENERICO\Printer\UPD_PS"

rem Aca colocamos el nombre que tiene que tener la impresora. El nombre debe ser el mismo que figura en el .inf de instalacion.
set NamePrinter="Samsung Universal Print Driver 3 PS"

rem Aca colocamos el nombre que tiene el .inf
set NamePrinterInstall="Samsung Universal Print Driver 3 PS"
goto :RICOH6555-GO

:R6555-32
rem aca colocamos la ruta que tendra la carpeta que contenga todos los drivers. 
set DriversFolder="\\jebus\s\Drivers\SAMSUNG\MultiExpress 6555 GENERICO\Printer\UPD_PS"

rem Aca colocamos el nombre que tiene que tener la impresora. El nombre debe ser el mismo que figura en el .inf de instalacion.
set NamePrinter="Samsung Universal Print Driver 3 PS"

rem Aca colocamos el nombre que tiene el .inf
set NamePrinterInstall="Samsung Universal Print Driver 3 PS"

:RICOH6555-GO

echo Primero borramos cualquier impresora que tenga el nombre de aquella que queremos instalar. Para evitar conflictos.
cscript %Printingvbs%\Prnmngr.vbs -d -p %NamePrinterInstall%
cscript %Printingvbs%\Prnport.vbs -d -r %Ip_Printer%
pause

echo Luego procedemos a generar un puerto con el numero IP que colocamos previamente (%Ip_Printer%)
Cscript %Printingvbs%\Prnport.vbs -a -r %Ip_Printer% -h %Ip_Printer% -o raw -n 9100

pause
echo Ahora instalaremos el driver de la impresora.
Cscript %Printingvbs%\Prndrvr.vbs -a -m %NamePrinter% -i %DriversFolder%\up015.inf -h %DriversFolder%

pause
echo Por ultimo, le damos nombre a la impresora. 
REM Cscript %Printingvbs%\Prnmngr.vbs -a -p %NamePrintInstall% -m %NamePrinter% -r %Ip_Printer%
Cscript %Printingvbs%\Prnmngr.vbs -a -p %NamePrinterInstall% -m %NamePrinter% -r %Ip_Printer%

pause
echo.
echo.
echo FINALIZADO. Deberian poder ver la impresora ya instalada.
echo.
echo.
echo Actualmente la impresora predeterminada es:
Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -g

set "respuesta=y"
set /p "respuesta= Queres cambiar la impresora determinada a la que instalaste recien (%NamePrinter%) [y|n]: "
if /i not "%respuesta%" == "y" goto :R6555-TEST

Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -t -p "Samsung Universal Print Driver 3 PS"

echo.
echo.
echo Revisemos si se cambio, ahora la impresora por defecto es:
Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -g

:R6555-TEST
echo.
echo.
set "respuesta=y"
set /p "respuesta= Queres imprimir una pagina de prueba? (%NamePrinter%) [y|n]: "
if /i not "%respuesta%" == "y" goto :MENU-PRINTER
rundll32 printui.dll,PrintUIEntry /k /n"Samsung Universal Print Driver 3 PS"
goto :MENU-PRINTER



:HPx476

echo ----------------------------------------------------------------------------------------------------------
echo.
echo.
echo -------------------------- SCRIPT DE INSTALACION DE IMPRESORA HP x476dw ----------------------------------
echo.
echo.
echo ----------------------------------------------------------------------------------------------------------
echo Vamos a proceder a realizar la instacion de la impresora HP Officejet Pro X476dw MFP PCL 6 en la maquina de destino
echo Para esto, debemos conocer la direccion IP que tiene asignada nuestra impresora
echo.
echo.
rem aca generamos la variable con el valor IP de cada impresora
set /p Ip_Printer="Por favor, escribi el numero de IP que tiene la impresora : "

rem aca buscamos la direccion donde se encuentra el archivo (distintos IDIOMAS tienen distintas rutas. OJO)
set Printingvbs=C:\Windows\System32\Printing_Admin_Scripts\es-ES

set "respuesta=y"
set /p "respuesta= Estas en una PC de 64bits? [y|n]: "
if /i not "%respuesta%" == "y" goto :Rx476-32

:Rx476-64
rem aca colocamos la ruta que tendra la carpeta que contenga todos los drivers. 
set DriversFolder="\\jebus\s\Drivers\HP\HP Universal Print Driver\ps-x64-7.0.1.24923"

rem Aca colocamos el nombre que tiene que tener la impresora. El nombre debe ser el mismo que figura en el .inf de instalacion.
set NamePrinter="HP Universal Printing PS"

rem Aca colocamos el nombre que tiene el .inf
set NamePrinterInstall="HP Universal Printing PS"
goto :RICOHx476-GO

:Rx476-32
rem aca colocamos la ruta que tendra la carpeta que contenga todos los drivers. 
set DriversFolder="\\jebus\s\Drivers\HP\HP Universal Print Driver\ps-x64-7.0.1.24923"

rem Aca colocamos el nombre que tiene que tener la impresora. El nombre debe ser el mismo que figura en el .inf de instalacion.
set NamePrinter="HP Universal Printing PS"

rem Aca colocamos el nombre que tiene el .inf
set NamePrinterInstall="HP Universal Printing PS"

:RICOHx476-GO

echo Primero borramos cualquier impresora que tenga el nombre de aquella que queremos instalar. Para evitar conflictos.
cscript %Printingvbs%\Prnmngr.vbs -d -p %NamePrinterInstall%
cscript %Printingvbs%\Prnport.vbs -d -r %Ip_Printer%
pause

echo Luego procedemos a generar un puerto con el numero IP que colocamos previamente (%Ip_Printer%)
Cscript %Printingvbs%\Prnport.vbs -a -r %Ip_Printer% -h %Ip_Printer% -o raw -n 9100

pause
echo Ahora instalaremos el driver de la impresora.
Cscript %Printingvbs%\Prndrvr.vbs -a -m %NamePrinter% -i %DriversFolder%\hpcu255v.inf -h %DriversFolder%

pause
echo Por ultimo, le damos nombre a la impresora. 
REM Cscript %Printingvbs%\Prnmngr.vbs -a -p %NamePrintInstall% -m %NamePrinter% -r %Ip_Printer%
Cscript %Printingvbs%\Prnmngr.vbs -a -p %NamePrinterInstall% -m %NamePrinter% -r %Ip_Printer%

pause
echo.
echo.
echo FINALIZADO. Deberian poder ver la impresora ya instalada.
echo.
echo.
echo Actualmente la impresora predeterminada es:
Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -g

set "respuesta=y"
set /p "respuesta= Queres cambiar la impresora determinada a la que instalaste recien (%NamePrinter%) [y|n]: "
if /i not "%respuesta%" == "y" goto :Rx476-TEST

Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -t -p "HP Universal Printing PS"

echo.
echo.
echo Revisemos si se cambio, ahora la impresora por defecto es:
Cscript C:\Windows\System32\Printing_Admin_Scripts\es-ES\prnmngr.vbs -g

:Rx476-TEST
echo.
echo.
set "respuesta=y"
set /p "respuesta= Queres imprimir una pagina de prueba? (%NamePrinter%) [y|n]: "
if /i not "%respuesta%" == "y" goto :MENU-PRINTER
rundll32 printui.dll,PrintUIEntry /k /n"HP Universal Printing PS"

goto :MENU-PRINTER


:MENU-PRINTER
echo.
echo.
SET /P M=1 para IR AL MENU DE IMPRESORAS, 2 para IR AL MENU PRINCIPAL DE MAGIA o 3 para SALIR. Luego apreta ENTER!: 
echo.
IF %M%==1 GOTO IMPRESORAS
IF %M%==2 GOTO MENU
IF %M%==3 GOTO FIN




:FIN

