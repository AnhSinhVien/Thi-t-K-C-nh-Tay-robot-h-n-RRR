function K = Cq(q,dq)
q1 = q(1); q2 = q(2); q3 = q(3); dq1 = dq(1); dq2 = dq(2); dq3 = dq(3);
K = zeros(3,3);
K(1,1) = (-0.1*cos(q2)*sin(q2)+0.1e-1*sin(q2)-0.2e-1*cos(q2+q3)*sin(q2+q3)+0.3e-2*sin(q2+q3)-0.2e-1*sin(q2+q3)*cos(q2)-0.2e-1*cos(q2+q3)*sin(q2))*dq2-0.2e-1*sin(q2+q3)*(cos(q2+q3)-0.2+cos(q2))*dq3;
K(1,2) = -0.4e-2*cos(q1)*sin(q1)*dq3;
K(1,3) = -0.4e-2*cos(q1)*sin(q1)*dq2-0.4e-2*cos(q1)*sin(q1)*dq3;

K(2,1) = -(0.5*(-0.1*cos(q2)*sin(q2)+0.1e-1*sin(q2)-0.2e-1*cos(q2+q3)*sin(q2+q3)+0.3e-2*sin(q2+q3)-0.2e-1*sin(q2+q3)*cos(q2)-0.2e-1*cos(q2+q3)*sin(q2)))*dq1;
K(2,2) = (0.2e-1*cos(q2+q3)*sin(q2)-0.2e-1*sin(q2+q3)*cos(q2))*dq3;
K(2,3) = 0.8e-2*cos(q1)*sin(q1)*dq1+(0.9e-2*cos(q2+q3)*sin(q2)-0.9e-2*sin(q2+q3)*cos(q2))*dq3;

K(3,1) = 0.1e-1*sin(q2+q3)*(cos(q2+q3)-0.2+cos(q2))*dq1;
K(3,2) = 0.8e-2*cos(q1)*sin(q1)*dq1+(0.8e-2*cos(q2+q3)*sin(q2)-0.8e-2*sin(q2+q3)*cos(q2))*dq3-(0.5*(0.2e-1*cos(q2+q3)*sin(q2)-0.2e-1*sin(q2+q3)*cos(q2)))*dq2-(0.5*(0.9e-2*cos(q2+q3)*sin(q2)-0.9e-2*sin(q2+q3)*cos(q2)))*dq3;
K(3,3) = 0.8e-2*cos(q1)*sin(q1)*dq1-(0.5*(0.8e-2*cos(q2+q3)*sin(q2)-0.8e-2*sin(q2+q3)*cos(q2)))*dq2;
end