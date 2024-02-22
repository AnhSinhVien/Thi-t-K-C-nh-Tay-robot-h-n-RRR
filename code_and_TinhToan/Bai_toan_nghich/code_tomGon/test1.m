%********************main*************************%
close all; clear all; clc;
l1 = 0.25; l2 = 0.194; l3 = 0.265; a1 = 0.03;
% du doan nghiem dau
q=[0.7649928327;-0.3812343942;0.3543431040];

% thoi gian chuyen dong
t = 1.1780972450:0.01:1.178097245*3.01;

for i=1:length(t)

    % phuong trinh ptlk
    f1 = l3*cos(q(2) - q(3))*cos(q(1)) - cos(q(1))*(a1 - l2*cos(q(2))) - (0.25 + 0.09*cos(t(i)/0.75));
    f2= l3*cos(q(2) - q(3))*sin(q(1)) - sin(q(1))*(a1 - l2*cos(q(2))) - (0.15 + 0.09*sin(t(i)/0.75));
    f3= l1 + l2*sin(q(2)) + l3*sin(q(2) - q(3));
   
    k=1;
    while(norm([f1; f2; f3],2)>1e-12&&k<30) %norm(lk,2) = norm(lk
       % Jacobian
        J=zeros(3,3);
        J(1,1)= sin(q(1))*(a1 - l2*cos(q(2))) - l3*cos(q(2) - q(3))*sin(q(1));
        J(1,2)= -l2*cos(q(1))*sin(q(2)) - l3*sin(q(2) - q(3))*cos(q(1));
        J(1,3)= l3*sin(q(2) - q(3))*cos(q(1));

        J(2,1)= l3*cos(q(2) - q(3))*cos(q(1)) - cos(q(1))*(a1 - l2*cos(q(2)));
        J(2,2)= -l2*sin(q(1))*sin(q(2)) - l3*sin(q(2) - q(3))*sin(q(1));
        J(2,3)= l3*sin(q(2) - q(3))*sin(q(1));

        J(3,1)= 0;
        J(3,2)= l2*cos(q(2)) + l3*cos(q(2) - q(3));
        J(3,3)= -l3*cos(q(2) - q(3));
        
        delta=-inv(J)*[f1;f2;f3];
        q=q+delta;
        
        f1 = l3*cos(q(2) - q(3))*cos(q(1)) - cos(q(1))*(a1 - l2*cos(q(2))) - (0.25 + 0.09*cos(t(i)/0.75));
        f2= l3*cos(q(2) - q(3))*sin(q(1)) - sin(q(1))*(a1 - l2*cos(q(2))) - (0.15 + 0.09*sin(t(i)/0.75));
        f3= l1 + l2*sin(q(2)) + l3*sin(q(2) - q(3));
        
        k=k+1;
    end
    
    % xac dinh Vector toa do suy rong tai thoi diem t(i)
    q1(i)=q(1); q2(i)=q(2);q3(i)=q(3);
    % xac dinh Vector van toc suy rong tai thoi diem t(i)
    vEx= -0.12*sin(1.3*t(i));
    vEy= 0.12*cos(1.3*t(i));
    vEz= 0;
    dX=[vEx;vEy;vEz];
    
    dq=inv(J)*dX;
    dq1(i)=dq(1); dq2(i)=dq(2);dq3(i)=dq(3);
    
    % xac dinh Vector gia toc suy rong tai thoi diem t(i)
    d2xE= -0.16*cos(1.3*t(i));
    d2yE= -0.16*sin(1.3*t(i));
    d2zE= 0;
    d2X=[d2xE;d2yE;d2zE];
        % dao ham jacobian theo t(i)
    dJq=zeros(3,3);
    dJq(1,1)= cos(q1(i))*dq1(i)*(a1-l2*cos(q2(i))) + sin(q1(i))*l2*sin(q2(i))*dq2(i) + l3*sin(q2(i)-q3(i))*(dq2(i)-dq3(i))*sin(q1(i)) - l3*cos(q2(i)-q3(i))*cos(q1(i))*dq1(i);
    dJq(1,2)= l2*sin(q1(i))*dq1(i)*sin(q2(i)) - l2*cos(q1(i))*cos(q2(i))*dq2(i) - l3*cos(q2(i)-q3(i))*(dq2(i)-dq3(i))*cos(q1(i)) + l3*sin(q2(i)-q3(i))*sin(q1(i))*dq1(i);
    dJq(1,3)= l3*cos(q2(i)-q3(i))*(dq2(i)-dq3(i))*cos(q1(i)) - l3*sin(q2(i)-q3(i))*sin(q1(i))*dq1(i);

    dJq(2,1)= -l3*sin(q2(i)-q3(i))*(dq2(i)-dq3(i))*cos(q1(i)) - l3*cos(q2(i)-q3(i))*sin(q1(i))*dq1(i) + sin(q1(i))*dq1(i)*(a1-l2*cos(q2(i))) - cos(q1(i))*l2*sin(q2(i))*dq2(i);
    dJq(2,2)= -l2*cos(q1(i))*dq1(i)*sin(q2(i)) - l2*sin(q1(i))*cos(q2(i))*dq2(i) - l3*cos(q2(i)-q3(i))*(dq2(i)-dq3(i))*sin(q1(i)) - l3*sin(q2(i)-q3(i))*cos(q1(i))*dq1(i);
    dJq(2,3)= l3*cos(q2(i)-q3(i))*(dq2(i)-dq3(i))*sin(q1(i)) + l3*sin(q2(i)-q3(i))*cos(q1(i))*dq1(i);

    dJq(3,1)=0;
    dJq(3,2)= -l2*sin(q2(i))*dq2(i) - l3*sin(q2(i)-q3(i))*(dq2(i)-dq3(i));
    dJq(3,3)= l3*sin(q2(i)-q3(i))*(dq2(i)-dq3(i));
    
    d2q=inv(J) * (d2X - dJq * dq);
    d2q1(i)=d2q(1); d2q2(i)=d2q(2);d2q3(i)=d2q(3);
end


figure(1)
plot(t,q1,'k-',t,q2,'r-.',t,q3,'b--','linewidth',1);grid on;
hold on
xlabel('t[s]');ylabel('q[rad]');
title('Do thi cac toa do suy rong');
legend('q_1','q_2','q_3');

%ve do thi cac van toc suy rong
figure(2)
plot(t,dq1,'k-',t,dq2,'r-.',t,dq3,'b--','linewidth',1);grid on;
xlabel('t[s]');ylabel('dq/dt[rad/s]');
title('Do thi cac van toc suy rong');
legend('dq_1/dt','dq_2/dt','dq_3/dt');

%ve do thi cac gia toc suy rong
figure(3)
plot(t,d2q1,'k-',t,d2q2,'r-.',t,d2q3,'b--','linewidth',1);grid on;
xlabel('t[s]');ylabel('dq^2/dt[rad/s^2]');
title('Do thi cac gia toc suy rong');
legend('dq_1^2/dt','dq_2^2/dt','dq_3^2/dt');

%ve do thi toa do suy rong q1
figure(4)
plot(t,q1,'k-',t,dq1,'r-.',t,d2q1,'b--','linewidth',1);grid on;
xlabel('t[s]');ylabel('q[rad],dq/dt[rad/s],dq^2/dt[rad/s^2]');
title('Do thi toa do suy rong q_1');
legend('q_1','dq_1/dt','dq_1^2/dt');

%ve do thi toa do suy rong q2
figure(5)
plot(t,q2,'k-',t,dq2,'r-.',t,d2q2,'b--','linewidth',1);grid on;
xlabel('t[s]');ylabel('q[rad],dq/dt[rad/s],dq^2/dt[rad/s^2]');
title('Do thi toa do suy rong q_2');
legend('q_2','dq_2/dt','dq_2^2/dt');

%ve do thi toa do suy rong q3
figure(6)
plot(t,q3,'k-',t,dq3,'r-.',t,d2q3,'b--','linewidth',1);grid on;
xlabel('t[s]');ylabel('q[rad],dq/dt[rad/s],dq^2/dt[rad/s^2]');
title('Do thi toa do suy rong q_3');
legend('q_3','dq_3/dt','dq_3^2/dt');


%ve cau hinh cua robot
x0=0; y0=0; z0=0; z1=l1;
OAx= [x0,-a1]; OAy=[y0,y0]; OAz=[z0,z1];

j = 1.1780972450:0.01:1.178097245*3.01;
ABx = 0.250 + 0.090.*cos(j./0.750);
ABy = 0.150 + 0.090.*sin(j./0.750);
ABz = zeros(1, length(ABy));

figure(7);
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
    
    %RE
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