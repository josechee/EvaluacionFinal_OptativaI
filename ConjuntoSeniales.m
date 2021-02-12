###Formando el conjunto de datos de entrenamiento##
  %[longitudSenialMedio,longitudSenialCompleto]=PromedioLongitudSeniales();
  %{Valor que va ser la longitud para todas las seniales de cada imagen
  %longitudSenialMedio=2521.9-> 2522 = columnas
  %ongitudSenialCompleto=5043.9-> =columnas
  %}
  
  columnasTRAIN=2522;
  totalSeniales=100;  
  conjuntoDatosTRAIN = zeros(totalSeniales,columnasTRAIN);  
  
  for i=1:totalSeniales
    [senialMedio,senialCompleto]=ObtenerSenial(i);  
    senialTRAIN=ObtenerSenialLongitudFinal(senialMedio);
    conjuntoDatosTRAIN(i,:)=senialTRAIN;
  endfor
   
  senialesTRAIN=JuntarClasesDatos(conjuntoDatosTRAIN);
  save -ascii BD_TRAIN senialesTRAIN
  


