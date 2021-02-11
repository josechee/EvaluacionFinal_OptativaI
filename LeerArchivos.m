function imagen = LeerArchivos(archivo)

  directorio = ('C:\Users\Public\finalPseniales\imgenes\');  
  archivoAleer = strcat(directorio,char(archivo));
  imagen = imread(archivoAleer);
  #imshow(imagen);
  
endfunction



  

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
