function K=rE(q)
global l1 l2 l3 a1
q1=q(1); q2=q(2); q3=q(3);

Ex = l3*cos(q2 + q3)*cos(q1) - cos(q1)*(a1 - l2*cos(q2));
Ey = l3*cos(q2 + q3)*sin(q1) - sin(q1)*(a1 - l2*cos(q2));
Ez = l1 + l2*sin(q2) + l3*sin(q2 + q3);

K=[Ex;Ey;Ez];
end