% Paprastas skriptas

x = 1:32;
y = x.^2;

plot(x, y, 'o-r', x, y/3, 'xb')
title('Dvi funkcijos')
xlabel('X-ašis')
ylabel('F_1 [-o-]   |   F_2 [-x-]')