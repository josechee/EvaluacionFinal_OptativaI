function retorno =  graficar_Clase(TEST,clase)   
  
  TEST_clases = TEST(:,1);
  TEST(:,1) = []; 
  cont_ClaseCero=0;
  cont_ClaseUno=0;
  for i=1:length(TEST_clases)
    if TEST_clases(i)==0
      cont_ClaseCero=cont_ClaseCero+1;
    endif    
    if TEST_clases(i)==1
      cont_ClaseUno=cont_ClaseUno+1;
    endif    
  endfor
  cont_ClaseCero
  cont_ClaseUno
  
  [filas,columnas] = size(TEST)
  BD_ClaseCero=zeros([cont_ClaseCero,columnas]);
  BD_ClaseUno=zeros([cont_ClaseUno,columnas]);
  
  for i=1:cont_ClaseCero
    for j=1:columnas
      BD_ClaseCero(i,j)=TEST(i,j);
    endfor
  endfor
  
  for i=1:cont_ClaseUno
    for j=1:columnas
      BD_ClaseUno(i,j)=TEST(i,j);
    endfor
  endfor
  figure(1);
  plot(BD_ClaseCero);
  title('Clase 0 del conjunto TEST aplicado PAA','FontName', 'Times', 'Fontsize', 24');
  figure(2);
  plot(BD_ClaseUno);
  title('Clase 1 del conjunto TEST aplicado PAA','FontName', 'Times', 'Fontsize', 24');
  retorno=BD_ClaseCero;
  
  
endfunction