function K= rO2(q)
global l1 l2 l3 a1
q1=q(1); q2=q(2); q3=q(3);

O2x=-a1*cos(q1);
O2y=-a1*sin(q1);
O2z=l1;

K=[O2x;O2y;O2z];
end