%% a)
x = linspace(-2, 2, 20);
y = linspace(-2, 2, 20);
z = linspace(-1, 1, 20);

[X, Y, Z] = meshgrid(x, y, z);
R2 = X.^2 + Y.^2 + Z.^2;
F = sin(R2 / 20) .* exp(-R2);

figure('Name', 'a)');

hs = slice(X, Y, Z, F, 0, 0, 0);

colormap(gray);
shading interp;
colorbar;

for k = 1:numel(hs)
    rotate(hs(k), [0 0 1], 45);
end

axis tight;
grid on;
view(3);
xlabel('x ašis');
ylabel('y ašis');
zlabel('z ašis');
title('f(x,y,z) = sin((x^2+y^2+z^2)/20) \cdot e^{-(x^2+y^2+z^2)}');

%% b)
x2 = linspace(-1, 1, 30);
y2 = linspace(-1, 1, 30);
[X2, Y2] = meshgrid(x2, y2);

r = sqrt(X2.^2 + Y2.^2);
Z2 = exp(r.^2);

figure('Name', 'b)');

hsurf = surf(X2, Y2, Z2);

colormap(jet);
shading interp;
colorbar;

rotate(hsurf, [0 0 1], 70);

axis tight;
grid on;
view(3);
xlabel('x ašis');
ylabel('y ašis');
zlabel('z ašis');
title('z(r) = e^{r^2},  r = \surd(x^2+y^2)');

%% Papildoma užduotis
% z(x,y) = 1 - (x^2 + y^2)

x = linspace(-1, 1, 40);
y = linspace(-1, 1, 40);
[X, Y] = meshgrid(x, y);

Z = 1 - (X.^2 + Y.^2);

spalvos = {'jet', 'hot', 'cool'};

figure('Name', 'Colormap savybės');

for k = 1:numel(spalvos)
    subplot(1, 3, k);
    surf(X, Y, Z);
    colormap(gca, spalvos{k});
    shading interp;
    colorbar;
    axis tight;
    grid on;
    view(3);
    xlabel('x');
    ylabel('y');
    zlabel('z');
    title(['colormap: ', spalvos{k}]);
end