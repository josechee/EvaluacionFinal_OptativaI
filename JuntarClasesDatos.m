function  conjuntoSenialesConClases = JuntarClasesDatos(conjuntoSeniales) 
  
  clases = load('clases.txt');
  [filas,columnas] = size(conjuntoSeniales);  
  conjuntoSenialesConClases = zeros([filas,columnas+1]);
  
  for i=1:filas
    conjuntoSenialesConClases(i,1)=clases(i);
  endfor
  
  for i=1:filas
    for j=2:(columnas+1)
        conjuntoSenialesConClases(i,j)=conjuntoSeniales(i,j-1);
    endfor
  endfor
   
endfunction