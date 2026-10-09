% 1.
A = cell(1, 4);
A{1} = 'Eigardas';
A{2} = '2007-04-22';
A{3} = '+37060000001';
A{4} = [8 9 7 10; 9 8 8 9];
 
B = cell(1, 4);
B{1} = 'Erikas';
B{2} = '2006-11-02';
B{3} = '+37060000002';
B{4} = [7 8 9 8; 10 9 9 8];
 
C = [A; B];
 
figure(1);
cellplot(C);
title('Apjungtas masyvas');
 
disp(['A ilgis: ', num2str(length(A))]);
disp(['C dydis: ', num2str(size(C))]);
disp('isempty:');  disp(cellfun(@isempty, C));
disp('class:');    disp(cellfun(@class, C, 'UniformOutput', false));
disp('isreal:');   disp(cellfun(@isreal, C));
disp(['A{1} yra char? ', num2str(isa(A{1}, 'char'))]);
disp(['C yra cell? ', num2str(iscell(C))]);
 
pazymiai = cell2mat(C(:, 4));
disp('Pazymiai:'); disp(pazymiai);
 
figure(2);
bar(pazymiai');
title('Pazymiai');
xlabel('Dalykas'); ylabel('Pazymys');
legend('Jonas 1 sem.', 'Jonas 2 sem.', 'Petras 1 sem.', 'Petras 2 sem.');
 
%% 2.
m = input('Iveskite skaiciu m: ');
pasirinkimas = input('Pasirinkite funkcija (1 - sin, 2 - cos): ');
 
if pasirinkimas == 1
    f = @sin;
    vardas = 'sin(x)';
else
    f = @cos;
    vardas = 'cos(x)';
end
 
figure(3);
for k = 1:15
    x = m:.1:m+4*pi;
    clf;
    stem(x, f(x));
    title([vardas, ',  m = ', num2str(m, '%.4f'), ',  zingsnis ', num2str(k), '/15']);
    xlabel('x'); ylabel(vardas);
    grid on;
    disp(['Zingsnis ', num2str(k), ': m = ', num2str(m)]);
    pause(0.5);
    m = m + pi/8;
end

%% Papildoma
s = input('Iveskite sakini: ', 's');
 
rezultatas = '';
pasalinta = 0;
 
for k = 1:length(s)
    if s(k) == ' ' && k > 1 && s(k-1) == ' '
        pasalinta = pasalinta + 1;      % pasikartojanti tarpa praleidziame
    else
        rezultatas(end+1) = s(k);       % kitus simbolius paliekame
    end
end
 
disp(['Apdorotas sakinys: ', rezultatas]);
disp(['Pasalinta tarpu: ', num2str(pasalinta)]);