import math
import numpy as np
import matplotlib.pyplot as plot



def F(x, y, t):
    return y

def G(x, y, t):
    return -9.8 * math.sin(y) + math.sin(2*t)


def EulerSystems(x0, y0, a, b, N):
    h = (b-a)/float(N-1)
    t = np.arange( a, b+h, h )
    t[0] = 0
    x = np.zeros((N,))
    y = np.zeros ((N,))
    x[0] = x0
    y[0] = y0

    for i in range(1, N):
        x[i] = x[i-1] + h * F(x[i-1], y[i-1],t[i-1])
        y[i] = y[i-1] + h * G(x[i-1], y[i-1],t[i-1])
    return x[i], y[i]
    
def HeunSystems(x0, y0, a, b, N):
    h = (b-a)/float(N-1)
    t = np.arange( a, b+h, h )
    t[0] = 0
    x = np.zeros((N,))
    y = np.zeros ((N,))
    x[0] = x0
    y[0] = y0

    for i in range(1, N):
        x_temp = x[i-1] + h * F(x[i-1], y[i-1],t[i-1])
        y_temp = y[i-1] + h * G(x[i-1], y[i-1],t[i-1])

        x[i] = x[i-1] + h / 2 * (F(x[i-1],y[i-1], t[i-1]) + F(x_temp, y_temp, t[i]))
        y[i] = y[i-1] + h / 2 * (G(x[i-1],y[i-1], t[i-1]) + G(x_temp, y_temp, t[i]))
    return x[i], y[i]


l = EulerSystems(1, 1, 0, 10, 101)
m = HeunSystems(1, 1, 0, 10, 101)
print("Euler's Method: ", l)
print("Heun's Method: ", m)