@echo off

set    zip=gorkans.zip
set ifiles=gorkans8.rom+gorkans4.rom+gorkans7.rom+gorkans3.rom+gorkans6.rom+gorkans2.rom+gorkans5.rom+gorkans1.rom+gorkans8.rom+gorkans4.rom+gorkans7.rom+gorkans3.rom+gorkans6.rom+gorkans2.rom+gorkans5.rom+gorkans1.rom+gorkgfx4.rom+gorkgfx2.rom+gorkgfx3.rom+gorkgfx1.rom
set  ofile=a.gorkns.rom

rem =====================================
setlocal ENABLEDELAYEDEXPANSION

set pwd=%~dp0
echo.
echo.

if EXIST %zip% (

	!pwd!7za x -otmp %zip%
	if !ERRORLEVEL! EQU 0 ( 
		cd tmp

		copy /b/y %ifiles% !pwd!%ofile%
		if !ERRORLEVEL! EQU 0 ( 
			echo.
			echo ** done **
			echo.
			echo Copy "%ofile%" into root of SD card
		)
		cd !pwd!
		rmdir /s /q tmp
	)

) else (

	echo Error: Cannot find "%zip%" file
	echo.
	echo Put "%zip%", "7za.exe" and "%~nx0" into the same directory
)

echo.
echo.
pause
