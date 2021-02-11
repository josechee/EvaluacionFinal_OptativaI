clear all;

#VERIFICAR QUE LA LECTURA SEA AUTOMATIZADA I.E. CONCATENANDO EL DIRECTORIO Y EL ARCHIVO
directorio = ('C:/Users/Public/finalPseniales/');
nombreArchivo = 2
extensionArchivo = '.jpg'
imagen = imread('2.jpg');

%{ 
#SE COMENTO PARA PODER COMPROBAR QUE SE AUTOMATICE LA LECTURA DE LAS IMAGENES DE ARRIBA
contornos = bwboundaries(imagen);
contornos = cell2mat(contornos);%transforma de celda a matriz
figure(1)
imshow(imagen);
hold on
plot(contornos(:,2),contornos(:,1)),"*b";
figure(2)
plot(contornos(:,2),"-r");#serie temporal i.e. mi senial pero solo la mitad del contorno


[filas,columnas] = size(contornos);
senial = reshape(contornos,[1,(filas*columnas)]);
figure(3)
plot(contornos(:,1),"-g");

%}
