function [POP] = fGenerarPop(poblacion,Lim_min,Lim_max,D,P)
  POP = [];
  for i=1:P
    # generar cada individuo de la poblacion
    individuo = fGenerarInd(poblacion(1,:),Lim_min,Lim_max,D,P);    
    POP = [POP;individuo];
  endfor  
  
endfunction
