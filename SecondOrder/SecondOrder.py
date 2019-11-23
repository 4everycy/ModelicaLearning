from pymodelica import compile_fmu
from pyfmi import load_fmu
import matplotlib.pyplot as plt

fmu1 = compile_fmu('SecondOrder', 'SecondOrder.mo')
so = load_fmu(fmu1)
res = so.simulate(final_time=5)
x1 = res['phi1']
x2 = res['phi2']
v1 = res['omega1']
v2 = res['omega2']
t = res['time']

plt.figure(1)
plt.title('Second Order')
plt.plot(t, x1, label='position of inertia 1')
plt.plot(t, x2, label='position of inertia 2')
plt.plot(t, v1, label='velocity of inertia 1')
plt.plot(t, v2, label='velocity of inertia 2')
plt.legend()
plt.xlabel('time(s)')
plt.show()