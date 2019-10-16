model VDP
    parameter Real x1_0 = 0;
    parameter Real x2_0 = 1;
    Real x1(start=x1_0);
    Real x2(start=x2_0);
    input Real u; // the control signal
equation
    der(x1) = (1 - x2^2) * x1 - x2 + u;
    der(x2) = x1;
end VDP;
