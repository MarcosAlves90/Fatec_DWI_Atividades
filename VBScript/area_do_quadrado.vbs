Dim lado,area,perim,resp

call calcular_area

sub calcular_area()

	lado=cdbl(inputbox("Digite o tamanho de um dos lados do quadrado:","Calcular �rea e per�metro do quadrado"))
	
	area = round(lado * lado,1)
	
	perim = round(lado * 4,1)
	
	resp = msgbox("�rea do quadrado: "& area &"" + vbNewLine&_
				 "Per�metro do quadrado: "& perim &"" + vbNewLine&_
				 "Novo c�lculo?", vbQuestion+vbYesNo, "C�lculo finalizado :)")
				 
	if resp = vbYes then ''
	call calcular_area
	else 
		MsgBox("fim do programa :(")
	end if
	
end sub