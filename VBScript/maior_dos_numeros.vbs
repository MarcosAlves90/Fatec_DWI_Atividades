Dim num1,num2,num3,num4,maiormo,menormo,resp

call maiormenor

sub maiormenor()

	num1=cdbl(inputbox("Digite um n�mero:","Menor e Maior N�mero"))
	
	num2=cdbl(inputbox("Digite outro n�mero:","Menor e Maior N�mero"))
	
	num3=cdbl(inputbox("Digite mais um n�mero:","Menor e Maior N�mero"))
	
	num4=cdbl(inputbox("Digite outro n�mero:","Menor e Maior N�mero"))
	
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
	
	resp=MsgBox("Maior N�mero: " & maiormo & + vbNewLine&_
				"Menor N�mero: " & menormo & + vbNewLine&_
				"N�meros Escolhidos: " & num1 & ", " & num2 & ", " & num3 & ", " & num4 & "" + vbNewLine&_
				"Deseja Testar Novamente? ", vbQuestion + vbYesNo,"Menor e Maior N�mero")
				
	if resp = vbYes then ''
	call maiormenor
	else 
		MsgBox("fim do programa :(")
	end if

end sub	