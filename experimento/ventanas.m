function [ventana] = ventanas(senial)
  
  ventana=[];
  longSenial=length(senial);
  ventana =(longSenial*20)/100;%tamanio de ventana o limite inferior
  ventana =[ventana,(longSenial*90)/100];%tamanio de ventana o limite superior

endfunction