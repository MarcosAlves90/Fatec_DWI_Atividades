@echo off

title Sorteio de Numeros

color 0a

:inicio

	set /a tent=5
	set /a numbro=(%random% %%50) + 1

:sorteio
	set "inp="
	cls
	echo.
	:: echo %numbro%
	:: Pode colocar echo %numbro% para mostrar o numero sorteado
	echo -------------------------------
	echo Advinhe um numero entre 01 e 50
	echo -------------------------------
	echo Quantidade de tentativas: %tent%
	echo -------------------------------
	echo.

	if %tent% equ 0 (
		echo ---------------------------------
		echo Voce esgotou todas as tentativas.
		echo ---------------------------------
		echo O numero sorteado era %numbro%.
		echo ---------------------------------
		echo.
		pause
		goto fim
	)

	set /p inp=Digite o numero: 

	:: --------------------------------------------------

	:: Remove os zeros à esquerda
	for /f "tokens=* delims=0" %%a in ("%inp%") do set inp=%%a

	echo.%inp%|findstr /r /c:"^[1-9][0-9]*$" >nul
	if errorlevel 1 (
		echo.
		echo ----------------------------------------------
		echo Numero invalido. Tente um numero entre 1 e 50.
		echo ----------------------------------------------
		pause
		goto sorteio
	)

	set /a num=%inp%
	if %num% lss 1 (
		echo.
		echo ----------------------------------------------
		echo Numero invalido. Tente um numero entre 1 e 50.
		echo ----------------------------------------------
		pause
		goto sorteio
	)

	if %num% gtr 50 (
		echo.
		echo ----------------------------------------------
		echo Numero invalido. Tente um numero entre 1 e 50.
		echo ----------------------------------------------
		pause
		goto sorteio
	)

	:: --------------------------------------------------

	if %numbro% lss %inp% (
		echo.
		echo ----------------------
		echo Tente um numero menor.
		echo ----------------------
		set /a tent=%tent% - 1
		pause
		goto sorteio
	) else if %numbro% gtr %inp% (
			echo.
			echo ----------------------
			echo Tente um numero maior.
			echo ----------------------
			set /a tent=%tent% - 1
			pause
			goto sorteio
	) else (
		echo.
		echo ----------------------
		echo Voce acertou meu chapa.
		echo ----------------------
		pause
		goto fim
	)

	pause

:fim

	cls
	set /p resp=Quer jogar de novo? [S/N]:
	if /i %resp% == s (
		goto inicio
	)

