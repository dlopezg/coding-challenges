%% RETO DE PROGRAMACIÓN: Dificultad: ***··
% El alfabeto inglés contiene 26 caracteres y los teléfonos móviles sólo 
% tienen diez dígitos en el teclado. Varias letras se mapean en cada tecla 
% numérica, como se muestra en la imagen inferior, de forma que se pueda 
% escribir un mensaje con pulsaciones repetitivas. Por ejemplo, para 
% insertar el carácter B, se deberá presionar 22. Para introducir una 
% secuencia de dos caracteres a partir de la misma tecla, el usuario debe 
% hacer una pausa antes de pulsar el botón una segunda vez. 

% Por ejemplo, 2 2 indica AA mientras que 22 indica B (se muestra un 
% "carácter de espacio" para indicar una pausa).

% Debe crear un programa que calcule la secuencia de teclas que hay que 
% pulsar para escribir un cierto mensaje.

clear all
clc

str = 'foo bar';

%% SOLUCIÓN:
disp('The final sequence is:');
tic
disp(analyzeString(str));
toc

%% Functions
function keys = initializeKeyMap()
    keys.chars = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n',...
        'ñ','o','p','q','r','s','t','u','v','w','x','y','z'];
    keys.map = [2 2 2 3 3 3 4 4 4 5 5 5 6 6 6 6 7 7 7 7 8 8 8 9 9 9 9];
    keys.pos = [1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 4 1 2 3 4 1 2 3 1 2 3 4];
end

function charstr = charTransformation(str)
    charstr = [];
    for char = str
        if isnan(char) || char == 0
            charstr = [charstr ' '];
        else
            charstr = [charstr num2str(char)];
        end
    end
end

function sequence = analyzeString(str)
    seq = [];
    str = lower(str);
    keys = initializeKeyMap();
    for i = 1 : length(str)
        if str(i) ~= ' '
            pos = keys.pos(str(i) == keys.chars);
            key = keys.map(str(i) == keys.chars);
            if i > 1
                anteriorKey = keys.map(str(i-1) == keys.chars);
                if anteriorKey == key
                    seq = [seq NaN];
                end
            end
            for j = 1 : pos
                seq = [seq key];
            end
        else
            seq = [seq 0];
        end
    end
    sequence = charTransformation(seq);
end