%% RETO DE PROGRAMACIÓN: Dificultad: **···

% Tienes un reloj digital con LEDs de 7 segmentos. Un día, al despertar de
% un sueño de ciencia-ficción, te preguntas: ¿cuántos segmentos se han
% encendido DESPUÉS DE X segundos, desde la posición 00:00:00?

% Considera que en cada segundo, todos los led se apagan y luego se
% encienden los correspondientes al instante actual.

%% Solución:
clc
clear all

tic
nseg = 10^20;

% Lo primero que vamos a hacer es asignar el número de leds que se
% encienden a cada uno de los posibles valores que puede tomar el led, es
% decir, de 0 a 9:

% digit  0 1 2 3 4 5 6 7 8 9
nleds = [6 2 5 5 4 5 6 3 7 6];

% Valor inicial en 00:00:00:
counter = 36;


segundosVueltaCompleta = 86400;

% Primera vuelta:
horasCompletas = floor(nseg/3600);
resto = nseg - 3600*horasCompletas;
minutosCompletos = floor(resto/60);
segundosCompletos = resto - 60 * minutosCompletos;

% OPTIMIZACIÓN PARA NÚMEROS GRANDES:
vueltasCompletas = floor(horasCompletas/24);

if vueltasCompletas > 0
    restoUltimaVuelta = nseg - segundosVueltaCompleta * vueltasCompletas;
else
    restoUltimaVuelta = nseg;
end


seg = 0;
while seg < nseg
    seg = seg + 1;
    digitValue = [0 0 0 0 0 0];
    % Mapeamos este segundo en los 6 dígitos del reloj, comenzamos por las
    % horas con los dos primeros dígitos:
    
    horasCompletas = floor(seg/3600);
    resto = seg - 3600*horasCompletas;
    minutosCompletos = floor(resto/60);
    segundosCompletos = resto - 60 * minutosCompletos;
    
    % Actualizamos el valor de los dígitos y añadimos ceros a la izquierda
    % si los necesitamos:
    
    if horasCompletas <= 9
        digitValue(2) = horasCompletas;
    else
        digitValue(1:2) = dec2base(horasCompletas,10) - '0';
    end
    
    if minutosCompletos <= 9
        digitValue(4) = minutosCompletos;
    else
        digitValue(3:4) = dec2base(minutosCompletos,10) - '0';
    end
    
    if segundosCompletos <= 9
        digitValue(6) = segundosCompletos;
    else
        digitValue(5:6) = dec2base(segundosCompletos,10) - '0';
    end
    
    % Evaluamos el valor actual de los dígitos
    counter = counter + sum(nleds(digitValue+1));
    
    % Almacenamos temporalmente el valor del resto para numeros grandes:
    if seg == restoUltimaVuelta
        tem = counter;
    end
    
    % Hacemos el calculo final para numeros grandes y salimos del bucle:
    if seg == segundosVueltaCompleta - 1
        ledsVueltaCompleta = counter;
        counter = ledsVueltaCompleta + (vueltasCompletas-1)*(ledsVueltaCompleta+36) + tem;
        break;
    end
end

disp(counter);
toc;
