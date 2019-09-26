#
# @Author: yecy
# @Date: 2019-09-20 22:32:37
# @LastEditors: yecy
# @LastEditTime: 2019-09-21 01:31:58
#
from pymodelica import compile_fmu
from pyfmi import load_fmu
import matplotlib.pyplot as plt

fmu_1 = compile_fmu('NewtonCooling', 'NewtonCooling.mo')
nc = load_fmu(fmu_1)
res = nc.simulate(final_time=600)
temp = res['t']
time = res['time']

plt.figure(1)
plt.title('Newton Cooling')
plt.plot(time, temp, label='temperature')
plt.legend()
plt.ylabel('temperature($^\circ$C)')
plt.xlabel('time(s)')
plt.show()
