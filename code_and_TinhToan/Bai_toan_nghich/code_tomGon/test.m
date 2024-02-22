close all; clear all; clc;
l1 = 0.25; l2 = 0.194; l3 = 0.265; a1 = 0.03;

% khoi tao gia tri ban dau
q=[0.7649928327;-0.3812343942;0.3543431040];

% thoi gian chuyen dong
t = 1.1780972450:0.01:1.178097245*3.01;

% mang liet ke ket qua thoi gian
q1 = zeros(size(t));
q2 = zeros(size(t));
q3 = zeros(size(t));

for i = 1:length(t)
    % Tính toán các giá tri tai thoi gian t(i)
    xE = 0.25 + 0.09 * cos(t(i) / 0.75);
    yE = 0.15 + 0.09 * sin(t(i) / 0.75);
    zE = 0;

    % khai bao cac giai tri tai thoi gian t(i)
    q_temp = q;
    
    f1 = l3 * cos(q_temp(2) - q_temp(3)) * cos(q_temp(1)) - cos(q_temp(1)) * (a1 - l2 * cos(q_temp(2))) - xE;
    f2 = l3 * cos(q_temp(2) - q_temp(3)) * sin(q_temp(1)) - sin(q_temp(1)) * (a1 - l2 * cos(q_temp(2))) - yE;
    f3 = l1 + l2 * sin(q_temp(2)) + l3 * sin(q_temp(2) - q_temp(3)) - zE;
    
    k=1;
    % Tính toán q tai thoi diem t(i)
    while(norm([f1; f2; f3],2)>1e-12&&k<30) %norm(lk,2) = norm(lk
%         f1 = l3 * cos(q_temp(2) - q_temp(3)) * cos(q_temp(1)) - cos(q_temp(1)) * (a1 - l2 * cos(q_temp(2))) - xE;
%         f2 = l3 * cos(q_temp(2) - q_temp(3)) * sin(q_temp(1)) - sin(q_temp(1)) * (a1 - l2 * cos(q_temp(2))) - yE;
%         f3 = l1 + l2 * sin(q_temp(2)) + l3 * sin(q_temp(2) - q_temp(3)) - zE;

        K = zeros(3, 3);
        K(1, 1) = sin(q_temp(1)) * (a1 - l2 * cos(q_temp(2))) - l3 * cos(q_temp(2) - q_temp(3)) * sin(q_temp(1));
        K(1, 2) = -l2 * cos(q_temp(1)) * sin(q_temp(2)) - l3 * sin(q_temp(2) - q_temp(3)) * cos(q_temp(1));
        K(1, 3) = l3 * sin(q_temp(2) - q_temp(3)) * cos(q_temp(1));

        K(2, 1) = l3 * cos(q_temp(2) - q_temp(3)) * cos(q_temp(1)) - cos(q_temp(1)) * (a1 - l2 * cos(q_temp(2)));
        K(2, 2) = -l2 * sin(q_temp(1)) * sin(q_temp(2)) - l3 * sin(q_temp(2) - q_temp(3)) * sin(q_temp(1));
        K(2, 3) = l3 * sin(q_temp(2) - q_temp(3)) * sin(q_temp(1));

        K(3, 1) = 0;
        K(3, 2) = l2 * cos(q_temp(2)) + l3 * cos(q_temp(2) - q_temp(3));
        K(3, 3) = -l3 * cos(q_temp(2) - q_temp(3));

        delta = -inv(K) * [f1; f2; f3];
        q_temp = q_temp + delta;
        
        f1 = l3 * cos(q_temp(2) - q_temp(3)) * cos(q_temp(1)) - cos(q_temp(1)) * (a1 - l2 * cos(q_temp(2))) - xE;
        f2 = l3 * cos(q_temp(2) - q_temp(3)) * sin(q_temp(1)) - sin(q_temp(1)) * (a1 - l2 * cos(q_temp(2))) - yE;
        f3 = l1 + l2 * sin(q_temp(2)) + l3 * sin(q_temp(2) - q_temp(3)) - zE;
        
        k = k+1;
    end

    % Luu gia tri thoi gian t(i)
    q1(i) = q_temp(1);
    q2(i) = q_temp(2);
    q3(i) = q_temp(3);
end

% ke qua thoi gian
q1 = q1;
q2 = q2;
q3 = q3;

figure(1)
plot(t,q1,'k-',t,q2,'r-',t,q3,'b-','linewidth',1);grid on;
hold on
xlabel('t[s]');ylabel('q[rad]');
title('Do thi cac toa do suy rong');
legend('q_1','q_2','q_3');





%ve cau hinh cua robot
x0=0; y0=0; z0=0; z1=l1;
OAx= [x0,-a1]; OAy=[y0,y0]; OAz=[z0,z1];


j = 1.1780972450:0.01:1.178097245*3.01;
ABx = 0.250 + 0.090.*cos(j./0.750);
ABy = 0.150 + 0.090.*sin(j./0.750);
ABz = zeros(1, length(ABy));
figure(2);
hold on;
plot3(x0,y0,z0,'ob','linewidth',2,'Markersize',6);grid on
plot3(ABx,ABy,ABz,'r-','linewidth',1);
for i=1:11:length(t)
    qq1=[q1(i);q2(i);q3(i)];
    
    %RO3
    O3x= -cos(qq1(1))*(a1 - l2*cos(qq1(2)));
    O3y= -sin(qq1(1))*(a1 - l2*cos(qq1(2)));
    O3z= l1 + l2*sin(qq1(2));
    RO3=[O3x;O3y;O3z];
    
    %RO2
    O2x=-a1*cos(qq1(1));
    O2y=-a1*sin(qq1(1));
    O2z=l1;
    RO2=[O2x;O2y;O2z];
    
    Ex = l3*cos(qq1(2) - qq1(3))*cos(qq1(1)) - cos(qq1(1))*(a1 - l2*cos(qq1(2)));
    Ey = l3*cos(qq1(2) - qq1(3))*sin(qq1(1)) - sin(qq1(1))*(a1 - l2*cos(qq1(2)));
    Ez = l1 + l2*sin(qq1(2)) + l3*sin(qq1(2) - qq1(3));
    RE=[Ex;Ey;Ez];
    
    AEx=[0,RO2(1),RO3(1),RE(1)];
    AEy=[0,RO2(2),RO3(2),RE(2)];
    AEz=[0,RO2(3),RO3(3),RE(3)];
    plot3(AEx,AEy,AEz,'k-','linewidth',1);
    plot3(RO2(1),RO2(2),RO2(3),'ob-','linewidth',1);
    plot3(RO3(1),RO3(2),RO3(3),'ob-','linewidth',1);
    plot3(RE(1),RE(2),RE(3),'or-','linewidth',1);
    axis equal
end