model NewtonCoolingDynamic
    "Cooling example with fluctuating ambient conditions"
    // Type
    type Temperature=Real(unit="K", min=0);
    type ConvectionCoefficient=Real(unit="W/(m2.K)", min=0);
    type Area=Real(unit="m2", min=0);
    type Mass=Real(unit="kg", min=0);
    type SpecificHeat=Real(unit="J/(K.kg)", min=0);
    // Parameter
    parameter Temperature T0=363.15 "Initial temperature";
    parameter ConvectionCoefficient h=0.7 "Convection cooling coefficient";
    parameter Area A=1.0 "Surface area";
    parameter Mass m=0.1 "Mass  of thermal capacitance";
    parameter SpecificHeat c_p=1.2 "Specific heat";
    // Variables
    Temperature T_inf "Ambient temperature";
    Temperature T "Temperature";
initial equation
    T = T0 "Specify initial value for T";
equation
    if time <= 0.5 then
        T_inf = 298.15;
    else
        T_inf = 298.15 - 20*(time-0.5);
    end if;
    m * c_p * der(T) = h * A * (T_inf - T) "Newton's law of cooling";
end NewtonCoolingDynamic;