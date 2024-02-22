function K= rO3(q)
global l1 l2 l3 a1
q1=q(1); q2=q(2); q3=q(3);
O3x= -cos(q1)*(a1 - l2*cos(q2));
O3y= -sin(q1)*(a1 - l2*cos(q2));
O3z= l1 + l2*sin(q2);
K=[O3x;O3y;O3z];
end