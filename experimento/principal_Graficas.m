clear all;
#TRAIN=load('CinC_ECG_torso_TRAIN');# opcupar primero esta base de datos
#TRAIN=load('Coffee_TRAIN');
TRAIN=load('Coffee_TEST');
TEST=load('CinC_ECG_torso_TEST');

# programacion Evolutiva

[CLASES,BD_SIN_CLASES]=quitar_obtener_Clases(TRAIN); %% quitar las clases y obtener solo las clases
                                                     %% sirve tambien obtener solo la base de datos sin la clase
senial_F1= BD_SIN_CLASES(1,:);##obtener la primera senial o la primera fila de la BD sin la clase

w1_min = 2;
w1_max = length(senial_F1); 

w2= ventanas(senial_F1);## obtener el porcentaje de ventanas que se mandara de la la primera senia (fila 1)
w2_min = round(w2(1)) # aplicar el redondeo hacia arriba si es >=.5
w2_max = round(w2(2)) # aplicar el redondeo hacia abajo si es <.5

k_min = 1;
k_max = 20;%%%aqui era 100 

D = 3;          # dimension del vector %aqui seria D = 3  %%para el valor de k se sugiere como valor a k = 100

Lim_max = [289,208,9];   # limite superior % se va tener un vector de diferente limite pejp = [LongitudSenial,LongitudSenial,100] 
Lim_min = [149,132,8];
P = 10;        # tamanio de la poblacion
G = 2;        # numero de generaciones
PM = 0.8;        # probabilidad de mutacion

#graficas_Originales = graficar_Clase(TRAIN,0);
graficas_Procesadas= graficas(P,TEST,TRAIN,Lim_min,Lim_max);