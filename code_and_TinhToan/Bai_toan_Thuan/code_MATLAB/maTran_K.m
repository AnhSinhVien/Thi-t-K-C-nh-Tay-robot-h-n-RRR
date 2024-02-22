function K = maTran_K(alpha, a, theta, d)

%global alpha a theta d;
global l1 l2 l3 a1;

% hang 1:
K11 = cos(theta);
K12 = -sin(theta);
K13 = 0;
K14 = a;

% hang 2:
K21 = sin(theta)*cosd(alpha);
K22 = cos(theta)*cosd(alpha);
K23 = -sind(alpha);
K24 = -d*sind(alpha);

% hang 3:
K31 = sin(theta)*sind(alpha);
K32 = cos(theta)*sind(alpha);
K33 = cosd(alpha);
K34 = d*cosd(alpha);

% hang 4:
K41 = 0;
K42 = 0;
K43 = 0;
K44 = 1;

% ma tran dia phuong
K = [K11 K12 K13 K14; K21 K22 K23 K24; K31 K32 K33 K34; K41 K42 K43 K44];
end