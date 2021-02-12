function senialTRAIN = ObtenerSenialLongitudFinal(senialOriginal)
  columnasTRAIN=2522;
  senialAuxiliar=zeros(1,2522);
  for i=1:columnasTRAIN
    if i<=(length(senialOriginal))
      senialAuxiliar(1,i)=senialOriginal(i);
    endif
  endfor
  senialTRAIN=senialAuxiliar;
endfunction
