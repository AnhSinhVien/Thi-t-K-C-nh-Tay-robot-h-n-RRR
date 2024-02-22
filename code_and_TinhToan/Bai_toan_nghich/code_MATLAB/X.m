function K=X(t)

xE= 0.25 + 0.09*cos(t/0.75);
yE= 0.15 + 0.09*sin(t/0.75);
zE= 0;

K=[xE;yE;zE];
end
