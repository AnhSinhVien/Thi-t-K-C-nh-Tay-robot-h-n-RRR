clear all; close all; clc;

t = 1.1780972450:0.01:1.178097245*3

xE = 0.250+0.090*cos(t/0.750);
yE = 0.150+0.090*sin(t/0.750);

plot(xE,yE,'p-','linewidth',2);
xlabel('truc x');
ylabel('truc y');

%Tim Tam va ban kinh
R = ((max(xE) - min(xE))/2);
xO =  min(xE) + R;
yO =  min(yE) + R;
disp('Toa do tam O: ');
fprintf('xO = %d\n', xO);
fprintf('yO = %d\n', yO);
fprintf('R = %d\n', R);