function K = Gq(q)
q1 = q(1); q2 = q(2); q3 = q(3);
K = zeros(3,1);
K(1,1) = 0;
K(2,1) = 1.9*cos(q2)+0.41*cos(q2+q3);
K(3,1) = 0.41*cos(q2+q3);
end