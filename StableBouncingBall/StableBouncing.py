from pymodelica import compile_fmu
from pyfmi import load_fmu
import matplotlib.pyplot as plt


fmu1 = compile_fmu('StableBouncingBall', 'StableBouncingBall.mo')
sb = load_fmu(fmu1)
opts = sb.simulate_options()
opts['ncp'] = 1000 # Make sure the output points are enough
res = sb.simulate(final_time=6, options=opts)

h = res['h']
t = res['time']

plt.figure()
plt.plot(t, h, label='Height')
plt.legend()
plt.title('A Bouncing Ball')
plt.ylabel('height(m)')
plt.xlabel('time(s)')
plt.show()