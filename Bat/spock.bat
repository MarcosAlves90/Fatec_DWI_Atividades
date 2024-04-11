@echo off
color 0a
title Jogo da Pedra, Papel, Tesoura e Spock

set "pedra=Pedra"
set "papel=Papel"
set "tesoura=Tesoura"
set "lagarto=Lagarto"
set "spock=Spock"

set "vitorias=0"
set "derrotas=0"
set "empates=0"

:menu
cls
echo.
echo --------------------------------------
echo              Menu Inicial            
echo --------------------------------------
echo.
echo --------------------------------------
echo        Escolha uma das opcoes:
echo --------------------------------------
echo [j] - Jogar
echo [c] - Carregar Jogo
echo [r] - Regras
echo [s] - Sair
echo --------------------------------------
echo.
set /p "opcao= Sua escolha: "
echo.

if /i "%opcao%"=="j" goto nome
if /i "%opcao%"=="c" goto carregar
if /i "%opcao%"=="r" goto regras
if /i "%opcao%"=="s" exit
goto menu

:carregar
if not exist spock_salvamento.txt (
    cls
    echo.
    echo --------------------------------------
    echo      Nenhum jogo salvo encontrado
    echo --------------------------------------
    echo.
    pause
    goto menu
)
cls
echo.
echo --------------------------------------
echo           Carregando jogo...
echo --------------------------------------
echo.
for /f "tokens=1,2 delims=:" %%a in (spock_salvamento.txt) do (
    if "%%a"=="nome" set "nome=%%b"
    if "%%a"=="vitorias" set "vitorias=%%b"
    if "%%a"=="derrotas" set "derrotas=%%b"
    if "%%a"=="empates" set "empates=%%b"
)
pause
goto inicio

:salvar
echo nome:%nome%>spock_salvamento.txt
echo vitorias:%vitorias%>>spock_salvamento.txt
echo derrotas:%derrotas%>>spock_salvamento.txt
echo empates:%empates%>>spock_salvamento.txt
goto final

:nome
cls
echo.
echo --------------------------------------
echo            Digite seu nome
echo --------------------------------------
echo.
set /p "nome= Seu nome: "

if not defined nome (
    echo Entrada invalida! Tente novamente.
    pause
    goto nome
)

echo.%nome%|findstr /r /c:"[^a-zA-Z0-9]" >nul
if not errorlevel 1 (
    echo Entrada invalida! Tente novamente.
    pause
    goto nome
)

goto inicio

:regras
cls
echo.
echo --------------------------------------
echo             Regras do Jogo             
echo --------------------------------------
echo.
echo Pedra: Vence de Tesoura e Lagarto; Perde de Papel e Spock.
echo Papel: Vence de Pedra e Spock; Perde de Tesoura e Lagarto.
echo Tesoura: Vence de Lagarto e Papel; Perde de Pedra e Spock.
echo Lagarto: Vence de Papel e Spock; Perde de Pedra e Tesoura.
echo Spock: Vence de Pedra e Tesoura; Perde de Lagarto e Papel.
echo.
echo Caso voce escolha a mesma opcao que a maquina, o jogo termina em empate.
echo.
echo Para jogar, digite sua escolha quando solicitado.
echo.
echo --------------------------------------
echo.
pause
goto inicio
:inicio
set "resp="
set "jogada="
set "maquina="
set "opcao="
cls
set /a "rand=%random% %% 5 + 1"
if %rand% == 1 (set "maquina=%pedra%")
if %rand% == 2 (set "maquina=%papel%")
if %rand% == 3 (set "maquina=%tesoura%")
if %rand% == 4 (set "maquina=%lagarto%")
if %rand% == 5 (set "maquina=%spock%")
echo.
echo --------------------------------------
echo   Bem-vindo ao Jogo da Pedra, Papel, 
echo   Tesoura, Lagarto e Spock!          
echo --------------------------------------
echo.
echo --------------------------------------
echo        Escolha uma das opcoes:
echo --------------------------------------
echo [1] - Pedra
echo [2] - Papel
echo [3] - Tesoura
echo [4] - Lagarto
echo [5] - Spock
echo --------------------------------------
echo [r] - Regras
echo [s] - Sair
echo --------------------------------------
echo.
set /p "opcao= Sua escolha: "
cls
echo.

if "%opcao%" == "1" (set "jogada=%pedra%")
if "%opcao%" == "2" (set "jogada=%papel%")
if "%opcao%" == "3" (set "jogada=%tesoura%")
if "%opcao%" == "4" (set "jogada=%lagarto%")
if "%opcao%" == "5" (set "jogada=%spock%")
if /i "%opcao%" == "r" goto regras
if /i "%opcao%" == "s" exit
if not defined jogada (
    echo Opcao invalida! Tente novamente.
    pause
    goto inicio
)

echo --------------------------------------
echo            Resultado do Jogo        
echo --------------------------------------
echo.

echo %nome%: %jogada%
echo Maquina: %maquina%
echo.

if "%jogada%" == "%maquina%" (
    set /a "empates+=1"
    echo Voces empataram!
) else (
    if "%jogada%" == "%pedra%" (
        if "%maquina%" == "%papel%" (
            set /a "derrotas+=1"
            echo Voce perdeu!
        ) else (
            set /a "vitorias+=1"
            echo Voce venceu!
        )
    ) else (
        if "%jogada%" == "%papel%" (
            if "%maquina%" == "%pedra%" (
                set /a "vitorias+=1"
                echo Voce venceu!
            ) else (
                set /a "derrotas+=1"
                echo Voce perdeu!
            )
        ) else (
            if "%jogada%" == "%tesoura%" (
                if "%maquina%" == "%lagarto%" (
                    set /a "vitorias+=1"
                    echo Voce venceu!
                ) else (
                    set /a "derrotas+=1"
                    echo Voce perdeu!
                )
            ) else (
                if "%jogada%" == "%lagarto%" (
                    if "%maquina%" == "%papel%" (
                        set /a "vitorias+=1"
                        echo Voce venceu!
                    ) else (
                        set /a "derrotas+=1"
                        echo Voce perdeu!
                    )
                ) else (
                    if "%jogada%" == "%spock%" (
                        if "%maquina%" == "%pedra%" (
                            set /a "vitorias+=1"
                            echo Voce venceu!
                        ) else (
                            set /a "derrotas+=1"
                            echo Voce perdeu!
                        )
                    )
                )
            )
        )
    )
)
goto salvar

:final
echo.
echo --------------------------------------
echo             Placar Atual             
echo --------------------------------------
echo.
echo Vitorias: %vitorias%
echo Derrotas: %derrotas%
echo Empates: %empates%
echo.
pause
echo.
echo --------------------------------------
echo        Deseja jogar novamente?            
echo --------------------------------------
echo.
set /p resp= [S/N]:

if not defined resp (
    echo Entrada invalida! Tente novamente.
    pause
    cls
    set "resp="
    goto final
)

echo.%resp%|findstr /r /c:"^[sSnN]$" >nul
if errorlevel 1 (
    echo Entrada invalida! Tente novamente.
    pause
    cls
    set "resp="
    goto final
)

if /i %resp% == s (
    goto inicio
)