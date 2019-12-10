model HysteresisControl
    type HeatCapacitance=Real(unit="J/K");
    type Temperature=Real(unit="K");
    type Heat=Real(unit="W");
    type Mass=Real(unit="kg");
    type HeatTransferCoefficient=Real(unit="W/K");
    Boolean heat(start=false) "Whether heater is on";
    parameter HeatCapacitance C=1.0;
    parameter HeatTransferCoefficient h=2.0;
    parameter Heat Q_capacity=25.0;
    parameter Temperature T_amb = 285;
    parameter Temperature T_bar=295;
    Temperature T;
    Heat Q;
initial equation
    T = T_bar + 5;
    heat = false;
equation
    Q = if heat then Q_capacity else 0;
    C * der(T) = Q - h *(T - T_amb);
    when{T > T_bar+1, T < T_bar-1} then
        heat = T < T_bar;
    end when;
end HysteresisControl;