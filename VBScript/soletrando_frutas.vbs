Option Explicit

Dim frutas, i, palavraAtual, resposta, repetiu, pulou, acertos, terminou, jogarNovamente, skip
frutas = Array("jabuticaba", "graviola", "pitanga", "caju", "acerola", "cupuacu", "carambola", "pitomba", "jatoba", "murici", "guabiju")

MsgBox "Bem-vindo ao jogo SOLETRANDO! Aqui est�o as regras:" & vbCrLf & _
    "1. Uma fruta ser� falada e voc� deve digit�-la corretamente." & vbCrLf & _
    "2. Se voc� quiser pular a palavra atual, digite 'pular'." & vbCrLf & _
    "3. Se voc� quiser repetir a palavra atual, digite 'repetir'." & vbCrLf & _
    "4. Se voc� digitar algo incorreto ou deixar a resposta em branco, voc� perder� o jogo." & vbCrLf & _
    "5. O jogo terminar� quando todas as frutas forem digitadas corretamente, ou voc� perder�."

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
            MsgBox "Voc� perdeu!"
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
                MsgBox "Voc� j� repetiu essa palavra!"
                skip = True
            End If
        ElseIf resposta = "pular" Then
            If Not pulou Then
                pulou = True
                repetiu = False
                skip = False
                i = i + 1
            Else
                MsgBox "Voc� n�o pode pular duas vezes!"
                skip = True
            End If
        Else
            MsgBox "Incorreto! Voc� perdeu!"
            Exit Do
        End If
    Loop

    If not terminou Then
        If acertos = 1 Then
            If pulou Then
                MsgBox "Voc� acertou 1 vez e pulou uma vez."
            Else
                MsgBox "Voc� acertou 1 vez e n�o pulou nenhuma vez."
            End If
        Else
            If pulou Then
                MsgBox "Voc� acertou " & acertos & " vezes e pulou uma vez."
            Else
                MsgBox "Voc� acertou " & acertos & " vezes e n�o pulou nenhuma vez."
            End If
        End If
    End If

    If terminou Then
        msgbox "Parab�ns! Voc� venceu o jogo!"
        If pulou Then
            MsgBox "Voc� acertou as 10 e pulou uma vez."
        Else
            MsgBox "Voc� acertou as 10 e n�o pulou nenhuma vez."
        End If
    End If 

    jogarNovamente = MsgBox("Voc� quer jogar novamente?", vbYesNo)
Loop While jogarNovamente = vbYes


