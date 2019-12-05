model StableBouncingBall
    type Height=Real(unit="m");
    type Velocity=Real(unit="m/s");
    parameter Real e=0.8 "Coefficient of resitution";
    parameter Height h0=1.0 "Initial height";
    parameter Height eps=1e-3 "Precision";
    Boolean done;
    Height h;
    Velocity v;
initial equation
    h = h0;
    done = false;
equation
    v = der(h);
    der(v) = if done then 0 else -9.8;
    when {h<0, h<-eps} then
        done = h<-eps;
        reinit(v, -e*(if h<-eps then 0 else pre(v)));
    end when;
end StableBouncingBall;
