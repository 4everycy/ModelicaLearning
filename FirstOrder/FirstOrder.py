'''
@Author: yecy
@Date: 2019-09-19 21:28:22
@LastEditors: yecy
@LastEditTime: 2019-09-20 22:12:29
'''
from pymodelica import compile_fmu
from pyfmi import load_fmu
import matplotlib.pyplot as plt

my_fmu = compile_fmu('FirstOrder', 'FirstOrder.mo')
fo = load_fmu(my_fmu)
res = fo.simulate(final_time=10)

x = res['x']
t = res['time']

plt.figure(1)
plt.plot(t, x)
plt.legend('x')
plt.title('A Simple Differtential Equation')
plt.ylabel('x')
plt.xlabel('time(s)')
plt.show()
