function K = To(q,dq,d2q)
q1 = q(1); q2 = q(2); q3 = q(3); 
dq1 = dq(1); dq2 = dq(2); dq3 = dq(3);
d2q1 = d2q(1); d2q2 = d2q(2);d2q3 = d2q(3);
K = zeros(3,1);
K(1,1) = 0.1e-2*d2q1+0.5e-1*d2q1*cos(q2)^2-0.1e-1*d2q1*cos(q2)+0.1e-1*d2q1*cos(q2+q3)^2-0.3e-2*d2q1*cos(q2+q3)+0.2e-1*d2q1*cos(q2+q3)*cos(q2)-0.1*dq1*dq2*cos(q2)*sin(q2)+0.1e-1*dq1*dq2*sin(q2)-0.2e-1*dq1*dq2*cos(q2+q3)*sin(q2+q3)+0.3e-2*dq1*dq2*sin(q2+q3)-0.2e-1*dq1*dq2*sin(q2+q3)*cos(q2)-0.2e-1*dq1*dq2*cos(q2+q3)*sin(q2)-0.2e-1*dq1*sin(q2+q3)*dq3*cos(q2+q3)+0.3e-2*dq1*sin(q2+q3)*dq3-0.2e-1*dq1*sin(q2+q3)*dq3*cos(q2)-0.8e-2*cos(q1)*sin(q1)*dq3*dq2-0.4e-2*cos(q1)*sin(q1)*dq3^2;
K(2,1) = 0.6e-1*d2q2+0.2e-1*d2q2*sin(q2+q3)*sin(q2)+0.2e-1*d2q2*cos(q2+q3)*cos(q2)+0.1e-1*d2q3-0.4e-2*d2q3*cos(q1)^2+0.9e-2*d2q3*sin(q2+q3)*sin(q2)+0.9e-2*d2q3*cos(q2+q3)*cos(q2)+0.5e-1*dq1^2*cos(q2)*sin(q2)-0.7e-2*dq1^2*sin(q2)+0.1e-1*sin(q2+q3)*dq1^2*cos(q2+q3)-0.2e-2*sin(q2+q3)*dq1^2+0.1e-1*sin(q2+q3)*dq1^2*cos(q2)+0.1e-1*dq1^2*cos(q2+q3)*sin(q2)+0.2e-1*dq2*dq3*cos(q2+q3)*sin(q2)-0.2e-1*dq2*sin(q2+q3)*dq3*cos(q2)+0.8e-2*dq3*cos(q1)*sin(q1)*dq1+0.9e-2*dq3^2*cos(q2+q3)*sin(q2)-0.9e-2*sin(q2+q3)*dq3^2*cos(q2)+2*cos(q2)+0.4*cos(q2+q3);
K(3,1) = 0.1e-1*d2q2-0.4e-2*d2q2*cos(q1)^2+0.8e-2*d2q2*sin(q2+q3)*sin(q2)+0.8e-2*d2q2*cos(q2+q3)*cos(q2)+0.1e-1*d2q3-0.4e-2*d2q3*cos(q1)^2+0.1e-1*sin(q2+q3)*dq1^2*cos(q2+q3)-0.2e-2*sin(q2+q3)*dq1^2+0.1e-1*sin(q2+q3)*dq1^2*cos(q2)+0.8e-2*dq2*cos(q1)*sin(q1)*dq1-0.5e-3*dq2*dq3*cos(q2+q3)*sin(q2)+0.5e-3*dq2*sin(q2+q3)*dq3*cos(q2)-0.1e-1*dq2^2*cos(q2+q3)*sin(q2)+0.1e-1*dq2^2*sin(q2+q3)*cos(q2)+0.8e-2*dq3*cos(q1)*sin(q1)*dq1+0.4*cos(q2+q3);

end