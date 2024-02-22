function K=ptlk(q,t)
global l1 l2 l3 a1
q1=q(1); q2=q(2); q3=q(3);
x=X(t);
xE=x(1);yE=x(2);zE=x(3);

f1= l3*cos(q2 + q3)*cos(q1) - cos(q1)*(a1 - l2*cos(q2)) - xE;
f2= l3*cos(q2 + q3)*sin(q1) - sin(q1)*(a1 - l2*cos(q2)) - yE;
f3= l1 + l2*sin(q2) + l3*sin(q2 + q3) - zE;

K=[f1;f2;f3];
end