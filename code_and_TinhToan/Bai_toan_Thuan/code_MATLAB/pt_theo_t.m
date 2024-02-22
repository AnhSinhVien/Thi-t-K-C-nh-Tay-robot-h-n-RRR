clear all; close all; clc;
 syms l1 l2 l3 a1;

% thay phuong trinh q1, q2, q3
syms t;
q1 = 0.8*cos(0.1*t);
q2 = 0.5*cos(0.05*t);
q3 = 0.5*cos(0.05*t);


% Tinh ma tran cray
K1 = maTran_K(0,0,q1,l1);
K2 = maTran_K(90,-a1,q2,0);
K3 = maTran_K(0,l2,(q3),0);
C = simplify(K1*K2*K3);

disp('Cac ma tran dia phuong K1:');
disp(K1);
disp('Cac ma tran dia phuong K2:');
disp(K2);
disp('Cac ma tran dia phuong K3:');
disp(K3);

disp('Ma tran toan cuc C:');
disp(C);

% Tim toa do diem cuoi E
E = [l3; 0 ; 0; 1];
rE0 = simplify(C*E);

disp('Toa do diem E:');
disp(rE0);

% Tinh van toc diem cuoi
vE0 = simplify(diff(rE0,t));
disp('Van toc diem E:');
disp(vE0);

%Tinh gia toc diem e

aE0 = simplify(diff(vE0,t));
disp('gia toc diem E:');
disp(aE0);

% Dao ham ma tran C
dC = simplify(diff(C,t));

% tinh van toc khau 1 so voi khau 0
A1 = [K1(1,1) K1(1,2) K1(1,3); K1(2,1) K1(2,2) K1(2,3); K1(3,1) K1(3,2) K1(3,3)];
dA1 = diff(A1,t);
for i = 1:3
 for j = 1:3
    tA1(i,j) = A1(j,i);
 end
end
wA1 = simplify(dA1*tA1);
% disp(A1);
% disp(dA1);
% disp(tA1);
disp('Van toc goc w A01: ');
disp(wA1);

% tinh van toc khau 2 so voi khau 0
KA2 = [K2(1,1) K2(1,2) K2(1,3); K2(2,1) K2(2,2) K2(2,3); K2(3,1) K2(3,2) K2(3,3)];
A2 = A1*KA2;
dA2 = diff(A2,t);
for i = 1:3
 for j = 1:3
    tA2(i,j) = A2(j,i);
 end
end
wA2 = simplify(dA2*tA2);
% disp(A2);
% disp(dA2);
% disp(tA2);
disp('Van toc goc w A02: ');
disp(wA2);

% tinh van toc khau 3 so voi khau 0
A3 = [C(1,1) C(1,2) C(1,3); C(2,1) C(2,2) C(2,3); C(3,1) C(3,2) C(3,3)];
dA3 = diff(A3,t);
for i = 1:3
 for j = 1:3
    tA3(i,j) = A3(j,i);
 end
end
wA3 = simplify(dA3*tA3);
 %disp(A3);
 %disp(dA3);
 %disp(tA3);
disp('Van toc goc w A03: ');
disp(wA3);




