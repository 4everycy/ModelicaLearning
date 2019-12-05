from pymodelica import compile_fmu
from pyfmi import load_fmu
import matplotlib.pyplot as plt

fo = load_fmu('BouncingBall.fmu')
opts = fo.simulate_options()
opts['ncp'] = 1000 # Make sure the output points are enough
res = fo.simulate(final_time=3, options=opts)

h = res['h']
t = res['time']

plt.figure()
plt.plot(t, h, label='Height')
plt.legend()
plt.title('A Bouncing Ball')
plt.ylabel('height(m)')
plt.xlabel('time(s)')
plt.show()
