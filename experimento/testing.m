clear all;

#este script es para ir probando partes por partes de las funciones o del proyecto
#clear all;
#TEST=load('Coffee_TEST');
#TRAIN=load('Coffee_TRAIN');
#torso_TEST=load('CinC_ECG_torso_TEST');
#torso_TRAIN=load('CinC_ECG_torso_TRAIN');
# programacion Evolutiva

#senial= obtenerSenial(TEST);
#subplot(2,1,1);
#plot(senial);
#senialMV = promediosMoviles(senial,4);
#subplot(2,1,2);
#plot(senialMV)
#round(45.5);

#error= KNN_1(TRAIN,TEST,4)

%%%Verificar la aplicacion de los algoritmos a la senial
##figure(1);
##plot(senial_F1);
##w1_min = 2;
##senialPMoviles= promediosMoviles(senial_F1,30);
##figure(2);
##plot(senialPMoviles);
##senialPAA = PAA(senialPMoviles,40);
##figure(3);
##plot(senialPAA);

#matrizTEST=zeros(3,3);
#matrizTEST(1,:)=[1,2,3]
#matrizTEST(2,:)=[4,5,6]
#matrizTEST(3,:)=[7,8,9]
#TRAIN_PROCESADO(1,:) = [7,8,9];

AUX = [];
[F,C]=size(AUX);
length(AUX)
POP=zeros(5,8);
indAux =[];
indAux=[1,2,3,4];
individuo1=[1,2,3,4];
individuo2=[2,3,5,6,7];
individuo3=[1,2,3,4,5,6,7];
individuo4=[1,2,3,4,5,6,7,8];
individuo5=[1,2,3,4,5,6,7,8,6];
#POP = [POP;[1,2,3,4];];
#POP = [POP;individuo2];

#mediana = median(individuo5);
#desvEstandar =std(individuo5);
#POP(1;:) = indAux
#POP(1,:)=individuo4;
#POP(2,:)=individuo5;
#matriz=[1,2,3;4,5,6;7,8,9];#agregar la primera columna un nuevo vector columna de ceros 
#matriz = [matriz,[0;0;0]]

#POP=[individuo4;POP];
#TRAIN(:,1)
#auxArray=zeros(1,8);
#for i=1:length(individuo1)
#  auxArray(i)=individuo1(i);
#endfor
#AUX= [AUX;auxArray];
#AUX=[AUX;auxArray];
#for j=1:length(individuo2)
 # auxArray(j)=individuo2(j);
#endfor
#AUX=[AUX;auxArray];
#for i=1:length(individuo3)
 # auxArray(i)=individuo3(i);
#endfor
#AUX=[AUX;auxArray];
  
#for i=1:length(individuo4)
#  auxArray(i)=individuo4(i);
#endfor
#AUX=[AUX;auxArray];
  
#AUX= [AUX;auxArray];  

TRAIN=load('BD_TRAIN');
erroPromedio=ValidacionCruzadaDejandoUnoFuera(TRAIN);
#validacionCruzada=TRAIN;
#validacionCruzada(2,:)=[];

%{
i=5;
j=4;

if i != j
  disp('son diferentes');
endif

%}