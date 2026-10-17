function [EUmes, consumo_mes] = gastoGas(volagua, Tamb, n, precio_KWh)

    % Datos agua
    dagua = 1000;                                  % Densidad del agua (kg/m^3)
    cpagua = 4.184;                                % Calor específico del agua (kJ/(kg·°C))
    magua = dagua * (volagua * (10^(-3)));         % Masa de agua (kg)
    T2 = 50;                                       % Temperatura máxima del calentador (°C)

    % Datos gas natural
    PCIgas = 13.05;                                % PCI (kWh/kg)
    dgas = 0.828;                                  % Densidad del gas (kg/m^3)

    % Calor necesario para calentar el agua (kJ)
    QutilkJ = magua * cpagua * (T2 - Tamb);
    
    % Conversión de kJ a kWh (1 kWh = 3600 kJ)
    QutilKWh = QutilkJ / 3600;

    % Calor total necesario de gas teniendo en cuenta el rendimiento (kWh)
    Qnecesario = QutilKWh / n;

    mgas = Qnecesario / PCIgas;
    consumo = mgas / dgas;                         % Consumo en m^3/día

    % Coste económico diario (€/día)
    EU = precio_KWh * Qnecesario;
    
    EUmes=EU*30;
    consumo_mes=consumo*30;

end