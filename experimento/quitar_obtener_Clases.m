function  [clases,datos] = quitar_obtener_Clases(BD) 
  
  BD_clases = BD(:,1);  % las clases de la base de datos
  BD(:,1) = [];         % Quitamos la columna de las clases
  clases=BD_clases;
  datos=BD;
  
  
    
endfunction