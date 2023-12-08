import math
import numpy as np
import matplotlib.pyplot as plot

#Heun and Euler's Method for one equation in 2D
#The final results are the same for both x and y if the initial conditions are the same, so it's not much help

def F(x, y, t):
    return 2*y + x + t


def Euler2D(x0, y0, a, b, N):
    h = (b-a)/float(N-1)
    t = np.arange( a, b+h, h )
    t[0] = 0
    x = np.zeros((N,))
    y = np.zeros ((N,))
    x[0] = x0
    y[0] = y0

    for i in range(1, N):
        x[i] = x[i-1] + h * F(x[i-1], y[i-1],t[i-1])
        y[i] = y[i-1] + h * F(x[i-1], y[i-1],t[i-1])
    return x[i], y[i]
    
def Heun2D(x0, y0, a, b, N):
    h = (b-a)/float(N-1)
    t = np.arange( a, b+h, h )
    t[0] = 0
    x = np.zeros((N,))
    y = np.zeros ((N,))
    x[0] = x0
    y[0] = y0

    for i in range(1, N):
        x_temp = x[i-1] + h * F(x[i-1], y[i-1],t[i-1])
        y_temp = y[i-1] + h * F(x[i-1], y[i-1],t[i-1])

        x[i] = x[i-1] + h / 2 * (F(x[i-1],y[i-1], t[i-1]) + F(x_temp, y_temp, t[i]))
        y[i] = y[i-1] + h / 2 * (F(x[i-1],y[i-1], t[i-1]) + F(x_temp, y_temp, t[i]))
    return x[i], y[i]


l = Euler2D(1, 1, 0, 10, 101)
m = Heun2D(1, 1, 0, 10, 101)
print("Euler's Method: ", l)
print("Heun's Method: ", m)