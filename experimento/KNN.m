function  error = KNN(TRAIN, TEST, K)  ##TRAIN va ser la TRAIN original y TEST va ser TRAIN ya aplicado los algoritmos
  TRAIN_clases = TRAIN(:,1);  % las clases del conjunto TRAIN
  TRAIN(:,1) = [];            % Quitamos la columna de las clases
  TEST_clases = TEST(:,1);    % Obteniendo las clases de TEST
  TEST(:,1) = [];             % Quitamos la columna de las clases
  correctas = 0;
  
  for i=1:length(TEST_clases)
    clasificar_esta_instancia = TEST(1,:);#TRAIN
    clase_actual = TEST_clases(i);
    #predecir_clase = clasificador(TRAIN,TRAIN_clases,clasificar_esta_instancia);
    predecir_clase=KnnClasificador(TRAIN,TRAIN_clases,clasificar_esta_instancia,K);#knn multiples##checar esta parte como conbiene enviar las BD
    #por que marca el error de:
    %%KNN>KnnClasificador at line 49 column 19
    %%KNN at line 12 column 19
    %%fCalcularAptitud at line 60 column 7
    %%principal at line 37 column 14
    if predecir_clase == clase_actual
      correctas = correctas +1;
    endif
  endfor
  %Error de clasificación para 1-NN
  error = (length(TEST_clases)-correctas)/length(TEST_clases);
endfunction

function prediccion = clasificador(TRAIN,TRAIN_clases,clasificar_esta_instancia)
  mejor_distancia = inf;
  % Se compara la instancia actual del test contra todas las instancias
  % del conjunto de entrenamiento
  for i=1:length(TRAIN_clases)
    instancia_comparar = TRAIN(i,:);
    % Se calcula la distancia Euclidiana
    distancia = sqrt(sum((instancia_comparar-clasificar_esta_instancia).^2));
    % Se obtiene el mejor vecino más cercano
    if distancia < mejor_distancia
        prediccion = TRAIN_clases(i);
    endif  
    mejor_distancia = distancia;
    
  endfor    
  prediccion;
endfunction

################FUNCION DE KNN CON MULTIPLES K VECINOS MAS CERCANOS##########
function predicciones = KnnClasificador(TRAIN, TRAIN_clases, clasificar_esta_instancia, k)
  #k: numero de vecinos mas cercanos
    predicciones = zeros(rows(clasificar_esta_instancia), 1);
    for i = 1:rows(clasificar_esta_instancia)
        dist = sqrt(sumsq((clasificar_esta_instancia(i,:) - TRAIN), 2)); % Calcular la distacia Euclidiana

        todos = [dist, TRAIN_clases]; % distancias que se concatenan con las clases
        [sorted, orig] = sortrows(todos, 1); % Ordenar por las distancias
        k_nearest = sorted(1:k, :); % tomar los valores k mínimos
        [m, f, c] = mode(k_nearest(:, 2)); % buscar la moda  o valores mas repetitivo de la segunda columna

        vinculados = size(c{1}, 1);
        if (vinculados > 1)
            class = c{1}(randi(vinculados)); % seleccionar una de las clases
        else
            class = m;
        endif
        predicciones(i,:) = class;       
    endfor
    prediccion=predicciones(1,:); 
    return
endfunction