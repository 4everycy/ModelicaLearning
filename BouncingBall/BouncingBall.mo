model BouncingBall
    type Height=Real(unit="m");
    type Velocity=Real(unit="m/s");
    parameter Real e=0.8 "Coefficient of resitution";
    parameter Height h0=1.0 "Initial height";
    Height h;
    Velocity v;
initial equation
    h = h0;
equation
    v = der(h);
    der(v) = -9.8;
    when h<0 then
        reinit(v, -e*pre(v));
    end when;
end BouncingBall;
