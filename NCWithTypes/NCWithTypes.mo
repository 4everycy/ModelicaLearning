/*
 * @Author: yecy
 * @Date: 2019-09-26 19:37:18
 * @LastEditors: yecy
 * @LastEditTime: 2019-10-09 16:17:13
 */
model NCWithTypes
    type Temperature = Real(unit="K", min=0);
    type Area = Real(unit="m2", min=0);
    type ConvectionCoefficient = Real(unit="W/(m2.K)", min=0);
    type Mass = Real(unit="kg", min=0);
    type SpecificHeat = Real(unit="J/(K.kg)", min=0);
    parameter Temperature T_amb = 10 "ambient temperature";
    parameter Area T_0 = 90 "initial temperature";
    parameter ConvectionCoefficient H = 10 "convective heat transfer coefficient";
    parameter Area A = 1 "surface area";
    parameter Mass M = 1 "mass of object";
    parameter SpecificHeat C_p = 450 "specific heat";
    Real t "temperature";
initial equation
   t = T_0 "initialize t";
equation
M * C_p * der(t) = H * A * (T_amb - t);
end NCWithTypes;
