Dim num, resp
call calculo

sub calculo()
	num=cint(inputbox("digite um número inteiro:","Antecessor e Sucessor"))
	resp=MsgBox("Seu número: " & num & "" + vbNewLine&_
				"Sucessor: " & (num + 1) & "" + vbNewLine&_
				"Antecessor: " & (num - 1) &"",vbQuestion + vbYesNo,"Antecessor e Sucessor")
	
	if resp = vbyes Then
		call calculo
	else 
		MsgBox("fim do programa :(")
	end if
end Sub
