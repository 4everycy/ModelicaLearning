import numpy as np
import matplotlib.pyplot as plt
from pyfmi import load_fmu

N = 11
x1_0 = np.linspace(-3., 3., N)
x2_0 = np.zeros(N)

fig = plt.figure()
plt.clf()
plt.hold(True)
plt.xlabel('x1')
plt.ylabel('x2')

for i in range(N):
    vdp = load_fmu('VDP.fmu')
    vdp.set('x1_0', x1_0[i])
    vdp.set('x2_0', x2_0[i])
    res = vdp.simulate(final_time=20)
    x1 = res['x1']
    x2 = res['x2']
    plt.plot(x1, x2, 'b')
plt.grid()
plt.show(fig)
