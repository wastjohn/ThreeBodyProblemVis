import math
import numpy as np
import matplotlib.pyplot as plot

# Euler and Heun's Method for one variable in 1-D

# At the moment, F(y, t) = y + t, but we can definitely change that. I just wanted to make sure it worked.



def F(y, t):
    return y + t

def euler_mtd(y0, a, b, N):
    n = N-1
    h = (b - a)/float(n)
    t = np.arange( a, b+h, h )
    t[0] = 0
    y = np.zeros((N,))
    y[0] = y0
    for i in range(1, N):
        slope = F(y[i-1],t[i-1])
        y[i] = y[i-1] + h * slope
    
    return y[i]

def heun_mtd(y0, a, b, N):
    h = (b - a)/float(N-1)
    t = np.arange( a, b+h, h )
    t[0] = 0
    y = np.zeros((N,))
    y[0] = y0
    for i in range(1, N):
        y_temp = y[i-1] + h * F(y[i-1], t[i-1])

        y[i] = y[i-1] + h / 2 * (F(y[i-1], t[i-1]) + F(y_temp, t[i]))

    return y[i]

m = euler_mtd(1, 0.0, 10.0, 101)
print("Euler's Method: ", m)
l = heun_mtd(1, 0.0, 10.0, 101)
print("Heun's Method: ",l)