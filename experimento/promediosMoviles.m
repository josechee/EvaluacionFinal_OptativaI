function m = promediosMoviles(senial,n)
  m=zeros(1,length(senial)); 
  for i=1:length(senial)
    posActual=i;
    posFinal=i+(n-1);
    posFuturo=posActual+(n-1);   
    
    if posFuturo<=length(senial)   
        m(i)=mean(senial(1,posActual:posFinal));#/n;   
    else        
      posAux=i+n;
      auxpos=posAux-length(senial);      
      posFinal=auxpos-1;
      sumAux=0;
      
      for iAux=posActual:length(senial)
        sumAux=sumAux+senial(iAux);
      end
      
      for iAux2=1:posFinal
        sumAux=sumAux+senial(iAux2);
      end
      m(i)=sumAux/n;      
    end        
  end
endfunction


