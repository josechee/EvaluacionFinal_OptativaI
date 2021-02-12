clear all;
TRAIN=load('BD_TRAIN');

# programacion Evolutiva

[CLASES,BD_SIN_CLASES]=quitar_obtener_Clases(TRAIN); %% quitar las clases y obtener solo las clases
                                                     %% sirve tambien obtener solo la base de datos sin la clase
senial_F1= BD_SIN_CLASES(1,:); #obtener la primera senial o la primera fila de la BD sin la clase

w1_min = 2;
w1_max = length(senial_F1); 

w2= ventanas(senial_F1);## obtener el porcentaje de ventanas que se mandara de la la primera senia (fila 1)
w2_min = round(w2(1)) # aplicar el redondeo hacia arriba si es >=.5
w2_max = round(w2(2)) # aplicar el redondeo hacia abajo si es <.5

k_min = 1;
k_max = 1;%%%aqui era 100 
##considerar aqui solo un vecino en la validacion cruzada 

#obtener esos valores para ser utilizados los difenretes algorirmo que indica en el requerimiento 

D = 3;          # dimension del vector %aqui seria D = 3  %%para el valor de k se sugiere como valor a k = 100
Lim_max = [w1_max,w2_max,k_max];   # limite superior % se va tener un vector de diferente limite pejp = [LongitudSenial,LongitudSenial,100] 
Lim_min = [w1_min,w2_min,k_min];  # limite inferior % se va tener un vector de diferente limite pejp = [2,20,1]

#Lim_max = [261,212,19];   # limite superior % se va tener un vector de diferente limite pejp = [LongitudSenial,LongitudSenial,100] 
#Lim_min = [146,170,5];
P = 1;       # tamanio de la poblacion
G = 2;        # numero de generaciones
PM = 0.9;     # probabilidad de mutacion

#####################
#CHECAR ESTA PARTE CON RESPECTO A LA VALIDACION CRUZADA 
#PROBAR POR PARTES COMO AHORA QUE CON POBLACION 1 PARA REDUCIR EL TIEMPO DE EJECUCION
#########################

#generar la poblacion inicial
poblacion = zeros(P,D);
poblacion = fGenerarPop(poblacion,Lim_min,Lim_max,D,P);

#######evaluar las soluciones#######
evaluaciones = fCalcularAptitud(poblacion,P,TRAIN);


#------------------------Inicia las iteraciones-----------------------------
%{
for i=1:1##Aqui es G
  #Operador de mutacion  
  hijos = fOperadorMutacion(poblacion,Lim_min,Lim_max,P,D,PM);
  eval_hijos = fCalcularAptitud_HIJOS(hijos,P,TEST,TRAIN);##era solo fCalcularAptitud
  
  #Torneos estocasticos
  #juntar las poblaciones tanto de los padres como de los hijos
  poblacionTotal = [poblacion;hijos];
  evaluacionTotal = [evaluaciones,eval_hijos];
  #seleccionPoblacion_hijos = torneo(poblacion,hijos,2);
  
  seleccionEvaluaciones_eval_hijos1 = torneo(poblacionTotal,evaluacionTotal,2);% al reves esto si funciona
  #seleccionPoblacion_eval_hijos1 = torneo(poblacion,eval_hijos,2);
  
  #seleccionEvaluaciones_eval_hijos2 = torneo(eval_hijos,evaluaciones,2);
  #seleccion_PobTotal_evaluacionTotal = torneo(poblacion,hijos,2);
  #Checar por acá en esta parte decidir o ver masomenos de que forma se va evaluar este en la seleccion por torneo
  #si con poblacionTotal con evaluacionTotal o con los subconjuntos de este    
  #####  
endfor

##RESULT
mejor = min(evaluacionTotal);
peor = max(evaluacionTotal);
mediana = median(evaluacionTotal);
media = mean(evaluacionTotal);
desvStandar= std(evaluacionTotal);
%}