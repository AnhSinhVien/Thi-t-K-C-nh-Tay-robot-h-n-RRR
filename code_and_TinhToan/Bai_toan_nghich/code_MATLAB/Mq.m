function K = Mq(q)
q1 = q(1); q2 = q(2); q3 = q(3);
K = zeros(3,3);
K(1,1) = 0.147e-2+0.52e-1*cos(q2)^2-0.135e-1*cos(q2)+0.1e-1*cos(q2+q3)^2-0.3e-2*cos(q2+q3)+0.2e-1*cos(q2+q3)*cos(q2);
K(1,2) = 0;
K(1,3) = 0;

K(2,1) = 0;
K(2,2) = 0.62e-1+0.2e-1*sin(q2+q3)*sin(q2)+0.2e-1*cos(q2+q3)*cos(q2);
K(2,3) = 0.1e-1-0.4e-2*cos(q1)^2+0.9e-2*sin(q2+q3)*sin(q2)+0.9e-2*cos(q2+q3)*cos(q2);

K(3,1) = 0;
K(3,2) = 0.1e-1-0.4e-2*cos(q1)^2+0.8e-2*sin(q2+q3)*sin(q2)+0.8e-2*cos(q2+q3)*cos(q2);
K(3,3) = 0.1e-1-0.4e-2*cos(q1)^2;
end