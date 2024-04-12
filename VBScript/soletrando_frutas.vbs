Option Explicit

Dim frutas, i, palavraAtual, resposta, repetiu, pulou, acertos, terminou, jogarNovamente, skip
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
    skip = False

    Do While i <= UBound(frutas)
        If acertos = 10 Then 
            terminou = True
            Exit Do
        End If
        If Not skip Then
            CreateObject("SAPI.SpVoice").Speak frutas(i)
        End If
        resposta = LCase(InputBox("Digite a fruta que foi falada ou 'pular' para pular a palavra ou 'repetir' para repetir a palavra:" & vbCrLf & "Palavra " & palavraAtual & "/" & (UBound(frutas))))

        If resposta = "" Then
            MsgBox "Você perdeu!"
            Exit Do
        ElseIf resposta = LCase(frutas(i)) Then
            MsgBox "Correto!"
            acertos = acertos + 1
            repetiu = False
            skip = False
            i = i + 1
            palavraAtual = palavraAtual + 1
        ElseIf resposta = "repetir" Then
            If Not repetiu Then
                repetiu = True
                skip = False
            Else
                MsgBox "Você já repetiu essa palavra!"
                skip = True
            End If
        ElseIf resposta = "pular" Then
            If Not pulou Then
                pulou = True
                repetiu = False
                skip = False
                i = i + 1
            Else
                MsgBox "Você não pode pular duas vezes!"
                skip = True
            End If
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


