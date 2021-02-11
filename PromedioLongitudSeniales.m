function [longitudSenialMedia,longitudSenialCompleto] = PromedioLongitudSeniales()
  
  longitudSenialesMedioContorno=[];
  longitudSenialesContornoCompleto=[];
  for i=1:20
    [senialMedioContorno,senialContornoCompleto]= ObtenerSenial(i);    
    longitudSenialesMedioContorno(i)=length(senialMedioContorno);
    longitudSenialesContornoCompleto(i)=length(senialContornoCompleto);   
  endfor
  [longitudSenialMedia,longitudSenialCompleto]=promedioLongitudSeniales(longitudSenialesMedioContorno,longitudSenialesContornoCompleto)
 
endfunction

function [promedioLongitudesSenialMedia,promedioLongitudesSenialCompleta] = promedioLongitudSeniales(longitudesSenialesContornosMedios,longitudesSenialesContornosCompletos)
  sumaLongitudesContornosMedios=0;
  sumaLongitudesContornosCompletos=0;
  for i=1:length(longitudesSenialesContornosMedios)
    sumaLongitudesContornosMedios=sumaLongitudesContornosMedios+longitudesSenialesContornosMedios(i);
    sumaLongitudesContornosCompletos= sumaLongitudesContornosCompletos+longitudesSenialesContornosCompletos(i);
  endfor  
  promedioLongitudesSenialMedia=sumaLongitudesContornosMedios/length(longitudesSenialesContornosMedios);
  promedioLongitudesSenialCompleta= sumaLongitudesContornosCompletos/length(longitudesSenialesContornosMedios);
  
  return
endfunction