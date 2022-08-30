@echo off
if not "%1" == "max" start /MAX cmd /c %0 max & exit/b
rem Script de automatizacion de MEJORA de la performance de las PC
Title NO FUE MAGIA V1.0
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
echo 1- Lo primero que hay que hacer, es actualizar completamente la PC. 
set "respuesta=y"
set /p "respuesta=Estan todos los Updates realizados? [y|n]: "
if /i not "%respuesta%" == "y" goto :UPDATEFALLO
set "respuesta=y"
set /p "respuesta=Estas SEGURO? es importante hacerlo ANTES de continuar con todos los modulos [y|n]: "
if /i not "%respuesta%" == "y" goto :UPDATEFALLO

:DRIVERSOFICIALES
cls
color 02
echo 2- El segundo paso es descargar los drivers originales de la motherboard e instalarlos.
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
goto :SERVICES

:OTRAENERGIA
cls
powercfg /list
set "respuesta=y"
set /p "respuesta= Queres elegir otro plan de energia? [y|n]: "
if /i not "%respuesta%" == "y" goto :SERVICES
echo Cuando Hayas identificado cual es el plan de energia que queres, copialo:
set "respuesta= "
set /p "respuesta=LUEGO PEGA ACA EL CODIGO y DALE ENTER: "
powercfg /setactive %respuesta%
if /i not "%respuesta%" == "n" goto :SERVICES


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
if /i not "%respuesta%" == "y" goto :CORTANA
sc config SysMain start=disabled
sc config WSearch start=disabled
sc config DiagTrack start=disabled
sc config CDPSvc start=disabled
echo Todos los servicios fueron correctamente deshabilitados
pause

:CORTANA
cls
color 75
echo 5- Ok, vamos a desconectar los servicios de WEBSEARCH y CORTANA. Procedemos?
set "respuesta=y"
set /p "respuesta= Desea continuar? [y|n]: "
if /i not "%respuesta%" == "y" goto :TEMPORIZADOREVENTOS
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d 0

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
goto:DEFRAGMENTADOR

:TEMPORIZADORNO
set "respuesta=y"
set /p "respuesta= Desea VOLVER LOS VALORES A DEFAULT? [y|n]: "
if /i not "%respuesta%" == "y" goto :DEFRAGMENTADOR
bcdedit /set useplatformclock Yes
bcdedit /set disabledynamictick No
echo Se abrira el menu del administrador de dispositivos. Por favor, vayan a la seccion
echo DISPOSITIVOS DEL SISTEMA
echo Alli busquen el item: Temporizador de Eventos de Alta Precision
echo HABILITEN ESTA OPCION
devmgmt.msc

:DEFRAGMENTADOR
cls
color 07
echo 7- Esto desactivara el defragmentador automatico de Windows
set "respuesta=y"
set /p "respuesta= Desea continuar? [y|n]: "
if /i not "%respuesta%" == "y" goto :ANIMACIONES
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag"
rem schtasks /Delete /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /F

:ANIMACIONES
cls
color f0
echo 8- Esto desactivara las animaciones del sistema.
set "respuesta=y"
set /p "respuesta= Desea continuar? [y|n]: "
if /i not "%respuesta%" == "y" goto :PAGINACION
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
goto :2DOPLANO

:PAGINACION8GB
set "respuesta=y"
set /p "respuesta= La PC, tiene 8gb de ram? [y|n]: "
if /i not "%respuesta%" == "y" goto :PAGINACIONESPECIAL
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=false
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=2746,MaximumSize=12288
goto :2DOPLANO

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

:2DOPLANO
cls
color a
echo 10- Ahora procederemos a realizar la desactivacion de las aplicaciones en segundo plano.
set "respuesta=y"
set /p "respuesta=Continuamos? [y|n]: "
if /i not "%respuesta%" == "y" goto :SERVICIOSINICIO
Reg Add HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications /v GlobalUserDisabled /t REG_DWORD /d 1 /f

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
goto :FIN

:UPDATEFALLO
cls
color 97
echo OK!, no problem, actualiza todo, instala los drivers de la motherboard y volve a empezar despues!
pause

:FIN