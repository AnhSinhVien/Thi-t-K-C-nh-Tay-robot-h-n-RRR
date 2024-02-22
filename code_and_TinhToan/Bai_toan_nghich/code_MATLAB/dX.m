function K=dX(t)
 
vEx= -0.12*sin(1.3*t);
vEy= 0.12*cos(1.3*t);
vEz= 0;

K=[vEx;vEy;vEz];
end