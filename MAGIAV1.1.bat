@echo off
rem Script de menu basico para ser modificado en otros proyectos
Title NO FUE MAGIA V1.0
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
echo                           ###      V1.0      /##                               
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
echo .......... 8- Salir del Programa                                                          ..........
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
IF %M%==8 GOTO FIN

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
echo                           ###      V1.0      /##                               
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


echo Iniciando la carga de Jebus y Soporte como discos de forma automatica...


echo Por favor, ingrese los passwords que hagan falta, en caso que el script lo solicite:
pause
net use v: \\jebus\s * /USER:sds_domain_1\diegoztest
net use w: \\fs01-9dj\soporte *  /USER:sds_domain_1\diegoztest

echo JEBUS y SOPORTE estan actualmente conectadas.
echo.
echo Queres aprovechar y copiar los Accesos directos a OWA y GDE en el escritorio?
SET /P M=Selecciona 1 para HACERLO o 2 para esperar y desconectar los discos: 
IF %M%==1 GOTO LINK-GDE
IF %M%==2 GOTO MENU

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
goto :FIN

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
pause
if exist "c:\Program Files\Google\Chrome" echo 1.CHROME EXISTE!
if exist "C:\Program Files\Mozilla Firefox" echo 2.FIREFOX EXISTE!
if exist "C:\Program Files\Adobe\Acrobat DC" echo 3.ADOBE READER EXISTE!
if exist "C:\Program Files\WinRAR" echo 4.WINRAR EXISTE!
if exist "C:\Program Files\Microsoft Office\Office16" echo 5.OFFICE 2016 EXISTE!
if exist "C:\Program Files (x86)\Citrix\Receiver" echo 6.CITRIX EXISTE!
if exist "C:\Program Files (x86)\SISSEX" echo 7.SISSEX EXISTE!
echo.
echo.
echo Presten atencion al numero faltante. Si algun numero no aparece, significa que ese programa NO ESTA INSTALADO.
pause
echo volvamos al menu cuando esten listos.
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
pause
goto :MENU





:FIN

