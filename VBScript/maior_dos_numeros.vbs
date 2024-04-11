Dim num1,num2,num3,num4,maiormo,menormo,resp

call maiormenor

sub maiormenor()

	num1=cdbl(inputbox("Digite um número:","Menor e Maior Número"))
	
	num2=cdbl(inputbox("Digite outro número:","Menor e Maior Número"))
	
	num3=cdbl(inputbox("Digite mais um número:","Menor e Maior Número"))
	
	num4=cdbl(inputbox("Digite outro número:","Menor e Maior Número"))
	
	if num1 > num2 and num1 > num3 and num1 > num4 then
	maiormo = num1
	elseif num2 > num3 and num2 > num4 then
	maiormo = num2
	elseif num3 > num4 then
	maiormo = num3
	else
	maiormo = num4
	end if
	
	if num1 < num2 and num1 < num3 and num1 < num4 then
	menormo = num1
	elseif num2 < num3 and num2 < num4 then
	menormo = num2
	elseif num3 < num4 then
	menormo = num3
	else
	menormo = num4
	end if
	
	resp=MsgBox("Maior Número: " & maiormo & + vbNewLine&_
				"Menor Número: " & menormo & + vbNewLine&_
				"Números Escolhidos: " & num1 & ", " & num2 & ", " & num3 & ", " & num4 & "" + vbNewLine&_
				"Deseja Testar Novamente? ", vbQuestion + vbYesNo,"Menor e Maior Número")
				
	if resp = vbYes then ''
	call maiormenor
	else 
		MsgBox("fim do programa :(")
	end if

end sub	