/*
 * @Author: yecy
 * @Date: 2019-09-20 12:52:15
 * @LastEditors: yecy
 * @LastEditTime: 2019-09-20 22:32:18
 */
model NewtonCooling "an example of Newton's law of cooling"
    parameter Real T_amb = 10 "ambient temperature";
    parameter Real T_0 = 90 "initial temperature";
    parameter Real H = 10 "convective heat transfer coefficient";
    parameter Real A = 1 "surface area";
    parameter Real M = 1 "mass of object";
    parameter Real C_p = 450 "specific heat";
    Real t "temperature";
initial equation
   t = T_0 "initialize t";
equation
M * C_p * der(t) = H * A * (T_amb - t);
end NewtonCooling;



