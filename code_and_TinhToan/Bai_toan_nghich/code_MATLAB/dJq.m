function K=dJq(q,dq)
global l1 l2 l3 a1
q1=q(1); q2=q(2); q3=q(3);
dq1=dq(1); dq2=dq(2); dq3=dq(3);
K=zeros(3,3);
K(1,1)= cos(q1)*dq1*(a1-l2*cos(q2))+sin(q1)*l2*sin(q2)*dq2+l3*sin(q2+q3)*(dq2+dq3)*sin(q1)-l3*cos(q2+q3)*cos(q1)*dq1;
K(1,2)= -l3*cos(q2+q3)*(dq2+dq3)*cos(q1)+l3*sin(q2+q3)*sin(q1)*dq1+l2*sin(q1)*dq1*sin(q2)-l2*cos(q1)*cos(q2)*dq2;
K(1,3)= -l3*cos(q2+q3)*(dq2+dq3)*cos(q1)+l3*sin(q2+q3)*sin(q1)*dq1;

K(2,1)= -l3*sin(q2+q3)*(dq2+dq3)*cos(q1)-l3*cos(q2+q3)*sin(q1)*dq1+sin(q1)*dq1*(a1-l2*cos(q2))-cos(q1)*l2*sin(q2)*dq2;
K(2,2)= -l3*cos(q2+q3)*(dq2+dq3)*sin(q1)-l3*sin(q2+q3)*cos(q1)*dq1-l2*cos(q1)*dq1*sin(q2)-l2*sin(q1)*cos(q2)*dq2;
K(2,3)= -l3*cos(q2+q3)*(dq2+dq3)*sin(q1)-l3*sin(q2+q3)*cos(q1)*dq1;

K(3,1)=0;
K(3,2)= -l3*sin(q2+q3)*(dq2+dq3)-l2*sin(q2)*dq2;
K(3,3)= -l3*sin(q2+q3)*(dq2+dq3);
end