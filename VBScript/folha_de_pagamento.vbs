Dim salMin, salBru, salLiq, resp

call salario

sub salario()
	salMin=cdbl(InputBox("Digite quantos sal�rios m�nimos voc� ganha:","Consultar Sal�rio"))
	if salMin >= 2 then
		salLiq = salMin * 1412.00
		salBru = salMin * 1412.00 * 0.89
	else
		salLiq = salMin * 1412.00
		salBru = salMin * 1412.00
	end if
	resp=msgbox("Sal�rio Bruto: " & salBru & "" + vbNewLine&_
				"Sal�rio Liquido: " & salLiq & "" + vbNewLine&_
				"novo calculo?", vbQuestion+vbYesNo, "Salario")
	if resp = vbYes then ''
		call salario
	else 
		MsgBox("fim do programa")
	end if
end Sub