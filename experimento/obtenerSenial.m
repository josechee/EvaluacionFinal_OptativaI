function senial = obtenerSenial(BD)
  data = BD(:,2:end);% quita automaticamente la primera columna completa de la base de datos  
  [F_1,C_1]=size(data); % obtiene la dimensionalidad de las columnas y las filas de la senial BD
  BD_UNIDIMENSIONAL = reshape(data,[1,(F_1*C_1)]); % se convierte en la senial (unidemensional)
  senial = BD_UNIDIMENSIONAL;% retorna la senial original (unidimensional) a utilizar en la practica
  return
endfunction