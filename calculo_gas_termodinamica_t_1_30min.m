%% Analisis de sensibilidad
% PARÁMETROS EXPERIMENTALES
    nduchasdia = 3;             % Duchas totales al día en el piso
    nfregaplatos = 3;           % Veces que se friega al día
    tmedfregaplatos = 3;        % Tiempo medio fregando con grifo abierto (minutos)
    tmedducha = 0;              % Tiempo medio por ducha (en minutos)
    
    Qalcachofa = 0.183;         % Caudal medido de la ducha (litros/segundo)
    Qgrifo = 0.094;             % Caudal medido del grifo de la cocina (litros/segundo)
    
    Tamb = 15;                  % Temperatura del agua de red (°C)
    n = 0.85;                   % Rendimiento del calentador Vulcano (85%)
    precio_KWh = 0.08;          % Precio de referencia del gas en Portugal (€/kWh)
    
    EUmesvec=zeros(1,30);
    consumo_mesvec=zeros(1,30);
    ivec=zeros(1,30);

for i=1:30
    tmedducha = i;              % Tiempo medio por ducha (en minutos)

    % Volumen total de agua
    volagua_dia = volTotal(nduchasdia, tmedducha, nfregaplatos, tmedfregaplatos, Qalcachofa, Qgrifo);

    % Gasto de gas y coste mensual
    [EUmes, consumo_mes] = gastoGas(volagua_dia, Tamb, n, precio_KWh); 

    EUmesvec(i)=EUmes;
    consumo_mesvec(i)=consumo_mes;
    ivec(i)=i;
end


    % GRÁFICA
    figure;
    plot(ivec, EUmesvec, 'r-', ivec, consumo_mesvec, 'b--', 'LineWidth', 1.5)
    
    title('Análisis de Sensibilidad: Coste y Consumo de Gas vs. Tiempo de Ducha');
    xlabel('Tiempo medio por ducha (minutos)');
    ylabel('Coste mensual (€) / Consumo de gas (m^3)');
    
    legend('Coste mensual (€)', 'Consumo mensual (m^3)');
    grid on;
