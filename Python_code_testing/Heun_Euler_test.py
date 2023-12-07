import math
import numpy as np
import matplotlib.pyplot as plot

# Heun's Method Code for systems that I am just testing out to see if I can get the syntax
#This is just stuff I found online but I thought it could maybe be useful???

def euler_mthd( f, a, b, N, IV ):
 
    # determine step-size
    h = (b-a)/float(N)  
 
    # create mesh                         
    t = np.arange( a, b+h, h )
 
    # initialize w               
    w = np.zeros((N+1,))
 
    # set initial values                     
    t[0], w[0] = IV   
 
    # apply Euler's method                       
    for i in range(1,N+1):                       
        w[i] = w[i-1] + h * f( t[i-1], w[i-1] )
     
    return w



def heun_method( f, a, b, N, IV ):
    h = (b-a)/float(N)                  # determine step-size
    t = np.arange( a, b+h, h )          # create mesh
    w = np.zeros((N+1,))                # initialize w
    t[0], w[0] = IV                     # set initial values
    for i in range(1,N+1):              # apply Heun's Method
        f1 = f( t[i-1], w[i-1] )
        f2 = f( t[i-1] + (2.0/3.0) * h, w[i-1] + (2.0/3.0) * h * f1 )
        w[i] = w[i-1] + h * ( f1 + 3.0 * f2 ) / 4.0
    return w
