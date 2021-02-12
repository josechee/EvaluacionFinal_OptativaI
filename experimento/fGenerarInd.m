function [individuo] = fGenerarInd(individuo,Lim_min,Lim_max,D,P)
  # generar los valores del vector respetando los limites 
  # rand()*(lim_max-lim_min)+lim_min
  for i=1:D
    % aqui se va modificar dado que Lim_min[] y Lim_max[]
    % pejemplo: individuo(i) = rand()*(Lim_max-Lim_min)+Lim_min;
    %con round(n): se hacer el redondeo al entero mas cercano a n
    individuo(i) = round(rand()*(Lim_max(i)-Lim_min(i))+Lim_min(i));
  endfor
  
endfunction
