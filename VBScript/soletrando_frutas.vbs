Option Explicit

Dim frutas, i, palavraAtual, resposta, repetiu, pulou, acertos, terminou, jogarNovamente
frutas = Array("jabuticaba", "graviola", "pitanga", "caju", "acerola", "cupuacu", "carambola", "pitomba", "jatoba", "murici", "guabiju")

MsgBox "Bem-vindo ao jogo SOLETRANDO! Aqui estão as regras:" & vbCrLf & _
    "1. Uma fruta será falada e você deve digitá-la corretamente." & vbCrLf & _
    "2. Se você quiser pular a palavra atual, digite 'pular'." & vbCrLf & _
    "3. Se você quiser repetir a palavra atual, digite 'repetir'." & vbCrLf & _
    "4. Se você digitar algo incorreto ou deixar a resposta em branco, você perderá o jogo." & vbCrLf & _
    "5. O jogo terminará quando todas as frutas forem digitadas corretamente, ou você perderá."

Do

    pulou = False
    repetiu = False
    acertos = 0
    terminou = False
    i = 0
    palavraAtual = 1

    Do While i <= UBound(frutas)
        If acertos = 10 Then 
            terminou = True
            Exit Do
        End If
        CreateObject("SAPI.SpVoice").Speak frutas(i)
        resposta = InputBox("Digite a fruta que foi falada ou 'pular' para pular a palavra ou 'repetir' para repetir a palavra:" & vbCrLf & "Palavra " & palavraAtual & "/" & (UBound(frutas)))

        If resposta = "" Then
            MsgBox "Você perdeu!"
            Exit Do
        ElseIf resposta = frutas(i) Then
            MsgBox "Correto!"
            acertos = acertos + 1
            pulou = False
            repetiu = False
            i = i + 1
            palavraAtual = palavraAtual + 1
        ElseIf resposta = "repetir" And Not repetiu Then
            repetiu = True
        ElseIf resposta = "pular" And Not pulou Then
            pulou = True
            repetiu = False
            i = i + 1
        Else
            MsgBox "Incorreto! Você perdeu!"
            Exit Do
        End If
    Loop

    If not terminou Then
        If acertos = 1 Then
            If pulou Then
                MsgBox "Você acertou 1 vez e pulou uma vez."
            Else
                MsgBox "Você acertou 1 vez e não pulou nenhuma vez."
            End If
        Else
            If pulou Then
                MsgBox "Você acertou " & acertos & " vezes e pulou uma vez."
            Else
                MsgBox "Você acertou " & acertos & " vezes e não pulou nenhuma vez."
            End If
        End If
    End If

    If terminou Then
        msgbox "Parabéns! Você venceu o jogo!"
        If pulou Then
            MsgBox "Você acertou as 10 e pulou uma vez."
        Else
            MsgBox "Você acertou as 10 e não pulou nenhuma vez."
        End If
    End If 

    jogarNovamente = MsgBox("Você quer jogar novamente?", vbYesNo)
Loop While jogarNovamente = vbYes


