#La funcion de a continuacion permite evitar el sobre ajuste u Overfitting
function errorPromedio = ValidacionCruzadaDejandoUnoFuera(TRAIN) 
  %TRAIN=load('BD_TRAIN');
  [filasTRAIN,columnasTRAIN]=size(TRAIN);
  suma=0;
  for i=1:filasTRAIN  
    conjuntoTrain=TRAIN;
    [filasConjuntoTrain,columnasConjuntoTrain]=size(conjuntoTrain);
    validacion=zeros(1,columnasConjuntoTrain);
    validacion=conjuntoTrain(i,:);
    conjuntoTrain(i,:)=[];
    %Pasar al algoritmo KNN con valor de [1] vecino
    error = KNN(conjuntoTrain,validacion,1);
    suma=suma+error;
  endfor
  errorPromedio=suma/filasConjuntoTrain;
 
endfunction
