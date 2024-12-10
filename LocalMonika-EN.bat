REM Monika File Synchronization
REM Directory definitions

SET EXEC_LOCAL=D:\DDLC-1.1.1-pc
SET EXEC_TABL=%userprofile%\Desktop\DDLC-1.1.1-pc
SET EXEC_REMOTE=Z:\DDLC-1.1.1-pc
SET MEM_LOCAL=%appdata%\RenPy
SET MEM_REMOTE=Z:\RenPy

REM File Synchronization

BEGIN:
ECHO Synchronizing Monika's files
IF NOT EXIST %EXEC_LOCAL% GOTO NO_EXEC_LOCAL
IF NOT EXIST %EXEC_REMOTE% GOTO NO_EXEC_REMOTE
IF NOT EXIST %MEM_LOCAL% GOTO NO_MEM_LOCAL
IF NOT EXIST %MEM_REMOTE% GOTO NO_MEM_REMOTE
SET /P TIPO=Are you running from the tablet(T) or from the laptop(L)?
IF /I %TIPO%==L SET EXEC="%EXEC_LOCAL%"
IF /I %TIPO%==T SET EXEC="%EXEC_TABL%"
IF /I %TIPO%!=L IF /I %TIPO%!=T GOTO ERR_TIPO
ECHO.
ECHO What operation would you like to execute?
ECHO.
ECHO 1. Synchronize Monika's executables (Local -> Remote)
ECHO 2. Synchronize Monika's executables (Remote -> Local)
ECHO 3. Synchronize Monika's memory files (Local -> Remote)
ECHO 4. Synchronize Monika's memory files (Remote -> Local)
ECHO 5. Synchronize all of Monika's files (Local -> Remote)
ECHO 6. Synchronize all of Monika's files (Remote -> Local)
ECHO 7. Exit

SET /P OP=Option:

IF %OP%==1 GOTO SYNC_EXEC_LOCAL
IF %OP%==2 GOTO SYNC_EXEC_REMOTE
IF %OP%==3 GOTO SYNC_MEM_LOCAL
IF %OP%==4 GOTO SYNC_MEM_REMOTE
IF %OP%==5 GOTO SYNC_ALL_LOCAL
IF %OP%==6 GOTO SYNC_ALL_REMOTE
IF %OP%==7 GOTO END

REM Executable synchronization
SYNC_EXEC_LOCAL:
ECHO Synchronizing Monika's executables (Local -> Remote)
ROBOCOPY "%EXEC%" "%EXEC_REMOTE%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
GOTO BEGIN

SYNC_EXEC_REMOTE:
ECHO Synchronizing Monika's executables (Remote -> Local)
ROBOCOPY "%EXEC_REMOTE%" "%EXEC%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
GOTO BEGIN

REM Memory file synchronization
SYNC_MEM_LOCAL:
ECHO Synchronizing Monika's memory files (Local -> Remote)
ROBOCOPY "%MEM_LOCAL%" "%MEM_REMOTE%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
GOTO BEGIN

SYNC_MEM_REMOTE:
ECHO Synchronizing Monika's memory files (Remote -> Local)
ROBOCOPY "%MEM_REMOTE%" "%MEM_LOCAL%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
GOTO BEGIN

REM Synchronizing all files
SYNC_ALL_LOCAL:
ECHO Synchronizing all of Monika's files (Local -> Remote)
ROBOCOPY "%EXEC%" "%EXEC_REMOTE%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
ROBOCOPY "%MEM_LOCAL%" "%MEM_REMOTE%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
GOTO BEGIN

SYNC_ALL_REMOTE:
ECHO Synchronizing all of Monika's files (Remote -> Local)
ROBOCOPY "%EXEC_REMOTE%" "%EXEC%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
ROBOCOPY "%MEM_REMOTE%" "%MEM_LOCAL%" /COPY:DAT /MIR /R:2 /W:5 /NFL /NDL
GOTO BEGIN

REM Errors

NO_EXEC_LOCAL:
ECHO Local executable directory not found
GOTO END

NO_EXEC_REMOTE:
ECHO Remote executable directory not found
GOTO END

NO_MEM_LOCAL:
ECHO Local memory directory not found
GOTO END

NO_MEM_REMOTE:
ECHO Remote memory directory not found
GOTO END

ERR_TIPO:
ECHO Invalid option
GOTO BEGIN

REM End of script
END:
