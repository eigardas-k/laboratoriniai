x = -pi:0.1:pi;
 
% a)
f1 = tan(sin(x)) + sin(tan(x));
figure(1);
plot(x, f1, 'y', 'LineWidth', 1.5);
axis([-pi pi min(f1)-0.2 max(f1)+0.2]);
grid on;
set(gca, 'Color', [0.35 0.35 0.35]);
title('f(x) = tan(sin(x)) + sin(tan(x))');
xlabel('x');
ylabel('f(x)');
legend('tan(sin(x)) + sin(tan(x))', 'Location', 'best');
 
% b)
y1 = exp(-0.5*x);
y2 = sin(x);
figure(2);
[ax, h1, h2] = plotyy(x, y1, x, y2, 'semilogy', 'plot');
set(h1, 'LineWidth', 1.5);
set(h2, 'LineWidth', 1.5, 'LineStyle', '--');
grid on;
title('f(x) = e^{-0.5x} ir f(x) = sin(x)');
xlabel('x');
ylabel(ax(1), 'e^{-0.5x} (logaritmine skale)');
ylabel(ax(2), 'sin(x) (tiesine skale)');
legend([h1 h2], 'e^{-0.5x}', 'sin(x)', 'Location', 'north');
 
%% 2.
N = 6;
M = 4;
Mat = rand(N, M);
 
% a)
figure(3);
area(Mat);
colormap(gray);
title('Matricos ploto diagrama (area)');
xlabel('Eilutes indeksas (i)');
ylabel('Reiksmiu suma');
legend(arrayfun(@(k) sprintf('%d stulpelis', k), 1:M, 'UniformOutput', false), ...
       'Location', 'eastoutside');
 
% b)
figure(4);
mesh(Mat);
title('Matricos pavirsius (mesh)');
xlabel('Stulpelio indeksas (j)');
ylabel('Eilutes indeksas (i)');
zlabel('Mat(i,j) reiksme');
 
% a)
x = (-pi:0.7:2*pi)';
% b)
y = cos(x);
% c)
z = x.^y;
% d)
z'
 
% a)
X = [exp(5), exp(-1/exp(1)), log(1);
     log(pi), -2, -sin(pi)];
% b)
X_13 = [X(2,1)^2, X(1,3), X(2,3)^2];
X = [X; X_13];
det_X = det(X);
disp('X matrica:');
disp(X);
disp('Determinantas:');
disp(det_X);
 
A = 6;
f = 7;
sigma = 1.2;
U1 = 4;
U2 = 2;
 
t = 0:0.002:2;
s = A * sin(2 * pi * f * t);
n = sigma * randn(size(t));
s_triuksmingas = s + n;
 
s_atrinktas = s_triuksmingas(s_triuksmingas > U1);
 
s_filtruotas = s_triuksmingas;
s_filtruotas(abs(s_filtruotas) < U2) = 0;
 
dydis_nefiltruoto = length(s_triuksmingas);
dydis_atrinktu = length(s_atrinktas);
 
max_filtruotas = max(s_filtruotas);
min_filtruotas = min(s_filtruotas);
 
disp('=== Rezultatai ===');
fprintf('c) Nefiltruoto signalo elementų skaičius: %d\n', dydis_nefiltruoto);
fprintf('d) Atrinktų (viršijančių U1) reikšmių skaičius: %d\n', dydis_atrinktu);
fprintf('e) Didžiausia filtruoto signalo įtampa: %.4f V\n', max_filtruotas);
fprintf('   Mažiausia filtruoto signalo įtampa: %.4f V\n', min_filtruotas);
 
U  = s_triuksmingas;
Uf = s_filtruotas;
 
idx = U > U1;
tv  = t(idx);
Uv  = U(idx);
 
Umax = max(Uv);  Umin = min(Uv);
imax = (Uv == Umax);
imin = (Uv == Umin);
 
figure(5);
titleProps = {'FontWeight', 'bold', 'FontSize', 13};
 
% a)
subplot(1, 2, 1);
hold on;
plot(t, U,  '--', 'LineWidth', 1);
plot(t, Uf, '-',  'LineWidth', 1.75);
yline(U1, '-.k', 'LineWidth', 1);
yline(U2, '-.b', 'LineWidth', 1);
hold off;
grid on;
axis([min(t) max(t) min(U)-1 max(U)+1]);
title('Pradinis ir filtruotas signalai', titleProps{:});
xlabel('Laikas t, s');
ylabel('Itampa U, V');
legend('Pradinis signalas', 'Filtruotas signalas', ...
       'Riba U_1', 'Riba U_2', 'Location', 'best');
 
% b)
subplot(1, 2, 2);
stem(tv, Uv, 'filled', 'MarkerSize', 3);
hold on;
plot(tv(imax), Uv(imax), 's', 'MarkerSize', 8, ...
     'MarkerEdgeColor', [0.5 0 0.5], 'MarkerFaceColor', [0.5 0 0.5]);
plot(tv(imin), Uv(imin), 'o', 'MarkerSize', 8, ...
     'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r');
hold off;
grid on;
axis([min(t) max(t) 0 Umax+1]);
title('Reiksmes, virsijancios U_1 riba', titleProps{:});
xlabel('Laikas t, s');
ylabel('Itampa U, V');
legend('Reiksmes > U_1', 'Maksimali reiksme', 'Minimali reiksme', ...
       'Location', 'best');
 
A = input("iveskite vektoriu a");
B = [A(end:-1:6), A(1:5)];
disp("vektorius b")
disp(B)