function [senialMedioContorno,senialContornoCompleto] = ObtenerSenial(nombreArchivo)
  archivos = ObtenerArchivos();
  imagen= LeerArchivos(archivos(nombreArchivo));
  #imshow(imagen);
  
  contornosHojaCeldas = bwboundaries(imagen);
  contornosHojaMatriz = cell2mat(contornosHojaCeldas);
  #figure(1)
  #imshow(imagen);
  
  #hold on
  #plot(contornosHojaMatriz(:,2),contornosHojaMatriz(:,1)),"*b";
  #figure(2)
  #plot(contornosHojaMatriz(:,2),"-r");
  senialMedioContorno=contornosHojaMatriz(:,2);
  
  [filas,columnas] = size(contornosHojaMatriz);
  senialContornoCompleto = reshape(contornosHojaMatriz,[1,(filas*columnas)]);
  
  #figure(3)
  #plot(contornosHojaMatriz(:,1),"-g");
endfunction