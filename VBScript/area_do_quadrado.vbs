Dim lado,area,perim,resp

call calcular_area

sub calcular_area()

	lado=cdbl(inputbox("Digite o tamanho de um dos lados do quadrado:","Calcular área e perímetro do quadrado"))
	
	area = round(lado * lado,1)
	
	perim = round(lado * 4,1)
	
	resp = msgbox("Área do quadrado: "& area &"" + vbNewLine&_
				 "Perímetro do quadrado: "& perim &"" + vbNewLine&_
				 "Novo cálculo?", vbQuestion+vbYesNo, "Cálculo finalizado :)")
				 
	if resp = vbYes then ''
	call calcular_area
	else 
		MsgBox("fim do programa :(")
	end if
	
end sub