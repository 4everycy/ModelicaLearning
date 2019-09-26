/*
 * @Author: yecy
 * @Date: 2019-09-19 19:52:26
 * @LastEditors: yecy
 * @LastEditTime: 2019-09-20 22:12:36
 */
model FirstOrder "A simple first order differtential equation"
    Real x "State variable";
initial equation
    x = 2;
equation
    der(x) = 1 - x "Drives value of x toward 1.0";  
end FirstOrder;
