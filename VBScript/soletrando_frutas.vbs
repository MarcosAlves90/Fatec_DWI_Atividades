Option Explicit

Dim frutas, i, resposta, repetiu, pulou, acertos, terminou, jogarNovamente
frutas = Array("jabuticaba", "graviola", "pitanga", "caju", "acerola", "cupuacu", "carambola", "pitomba", "jatoba", "murici", "guabiju")

pulou = False
repetiu = False
acertos = 0
terminou = False

MsgBox "Bem-vindo ao jogo Soletrando! Aqui estao as regras:" & vbCrLf & _
    "1. Uma fruta sera falada e voce deve digita-la corretamente." & vbCrLf & _
    "2. Se voce quiser pular a palavra atual, digite 'pular'." & vbCrLf & _
    "3. Se voce quiser repetir a palavra atual, digite 'repetir'." & vbCrLf & _
    "4. Se voce digitar algo incorreto ou deixar a resposta em branco, voce perde o jogo." & vbCrLf & _
    "5. O jogo termina quando todas as frutas forem digitadas corretamente, ou voce perder."

Do
    For i = 0 To UBound(frutas)
        CreateObject("SAPI.SpVoice").Speak frutas(i)
        resposta = InputBox("Digite a fruta que foi falada ou 'pular' para pular a palavra ou 'repetir' para repetir a palavra:")

        If resposta = "" Then
            MsgBox "Voce perdeu!"
            Exit For
        ElseIf resposta = frutas(i) Then
            MsgBox "Correto!"
            acertos = acertos + 1
            pulou = False
            repetiu = False
        ElseIf resposta = "repetir" And Not repetiu Then
            repetiu = True
            i = i - 1
        ElseIf resposta = "pular" And Not pulou Then
            pulou = True
            repetiu = False
        Else
            MsgBox "Incorreto! Voce perdeu!"
            Exit For
        End If

        If i = UBound(frutas) Then
            terminou = True
        End If
    Next

    If terminou Then
        MsgBox "Parabéns! Você venceu o jogo!"
        If acertos = 1 Then
            If pulou Then
                MsgBox "Voce acertou 1 vez e pulou uma vez."
            Else
                MsgBox "Voce acertou 1 vez e nao pulou nenhuma vez."
            End If
        Else
            If pulou Then
                MsgBox "Voce acertou " & acertos & " vezes e pulou uma vez."
            Else
                MsgBox "Voce acertou " & acertos & " vezes e nao pulou nenhuma vez."
            End If
        End If
    End If

    jogarNovamente = MsgBox("Voce quer jogar novamente?", vbYesNo)
Loop While jogarNovamente = vbYes