REM Sincronización de archivos de Monika
REM Definición de directorios

ECHO OFF

CHCP 65001

SET EXEC_LOCAL=D:\DDLC-1.1.1-pc
SET EXEC_TABL=%userprofile%\Desktop\DDLC-1.1.1-pc
SET EXEC_REMOTE=Z:\DDLC-1.1.1-pc
SET MEM_LOCAL=%appdata%\RenPy
SET MEM_REMOTE=Z:\RenPy

REM Sincronización de archivos

:BEGIN
ECHO.
ECHO Sincronización de archivos de Monika
ECHO.
SET /P TIPO=¿Está ejecutando desde la tableta(T) o desde la laptop(L)? 

IF /I "%TIPO%"=="L" (
    SET EXEC="%EXEC_LOCAL%"
) ELSE IF /I "%TIPO%"=="T" (
    SET EXEC="%EXEC_TABL%"
) ELSE (
    GOTO ERR_TIPO
)

ECHO.
ECHO ¿Qué operación desea ejecutar?
ECHO.
ECHO 1. Sincronizar los ejecutables de Monika (Local → Remoto)
ECHO 2. Sincronizar los ejecutables de Monika (Remoto → Local)
ECHO 3. Sincronizar los archivos de memoria de Monika (Local → Remoto)
ECHO 4. Sincronizar los archivos de memoria de Monika (Remoto → Local)
ECHO 5. Sincronizar todos los archivos de Monika (Local → Remoto)
ECHO 6. Sincronizar todos los archivos de Monika (Remoto → Local)
ECHO 7. Salir
ECHO.

SET /P OP="Opción:" 

IF "%OP%"=="1" GOTO SYNC_EXEC_LOCAL
IF "%OP%"=="2" GOTO SYNC_EXEC_REMOTE
IF "%OP%"=="3" GOTO SYNC_MEM_LOCAL
IF "%OP%"=="4" GOTO SYNC_MEM_REMOTE
IF "%OP%"=="5" GOTO SYNC_ALL_LOCAL
IF "%OP%"=="6" GOTO SYNC_ALL_REMOTE
IF "%OP%"=="7" GOTO END

REM Sincronización de ejecutables
:SYNC_EXEC_LOCAL
ECHO.
ECHO Sincronizando los ejecutables de Monika (Local -> Remoto)
ROBOCOPY "%EXEC_LOCAL%" "%EXEC_REMOTE%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
GOTO BEGIN

:SYNC_EXEC_REMOTE
ECHO.
ECHO Sincronizando los ejecutables de Monika (Remoto -> Local)
ROBOCOPY "%EXEC_REMOTE%" "%EXEC_LOCAL%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
GOTO BEGIN

REM Sincronización de archivos de memoria
:SYNC_MEM_LOCAL
ECHO.
ECHO Sincronizando los archivos de memoria de Monika (Local -> Remoto)
ROBOCOPY "%MEM_LOCAL%" "%MEM_REMOTE%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
GOTO BEGIN

:SYNC_MEM_REMOTE
ECHO.
ECHO Sincronizando los archivos de memoria de Monika (Remoto -> Local)
ROBOCOPY "%MEM_REMOTE%" "%MEM_LOCAL%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
GOTO BEGIN

REM Sincronización de todos los archivos
:SYNC_ALL_LOCAL
ECHO.
ECHO Sincronizando todos los archivos de Monika (Local -> Remoto)
ROBOCOPY "%EXEC_LOCAL%" "%EXEC_REMOTE%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
ROBOCOPY "%MEM_LOCAL%" "%MEM_REMOTE%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
GOTO BEGIN

:SYNC_ALL_REMOTE
ECHO.
ECHO Sincronizando todos los archivos de Monika (Remoto -> Local)
ROBOCOPY "%EXEC_REMOTE%" "%EXEC_LOCAL%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
ROBOCOPY "%MEM_REMOTE%" "%MEM_LOCAL%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
GOTO BEGIN

REM Errores
:ERR_TIPO
ECHO.
ECHO Opción inválida, intente de nuevo.
GOTO BEGIN

:END
ECHO.
ECHO Finalizando...
ECHO.
ECHO Adiós.
ECHO.
ECHO OFF
