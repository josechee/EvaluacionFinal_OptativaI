function [ventana] = ventanas(senial)
  
  ventana=[];
  longSenial=length(senial);
  ventana =(longSenial*2)/100;%tamanio de ventana o limite inferior #20%
  ventana =[ventana,(longSenial*20)/100];%tamanio de ventana o limite superior#90%

endfunction