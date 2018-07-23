@ECHO OFF
:re_start
cls
:ini
echo ___________________________________________________________________________
echo bienvenido al Auto_Ping, escriba la letra entre parentesis para seleccionar
echo (d) 'ping' por defecto
echo (p) 'ping' personalizado
echo (r)  reiniciar el programa
echo (s)  salir
	set/p"var=>>"
	if %var% == r goto re_start
	if %var% == s goto back_door
	if %var% == d goto ask
	if %var% == p goto ask
echo ??? no te entiendo... empecemos de nuevo
goto ini

:ask
echo digite la direccion DNS o IP
set/p"dns=>>"
if %var% == d goto dirping
goto longping

:dirping
ping %dns%
echo ping realizado
goto ini

:longping
echo digite la cantidad de paquetes a enviar ( '0' = ilimitado )
set/p"n=>>"
echo digite el tamanio en bytes de cada paquete
set/p"w=>>"
echo solicitud en proceso...
if %n% == 0 goto unlimited
ping %dns% -l %w% -n %n% 
goto ini

:unlimited
echo presione ctrl + c para detener el ping
ping %dns% -l %w% -t

:back_door
exit