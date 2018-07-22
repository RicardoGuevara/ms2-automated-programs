:ini
cls
@ECHO OFF
title Rick Auto_git_commiter
echo ___________________________________________________________________
echo Bienvenido a Auto_Git, escriba la letra entre parentesis y presione enter para seleccionar:
echo recuerde que debe tener previamente instalado git, en otro caso el programa no va a funcionar

:menu
echo (i) ingresar una ruta directa
echo (s) ingresar manualmente
echo (r) reiniciar el progrma
echo (x) salir
set/p"var=>>" 
  if %var%==i goto ruta
  if %var%==s goto directorio 
  if %var%==r goto ini
  if %var%==x goto exit_door
echo ??? no te entiendo...
goto menu

:ruta
echo ingrese la ruta del folder entre comillas
set/p"pa=>>"
cd %pa%
goto directorio

:directorio
echo lista de directorios actual:
dir
goto menudirectorios

:menudirectorios
echo (d) ingresar a uno de los directorios
echo (a) ya estamos aquí
echo (r) reiniciar el progrma
set/p"direc=>>" 
  if %direc%==d goto ingresar
  if %direc%==a goto menugit
  if %direc%==r goto ini
echo ??? no te entiendo...
goto menudirectorios

:ingresar
echo ingrese el nombre del folder
set/p"sel=>>" 
cd %sel%
goto directorio

:menugit
echo ingrese un mensaje para el commit
set/p"men=>>" 
git add .
git commit -m %men%
git push origin master
echo commit listo y subido al repositorio remoto
goto menu

:exit_door
echo gracias por usarme! :) .... me siento increiblemente solo
pause
echo kill me please
exit
