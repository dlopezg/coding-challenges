%% RETO DE PROGRAMACIÓN: Dificultad ***··
% Eres un biólogo que examina secuencias de ADN de formas de vida 
% diferentes. Se te darán dos secuencias de ADN, y el objetivo es encontrar
% el conjunto ordenado de bases adyacentes de mayor tamaño que es común en 
% ambos ADNs.

% Las secuencias de ADN se darán como conjuntos ordenados de bases de 
% nucleótidos: adenina (A), citosina (C), guanina (G) y timina (T):

% ATGTCTTCCTCGA 
% TGCTTCCTATGAC

% Para el ejemplo anterior, el resultado es CTTCCT porque que es el 
% conjunto ordenado de bases adyacentes de mayor tamaño que se encuentra en 
% ambas formas de vida.

clear all
clc

adnSec1 = 'ctgggccttgaggaaaactg';
adnSec2 = 'gtaccagtactgatagt';

maxAdyBasis = [];

tic

for i = 1 : length(adnSec1) 
    for j = 1 : length(adnSec2)
        if adnSec1(i) == adnSec2(j)
            
            % Encontrada coincidencia, ahora seguimos avanzando para
            % encontrar posibles coincidencias futuras.
            adyb = adnSec1(i);         
            idx1 = i+1; idx2 = j+1;
            
            while idx1 <= length(adnSec1) && idx2 <= length(adnSec2)
                if adnSec1(idx1) == adnSec2(idx2)
                   adyb = [adyb adnSec1(idx1)];
                   idx1 = idx1 + 1; idx2 = idx2 + 1;
                else
                    break;
                end
            end
            
            % Actualizamos si la cadena encontrada es la mas larga hasta el
            % momento:
            if length(adyb) > length(maxAdyBasis)
                maxAdyBasis = adyb;
            end
            
        end
    end
end

toc
disp('El conjunto de bases adyacentes es:');
disp(maxAdyBasis);
