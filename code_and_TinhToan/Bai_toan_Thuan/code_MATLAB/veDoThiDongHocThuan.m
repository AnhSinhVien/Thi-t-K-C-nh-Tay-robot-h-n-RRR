close all; clear all; clc;

l1 = 0.25; l2 = 0.194; l3 = 0.265; a1 = 0.03;

%Thoi gian t
t = 0:120;
%Toa do diem thao tac
xe = l3.*cos(cos(0.05.*t)).*cos(0.8.*cos(0.1.*t)) - cos(0.8.*cos(0.1.*t)).*(a1 - l2.*cos(0.5.*cos(0.05.*t)));
ye = l3.*cos(cos(0.05.*t)).*sin(0.8.*cos(0.1.*t)) - sin(0.8.*cos(0.1.*t)).*(a1 - l2.*cos(0.5.*cos(0.05.*t)));
ze = l1 + l3.*sin(cos(0.05.*t)) + l2.*sin(0.5.*cos(0.05.*t));
%Van toc diem thao tac E
vxe = (l2.*sin(cos(t./20)./2).*sin(t./20).*cos((4.*cos(t./10))./5))./40 - (2.*sin((4.*cos(t./10))./5).*sin(t./10).*(a1 - l2.*cos(cos(t./20)./2)))./25 + (2.*l3.*sin((4.*cos(t./10))/5).*sin(t./10).*cos(cos(t./20)))./25 + (l3.*sin(t./20).*sin(cos(t./20)).*cos((4.*cos(t./10))./5))./20;
vye = (2.*sin(t./10).*cos((4.*cos(t./10))./5).*(a1 - l2.*cos(cos(t./20)./2)))./25 + (l2.*sin((4.*cos(t./10))./5).*sin(cos(t./20)./2).*sin(t./20))./40 - (2.*l3.*sin(t./10).*cos(cos(t./20)).*cos((4.*cos(t./10))./5))./25 + (l3.*sin((4.*cos(t./10))./5).*sin(t./20).*sin(cos(t./20)))./20;
vze = - (l2.*sin(t./20).*cos(cos(t./20)./2))./40 - (l3.*sin(t./20).*(2.*cos(cos(t./20)./2).^2 - 1))./20;
%Gia toc diem thao tac E
axe = (4.*sin(t./10).^2.*cos((4.*cos(t./10))./5).*(a1 - l2.*cos(cos(t./20)./2)))./625 - (sin((4.*cos(t./10))./5).*cos(t./10).*(a1 - l2.*cos(cos(t./20)./2)))./125 + (l2.*sin(cos(t./20)./2).*cos(t./20).*cos((4.*cos(t./10))./5))./800 - (4.*l3.*sin(t./10).^2.*cos(cos(t./20)).*cos((4.*cos(t./10))./5))./625 - (l3.*sin(t./20).^2.*cos(cos(t./20)).*cos((4.*cos(t./10))./5))./400 - (l2.*sin(t./20).^2.*cos((4.*cos(t./10))./5).*cos(cos(t./20)./2))./1600 + (l3.*sin((4.*cos(t./10))./5).*cos(t./10).*cos(cos(t./20)))./125 + (l3.*cos(t./20).*sin(cos(t./20)).*cos((4.*cos(t./10))./5))./400 + (l3.*sin((4.*cos(t./10))./5).*sin(t./10).*sin(t./20).*sin(cos(t./20)))./125 + (l2.*sin((4.*cos(t./10))./5).*sin(cos(t./20)./2).*sin(t./10).*sin(t./20))./250;
aye = (4.*sin((4.*cos(t./10))./5).*sin(t./10).^2.*(a1 + l3 - 2.*l3.*cos(cos(t./20)./2).^2 - l2.*cos(cos(t./20)./2)))./625 + (cos(t./10).*cos((4.*cos(t./10))./5).*(a1 + l3 - 2.*l3.*cos(cos(t./20)./2).^2 - l2.*cos(cos(t./20)./2)))./125 + (sin((4.*cos(t./10))./5).*sin(cos(t./20)./2).*cos(t./20).*(l2 + 4.*l3.*cos(cos(t./20)./2)))./800 - (sin((4.*cos(t./10))./5).*sin(t./20).^2.*cos(cos(t./20)./2).*(l2 + 4.*l3.*cos(cos(t./20)./2)))./1600 - (l3.*sin((4.*cos(t./10))./5).*sin(t./20).^2.*(cos(cos(t./20))./2 - 1/2))./400 - (sin(cos(t./20)./2).*sin(t./10).*sin(t./20).*cos((4.*cos(t./10))./5).*(l2 + 4.*l3.*cos(cos(t./20)./2)))./250;
aze =  - (l3.*cos(t./20).*(2.*cos(cos(t./20)./2).^2 - 1))./400 - (l2.*sin(cos(t./20)./2).*sin(t./20).^2)./1600 - (l2.*cos(t./20).*cos(cos(t./20)./2))./800 - (l3.*sin(cos(t./20)/2).*sin(t./20).^2.*cos(cos(t./20)/2))./200;
%Do thi
figure(1);
plot(t,vxe,'k-.',t,vye,'b--',t,vze,'r-','linewidth',1);hold on;
xlabel('t(s)');ylabel('v(m/s)');
title('Do thi van toc diem E');
legend('vxE','vyE','vzE');

figure(2);
plot(t,axe,'k-.',t,aye,'b--',t,aze,'r-','linewidth',1);hold on;
xlabel('t(s)');ylabel('a(m/s^2)');
title('Do thi gia toc diem E');
legend('axE','ayE','azE');

figure(3);
plot3(xe,ye,ze,'r-','linewidth',1);
hold on;
title('Do thi quy dao diem E');

% ve van toc goc
% khau 1:
Vxw1 = 0;
Vyw1 = 0;
Vzw1 = -(2.*sin(t./10))/25;

figure(4);
plot(t,Vzw1,'r-','linewidth',1);hold on;
xlabel('t(s)');ylabel('w(rad/s)');
title('Do thi van toc goc w1');
legend('w1');

% khau 2:
Vxw2 = -(sin((4.*cos(t./10))/5).*sin(t./20))/40;
Vyw2 = (sin(t./20).*cos((4.*cos(t./10))/5))/40;
Vzw2 = -(2.*sin(t./10))/25;

figure(5);
plot(t,Vxw2,'k-.',t,Vyw2,'b--',t,Vzw2,'r-','linewidth',1);hold on;
xlabel('t(s)');ylabel('w(rad/s)');
title('Do thi van toc goc w2');
legend('w2x','w2y','w2z');


% khau 3:
Vxw3 = -(sin((4.*cos(t./10))/5).*sin(t./20))/20;
Vyw3 = (sin(t./20).*cos((4.*cos(t./10))/5))/20;
Vzw3 = -(2.*sin(t./10))/25;

figure(6);
plot(t,Vxw3,'k-.',t,Vyw3,'b--',t,Vzw3,'r-','linewidth',1);hold on;
xlabel('t(s)');ylabel('w(rad/s)');
title('Do thi van toc goc w3');
legend('w3');


