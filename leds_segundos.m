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

nseg = 50000;

% Lo primero que vamos a hacer es asignar el número de leds que se
% encienden a cada uno de los posibles valores que puede tomar el led, es
% decir, de 0 a 9:

% digit  0 1 2 3 4 5 6 7 8 9
nleds = [6 2 5 5 4 5 6 3 7 6];
counter = 0;

% Básicamente lo que tenemos que hacer es mapear los segundos de entrada en
% el reloj digital de 6 posiciones.


for i = 0 : nseg
    digitValue = [0 0 0 0 0 0];
    % Mapeamos este segundo en los 6 dígitos del reloj, comenzamos por las
    % horas con los dos primeros dígitos:
    
    horasCompletas = floor(i/3600);
    resto = i - 3600*horasCompletas;
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
    
%     disp(digitValue)
    % Evaluamos el valor actual de los dígitos
    
    counter = counter + sum(nleds(digitValue+1));
%     for j = digitValue
%         counter = counter + nleds(j+1);
%     end
end

toc 
counter