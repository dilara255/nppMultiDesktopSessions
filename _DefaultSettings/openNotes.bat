@echo off

@REM ------------------ START OF CONFIGURATION AREA ---------------------

@REM Set these to the path of your npp folder:
set nppDrive=E
set defaultNppDir=E:\Editores\Notepad++

@REM Also make sure you've copied the "_MultiDesktop" to your npp folder
set multiDesktopDir=%defaultNppDir%\_MultiDesktop

@REM And that npp is set up to use this extension for session files:
set ext=nps

@REM ------------------- END OF CONFIGURATION AREA ----------------------

@REM these definitions can be tweaked, but should be fine:
set defaultSettingsPath=%multiDesktopDir%\_DefaultSettings
set multiDesktopNppPath=%multiDesktopDir%\notepad++.exe
set settingsDir=notesSettings
set notesSession=notesSession.%ext%

set currDir=%cd%

@REM First we check that the settings folder exist, and deal with their absence if needed

IF NOT EXIST %settingsDir% (

	IF NOT EXIST %defaultSettingsPath%\%settingsDir% (
		echo ERROR: Local settings not found and default settings dir doesn't exist. 
		echo Please check the paths and names in the .bat file. 
		echo Aborting.
		echo:
		PAUSE
		EXIT
	)
	
	xcopy /s %defaultSettingsPath%\%settingsDir%\ %cd%\%settingsDir%\
	set openAsNew=1
)

IF NOT EXIST "%notesSession%" (

	IF NOT EXIST %defaultSettingsPath%\%notesSession% (
		echo ERROR: Local session not found and default session doesn't exist. 
		echo Please check the paths and names in the .bat file. 
		echo Aborting.
		echo:
		PAUSE
		EXIT
	)
	
	xcopy /s %defaultSettingsPath%\%notesSession% %cd%\
	set openAsNew=1
) 

IF DEFINED openAsNew (

	IF NOT EXIST %multiDesktopNppPath% (
		echo ERROR: Default Notepad++ not found. 
		echo Please check the path in the .bat file. 
		echo Aborting.
		echo:
		PAUSE
		EXIT
	)

	START %multiDesktopNppPath% -multiInst %currDir%\%notesSession%
	
) ELSE (
	
	IF NOT EXIST %multiDesktopNppPath% (
		echo ERROR: Multi Desktop Notepad++ not found. 
		echo Please check the path in the .bat file. 
		echo Aborting.
		echo:
		PAUSE
		EXIT
	)
	
	START %multiDesktopNppPath% -multiInst -openSession %currDir%\%notesSession% -settingsDir="%currDir%\%settingsDir%"
)
	