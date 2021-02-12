function [ventana] = ventanas(senial)
  
  ventana=[];
  longSenial=length(senial);
  ventana =(longSenial*5)/100;%tamanio de ventana o limite inferior #20%
  ventana =[ventana,(longSenial*50)/100];%tamanio de ventana o limite superior#90%

endfunction