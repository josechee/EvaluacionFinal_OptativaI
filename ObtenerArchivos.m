function archivos = ObtenerArchivos()
  directorio = readdir('C:\Users\Public\finalPseniales\imgenes\');  
  obtenerArchivos = {};
  j=1;
  for i=3:length(directorio)
    obtenerArchivos(j)=strcat(cellstr((directorio(i))));  
    j=j+1;
  endfor
  archivos=obtenerArchivos;
endfunction

