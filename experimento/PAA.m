#recibe como parametro la senial y el numero de ventana para su segmentacion
function avg = PAA(senial, ventana)

longitudSenial = length(senial);
M = longitudSenial/ventana;
remainder = rem(longitudSenial,ventana);
#a continuacion se valida que la ventana sea > 2 y que la ventana sea < que la senial original:
if ( (ventana>2) &&  (ventana<longitudSenial))% si es correcto la validacion, obtiene los promedios y los segmentos correspondiente
  avg = [];
  temp = 0;
  indice =1;
  for i=1:M
    for j=1:ventana
        temp = temp + senial(indice);
        indice = indice+1;
    end
    promedios(i) = temp/ventana;
    temp = 0;
  end
  avg = promedios;
else % en caso de que no se cumple el if, simplemente esta funcion retorna un valor de cero:
  avg= 0;
endif

endfunction

