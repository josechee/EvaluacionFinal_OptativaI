function TRAIN_PROCESADO_CON_CLASES =  graficas(P,TEST,TRAIN,Lim_min,Lim_max)  
    
  
  [CLASES,BD_SIN_CLASES]=quitar_obtener_Clases(TRAIN);#obtener clases y los datos de TRAIN por separado  
  [filas,columnas] = size(BD_SIN_CLASES);#obtener el Numero de filas y de las columnas de TRAIN
  
  #TRAIN_PROCESADO=zeros(filas,columnas);#reservar matriz en que se va ir guardando los
   TRAIN_PROCESADO = zeros([filas,columnas]); #nuevas seniales procesadas con los dos primeros algoritmos
                                          

   for j=1:filas #obtener fila por fila cada una de las seniales de la BD
   #Aca se aplicaran los dos algoritmos que es el de promediosMoviles y PAA  
   senialFila = BD_SIN_CLASES(j,:);#obtener las filas por filas de TRAIN como senial
  # senial_PromediosMoviles = promediosMoviles(senialFila,Lim_min(1,1));
   #senial_PAA = PAA(senial_PromediosMoviles,Lim_min(1,2));
   senial_PAA = PAA(senialFila,Lim_min(1,2));
   arrayAux=[];
   arrayAux=zeros(1,columnas);   ##sustituir senial_PromediosMoviles por senial_PAA
    for band=1:length(senial_PAA) #Ir almacenando al TRAIN_PROCESADO fila por fila las seniales procesadas
      arrayAux(band)=senial_PAA(band);
      #TRAIN_PROCESADO(j,band)=senial_PAA(band);
    endfor
    TRAIN_PROCESADO(j,:)=arrayAux;
  
   
 endfor
    #Aqui se va llamar la funcion para juntar las clases con loa datos    
    TRAIN_PROCESADO_CON_CLASES=juntar_Clases_Datos(CLASES,TRAIN_PROCESADO);
    retorno=graficar_Clase(TRAIN_PROCESADO_CON_CLASES,0);
  
 
  
endfunction