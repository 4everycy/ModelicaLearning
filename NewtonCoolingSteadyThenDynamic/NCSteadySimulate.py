from pymodelica import compile_fmu
from pyfmi import load_fmu
import matplotlib.pyplot as plt

fmu = compile_fmu('NewtonCoolingSteadyThenDynamic', 'NewtonCoolingSteadyThenDynamic.mo')
