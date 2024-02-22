function K=Jq(q)
global l1 l2 l3 a1
q1=q(1);q2=q(2);q3=q(3);
K=zeros(3,3);

K(1,1)= sin(q1)*(a1 - l2*cos(q2)) - l3*cos(q2 + q3)*sin(q1);
K(1,2)= -l2*cos(q1)*sin(q2) - l3*sin(q2 + q3)*cos(q1);
K(1,3)= -l3*sin(q2 + q3)*cos(q1);

K(2,1)= l3*cos(q2 + q3)*cos(q1) - cos(q1)*(a1 - l2*cos(q2));
K(2,2)= -l2*sin(q1)*sin(q2) - l3*sin(q2 + q3)*sin(q1);
K(2,3)= -l3*sin(q2 + q3)*sin(q1);

K(3,1)= 0;
K(3,2)= l2*cos(q2) + l3*cos(q2 + q3);
K(3,3)= l3*cos(q2 + q3);
end