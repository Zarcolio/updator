@ECHO OFF

WHERE /q chocolatey.exe
IF ERRORLEVEL 0 (
	ECHO Updating Chocolatey...
	cup all -y -r|find "^|true"
) ELSE (
	ECHO Chocolatey not found...
)

FOR /F "tokens=* USEBACKQ" %%F IN (`WHERE /r "%ProgramFiles(x86)%" driverbooster.exe`) DO (
	SET var1=%%F
)

IF NOT "%var1%"=="" (
	ECHO Starting Driver Booster...
	START "" "%var1%"
) ELSE (
	ECHO Driver Booster not found...
)


FOR /F "tokens=* USEBACKQ" %%F IN (`WHERE /r "%ProgramFiles(x86)%" DellCommandUpdate.exe`) DO (
	SET var2=%%F
)

IF NOT "%var2%"=="" (
	ECHO Starting Dell Command Update...
	START "" "%var2%"
) ELSE (
	ECHO Dell Command Update not found...
)


FOR /F "tokens=* USEBACKQ" %%F IN (`WHERE /r "%ProgramFiles(x86)%" DSAServiceHelper.exe`) DO (
	SET var2=%%F
)

IF NOT "%var2%"=="" (
	ECHO Starting Intel Driver ^& Support Assistant...
	START "" "%var2%" installstartup
) ELSE (
	ECHO Dell Command Update not found...
)



ECHO Starting Windows Update...
CONTROL update

ECHO:
PAUSE