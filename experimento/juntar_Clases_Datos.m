function  TRAIN_PROCESADO_CON_CLASES = juntar_Clases_Datos(CLASES,DATOS) 
  
  [filas,columnas] = size(DATOS);  
  TRAIN_PROCESADO_CON_CLASES = zeros([filas,columnas+1]);
  
  for i=1:filas
    TRAIN_PROCESADO_CON_CLASES(i,1)=CLASES(i);
  endfor
  
  for i=1:filas
    for j=2:(columnas+1)
        TRAIN_PROCESADO_CON_CLASES(i,j)=DATOS(i,j-1);
    endfor
  endfor
  
  #TRAIN_PROCESADO_CON_CLASES= [TRAIN_PROCESADO_CON_CLASES,DATOS];
  #BD_clases = BD(:,1);  % las clases de la base de datos
  #BD(:,1) = [];         % Quitamos la columna de las clases
  #clases=BD_clases;
  #datos=BD;    
endfunction