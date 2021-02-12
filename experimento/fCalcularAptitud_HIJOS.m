function RES =  fCalcularAptitud_HIJOS(poblacion,P,TRAIN)  
    
  #Aqui se va aplicar la reduccion de ruido
  #Aqui se va aplicar la reduccion de dimensionalidad
  #Aqui se va aplicar KNN
  RES = [];

  [CLASES,BD_SIN_CLASES]=quitar_obtener_Clases(TRAIN);#obtener clases y los datos de TRAIN por separado  
  [filas,columnas] = size(BD_SIN_CLASES);#obtener el Numero de filas y de las columnas de TRAIN
   [P_HIJOS,COLUMNAS_HIJOS] = size(poblacion);
  #TRAIN_PROCESADO=zeros(filas,columnas);#reservar matriz en que se va ir guardando los
   TRAIN_PROCESADO = zeros([filas,columnas]);                                #nuevas seniales procesadas con los dos primeros algoritmos
                                          
  for i=1:P_HIJOS#CAMBIAR A P, aqui solo se cambió para una prueba unicamente para 1 individuo
   individuo = poblacion(i,:);
   
   ##arrayAux=zeros(1,individuo(1,2));   
   # Funcion de aptitud
   for j=1:filas #obtener fila por fila cada una de las seniales de la BD
   #Aca se aplicaran los dos algoritmos que es el de promediosMoviles y PAA  
   senialFila = BD_SIN_CLASES(j,:);#obtener las filas por filas de TRAIN como senial
   senial_PromediosMoviles = promediosMoviles(senialFila,individuo(1,1));
   senial_PAA = PAA(senial_PromediosMoviles,individuo(1,2));
   arrayAux=[];
   arrayAux=zeros(1,columnas);   
    for band=1:length(senial_PAA) #Ir almacenando al TRAIN_PROCESADO fila por fila las seniales procesadas
      arrayAux(band)=senial_PAA(band);
      #TRAIN_PROCESADO(j,band)=senial_PAA(band);
    endfor
    TRAIN_PROCESADO(j,:)=arrayAux;
     
   endfor
    #Aqui se va llamar la funcion para juntar las clases con loa datos
    TRAIN_PROCESADO_CON_CLASES=juntar_Clases_Datos(CLASES,TRAIN_PROCESADO);
    
   
   #Aca se aplicara el a  lgoritmo de KNN 
   #err=KNN(TRAIN,TRAIN_PROCESADO_CON_CLASES,individuo(1,3));
   err=ValidacionCruzadaDejandoUnoFuera(TRAIN_PROCESADO_CON_CLASES);
   RES=[RES,err];
  endfor
  
  
endfunction