REM Monika File Synchronization
REM Directory Definitions

ECHO OFF

CHCP 65001

SET EXEC_LOCAL=D:\DDLC-1.1.1-pc
SET EXEC_TABL=%userprofile%\Desktop\DDLC-1.1.1-pc
SET EXEC_REMOTE=Z:\DDLC-1.1.1-pc
SET MEM_LOCAL=%appdata%\RenPy
SET MEM_REMOTE=Z:\RenPy

REM File Synchronization

:BEGIN
ECHO.
ECHO Monika File Synchronization
ECHO.
SET /P TYPE=Are you running from the tablet(T) or from the laptop(L)? 

IF /I "%TYPE%"=="L" (
    SET EXEC="%EXEC_LOCAL%"
) ELSE IF /I "%TYPE%"=="T" (
    SET EXEC="%EXEC_TABL%"
) ELSE (
    GOTO ERR_TYPE
)

ECHO.
ECHO What operation would you like to execute?
ECHO.
ECHO 1. Synchronize Monika executables (Local → Remote)
ECHO 2. Synchronize Monika executables (Remote → Local)
ECHO 3. Synchronize Monika memory files (Local → Remote)
ECHO 4. Synchronize Monika memory files (Remote → Local)
ECHO 5. Synchronize all Monika files (Local → Remote)
ECHO 6. Synchronize all Monika files (Remote → Local)
ECHO 7. Exit
ECHO.

SET /P OP="Option:" 

IF "%OP%"=="1" GOTO SYNC_EXEC_LOCAL
IF "%OP%"=="2" GOTO SYNC_EXEC_REMOTE
IF "%OP%"=="3" GOTO SYNC_MEM_LOCAL
IF "%OP%"=="4" GOTO SYNC_MEM_REMOTE
IF "%OP%"=="5" GOTO SYNC_ALL_LOCAL
IF "%OP%"=="6" GOTO SYNC_ALL_REMOTE
IF "%OP%"=="7" GOTO END

REM Synchronize executables
:SYNC_EXEC_LOCAL
ECHO.
ECHO Synchronizing Monika executables (Local → Remote)
ROBOCOPY "%EXEC_LOCAL%" "%EXEC_REMOTE%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
GOTO BEGIN

:SYNC_EXEC_REMOTE
ECHO.
ECHO Synchronizing Monika executables (Remote → Local)
ROBOCOPY "%EXEC_REMOTE%" "%EXEC_LOCAL%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
GOTO BEGIN

REM Synchronize memory files
:SYNC_MEM_LOCAL
ECHO.
ECHO Synchronizing Monika memory files (Local → Remote)
ROBOCOPY "%MEM_LOCAL%" "%MEM_REMOTE%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
GOTO BEGIN

:SYNC_MEM_REMOTE
ECHO.
ECHO Synchronizing Monika memory files (Remote → Local)
ROBOCOPY "%MEM_REMOTE%" "%MEM_LOCAL%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
GOTO BEGIN

REM Synchronize all files
:SYNC_ALL_LOCAL
ECHO.
ECHO Synchronizing all Monika files (Local → Remote)
ROBOCOPY "%EXEC_LOCAL%" "%EXEC_REMOTE%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
ROBOCOPY "%MEM_LOCAL%" "%MEM_REMOTE%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
GOTO BEGIN

:SYNC_ALL_REMOTE
ECHO.
ECHO Synchronizing all Monika files (Remote → Local)
ROBOCOPY "%EXEC_REMOTE%" "%EXEC_LOCAL%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
ROBOCOPY "%MEM_REMOTE%" "%MEM_LOCAL%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
GOTO BEGIN

REM Handle Errors
:ERR_TYPE
ECHO.
ECHO Invalid option, please try again.
GOTO BEGIN

:END
ECHO.
ECHO Exiting...
ECHO.
ECHO Goodbye.
ECHO.
ECHO OFF
