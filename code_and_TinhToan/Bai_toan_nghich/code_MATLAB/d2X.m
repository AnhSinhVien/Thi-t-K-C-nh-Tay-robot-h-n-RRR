function K=d2X(t)

d2xE= -0.16*cos(1.3*t);
d2yE= -0.16*sin(1.3*t);
d2zE= 0;

K=[d2xE;d2yE;d2zE];
end