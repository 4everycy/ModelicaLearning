from pymodelica import compile_fmu
from pyfmi import load_fmu
import matplotlib.pyplot as plt

nc = load_fmu('NewtonCoolingSteadyThenDynamic.fmu')
res = nc.simulate()
T = res['T']
T_amb = res['T_inf']
time = res['time']

plt.figure()
plt.title('NC Dynamic With Steady State Condiions')
plt.plot(time, T, label='Temperature')
plt.plot(time, T_amb, label='Ambient temperature')
plt.legend()
plt.ylabel('temperature(K)')
plt.xlabel('time(s)')
plt.show()