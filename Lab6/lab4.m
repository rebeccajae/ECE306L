%%%
% ECE306L Lab Files
% Author: Rebecca J. Pruim
%%%
clear variables;
z = [
    (1/sqrt(2)) + 1i*(1/sqrt(2));
    (1/sqrt(2)) - 1i*(1/sqrt(2));
    -(1/sqrt(2)) + 1i*(1/sqrt(2));
    -(1/sqrt(2)) - 1i*(1/sqrt(2));
    1i;
    -1i;
    ];
p = zeros(size(z));
b0 = 4; %Gain
labfunc6(z,p,b0);
