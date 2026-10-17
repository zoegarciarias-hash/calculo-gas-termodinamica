% PARÁMETROS EXPERIMENTALES
    nduchasdia = 3;             % Duchas totales al día en el piso
    nfregaplatos = 3;           % Veces que se friega al día
    tmedfregaplatos = 3;        % Tiempo medio fregando con grifo abierto (minutos)
    tmedducha = 8;              % Tiempo medio por ducha (en minutos)
    
    Qalcachofa = 0.183;         % Caudal medido de la ducha (litros/segundo)
    Qgrifo = 0.094;             % Caudal medido del grifo de la cocina (litros/segundo)
    
    Tamb = 15;                  % Temperatura del agua de red (°C)
    n = 0.85;                   % Rendimiento del calentador Vulcano (85%)
    precio_KWh = 0.08;          % Precio de referencia del gas en Portugal (€/kWh)

    % Volumen total de agua
    volagua_dia = volTotal(nduchasdia, tmedducha, nfregaplatos, tmedfregaplatos, Qalcachofa, Qgrifo);

    % Gasto de gas y coste mensual
    [EUmes, consumo_mes] = gastoGas(volagua_dia, Tamb, n, precio_KWh); 


    % Resultados
    fprintf(' Volumen de agua caliente diario:  %.0f litros/día\n', volagua_dia);
    fprintf(' Consumo mensual de gas:           %.2f m^3/mes\n', consumo_mes);
    fprintf(' Coste económico mensual estimado: %.2f €/mes\n', EUmes);
