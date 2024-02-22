%main
close all; clear all; clc;
global l1 l2 l3 a1
parameters;
% du doan nghiem dau
q=[0.7649928327;-0.3812343942;-0.3543431040];

% thoi gian chuyen dong
t = 1.1780972450:0.01:1.178097245*3.01;

%xac dinh vector toa do suy rong
for i=1:length(t)
    lk=ptlk(q,t(i));
    k=1;
    while(norm(lk,2)>1e-12) %norm(lk,2) = norm(lk)
        jc=Jq(q);
        delta=-inv(jc)*lk;
        q=q+delta;
        lk=ptlk(q,t(i));
        k=k+1;
    end
    % xac dinh Vector toa do suy rong tai thoi diem t(i)
    q1(i)=q(1); q2(i)=q(2);q3(i)=q(3);
    % xac dinh Vector van toc suy rong tai thoi diem t(i)
    dq=inv(jc)*dX(t(i));
    dq1(i)=dq(1); dq2(i)=dq(2);dq3(i)=dq(3);
    % xac dinh Vector gia toc suy rong tai thoi diem t(i)
    d2q=inv(jc)*(d2X(t(i))-dJq(q,dq)*dq);
    d2q1(i)=d2q(1); d2q2(i)=d2q(2);d2q3(i)=d2q(3);
    % Tinh cac momen dan dong
    to = To(q,dq,d2q);
    to1(i) = to(1); to2(i) = to(2); to3(i) = to(3);
       
    tau = Mq(q)*d2q + Cq(q,dq)*dq + Gq(q);
    tau1(i) = tau(1); tau2(i) = tau(2); tau3(i) = tau(3);

end

%ve do thi cac toa do suy rong
%
% Ve do thi toa do suy rong
figure(1)
plot(t,q1,'k-',t,q2,'r-.',t,q3,'b--','linewidth',1);grid on;
hold on
xlabel('t[s]');ylabel('q[rad]');
title('Do thi cac toa do suy rong');
legend('q_1','q_2','q_3');

% Ve do thi cac van toc suy rong
figure(2)
plot(t,dq1,'k-',t,dq2,'r-.',t,dq3,'b--','linewidth',1);grid on;
xlabel('t[s]');ylabel('dq/dt[rad/s]');
title('Do thi cac van toc suy rong');
legend('dq_1/dt','dq_2/dt','dq_3/dt');

% Ve do thi cac gia toc suy rong
figure(3)
plot(t,d2q1,'k-',t,d2q2,'r-.',t,d2q3,'b--','linewidth',1);grid on;
xlabel('t[s]');ylabel('dq^2/dt[rad/s^2]');
title('Do thi cac gia toc suy rong');
legend('dq_1^2/dt','dq_2^2/dt','dq_3^2/dt');

% Ve do thi toa do suy rong q1
figure(4)
plot(t,q1,'k-',t,dq1,'r-.',t,d2q1,'b--','linewidth',1);grid on;
xlabel('t[s]');ylabel('q[rad],dq/dt[rad/s],dq^2/dt[rad/s^2]');
title('Do thi toa do suy rong q_1');
legend('q_1','dq_1/dt','dq_1^2/dt');

% Ve do thi toa do suy rong q2
figure(5)
plot(t,q2,'k-',t,dq2,'r-.',t,d2q2,'b--','linewidth',1);grid on;
xlabel('t[s]');ylabel('q[rad],dq/dt[rad/s],dq^2/dt[rad/s^2]');
title('Do thi toa do suy rong q_2');
legend('q_2','dq_2/dt','dq_2^2/dt');

% Ve do thi toa do suy rong q3
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

figure(7)
hold on;
plot3(x0,y0,z0,'ob','linewidth',2,'Markersize',6);grid on
plot3(ABx,ABy,ABz,'r-','linewidth',1);
for i=1:11:length(t)
    qq1=[q1(i);q2(i);q3(i)];
    RO3=rO3(qq1);
    RO2=rO2(qq1);
    RE=rE(qq1);
    AEx=[0,RO2(1),RO3(1),RE(1)];
    AEy=[0,RO2(2),RO3(2),RE(2)];
    AEz=[0,RO2(3),RO3(3),RE(3)];
    plot3(AEx,AEy,AEz,'k-','linewidth',1);
    plot3(RO2(1),RO2(2),RO2(3),'ob-','linewidth',1);
    plot3(RO3(1),RO3(2),RO3(3),'ob-','linewidth',1);
    plot3(RE(1),RE(2),RE(3),'or-','linewidth',1);
    axis equal
end


figure(8)
plot(t,tau1,'k-',t,tau2,'b--',t,tau3,'r-.','linewidth',1); grid on
xlabel('t[s]'); ylabel('tau[Nm]');
title('Do thi cac momen dan dong');
legend('tau_1','tau_2','tau_3');


% Gia tri lon nhat cua cac momen dan dong 
Tau1Max = max(tau1) 
Tau2Max = max(tau2) 
Tau3Max = max(tau3) 



 