clear all; close all; clc;
syms l1 l2 l3 a1;
syms q1 q2 q3 d1;
syms dq1 dq2 dq3;


% Tinh ma tran cray
K1 = maTran_K(0,0,q1,l1);
K2 = maTran_K(90,(-a1),q2,0);
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

C12 = simplify(K1*K2);
disp('Ma tran toan cuc C12:');
disp(C12);
% Tim toa do diem cuoi E
E = [l3; 0 ; 0; 1];
rE0 = simplify(C*E);

disp('Toa do diem E:');
disp(rE0);

% Tim van toc diem cuoi E
vEx = simplify((-l3*sin(q2-q3)*(dq2-dq3)*cos(q1) - l3*cos(q2-q3)*sin(q1)*(dq1)) - (-dq1*sin(q1)*(a1-l2*cos(q2)) + cos(q1)*(l2*sin(q2)*dq2)));
vEy = simplify((-l3*sin(q2-q3)*(dq2-dq3)*sin(q1) - l3*cos(q2-q3)*cos(q1)*(dq1)) - (dq1*cos(q1)*(a1-l2*cos(q2)) - sin(q1)*(l2*sin(q2)*dq2)));
vEz = simplify(l2*cos(q2)*dq2 + l3*cos(q2 - q3)*(dq2 - dq3));
disp('van toc diem E:');
pretty(vEx);
pretty(vEy);
pretty(vEz);


% tinh van toc khau 1 so voi khau 0
A1 = [K1(1,1) K1(1,2) K1(1,3); K1(2,1) K1(2,2) K1(2,3); K1(3,1) K1(3,2) K1(3,3)];
for i = 1:3
 for j = 1:3
    tA1(i,j) = A1(j,i);
 end
end
disp('ma tran A1: ');
disp(A1);
disp('ma tran chuyen vi A1: ');
disp(tA1);


% tinh van toc khau 2 so voi khau 0
KA2 = [K2(1,1) K2(1,2) K2(1,3); K2(2,1) K2(2,2) K2(2,3); K2(3,1) K2(3,2) K2(3,3)];
A2 = A1*KA2;
for i = 1:3
 for j = 1:3
    tA2(i,j) = A2(j,i);
 end
end
disp('------------------------');
disp('ma tran A2: ');
disp(A2);
disp('ma tran chuyen vi A2: ');
disp(tA2);

% tinh van toc khau 3 so voi khau 0
A3 = [C(1,1) C(1,2) C(1,3); C(2,1) C(2,2) C(2,3); C(3,1) C(3,2) C(3,3)];
for i = 1:3
 for j = 1:3
    tA3(i,j) = A3(j,i);
 end
end


disp('------------------------');
disp('ma tran A3: ');
disp(A3);
disp('ma tran chuyen vi A3: ');
disp(tA3);

