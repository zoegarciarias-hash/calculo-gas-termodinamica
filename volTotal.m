function [volagua] = volTotal(nduchasdia, tmedducha, nfregaplatos, tmedfregaplatos, Qalcachofa, Qgrifo)
    volagua = (nduchasdia * (tmedducha * 60) * Qalcachofa) + (nfregaplatos * (tmedfregaplatos * 60) * Qgrifo);
% Unidades en litros (l)
end