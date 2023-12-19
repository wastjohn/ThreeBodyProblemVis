import turtle
import math
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import matplotlib.animation as animation

"""This is the document that makes the three body animations

The other files are just me trying to figure out turtle and the paths/angles needed.

The infinity sign example is already in here, but if you guys want to test more, go ahead."""


win = turtle.Screen()

body1 = turtle.Turtle()
body1.hideturtle()
body1.color("red")
body1.speed(0)

body2 = turtle.Turtle()
body2.hideturtle()
body2.color("blue")
body2.speed(0)

body3 = turtle.Turtle()
body3.hideturtle()
body3.color("green")
body3.speed(0)


def heun(p0: np.array, N: int, t: float) -> np.array:
   
    data = [p0[0], p0[1], p0[2], p0[3], p0[4], p0[5], 
            p0[6], p0[7], p0[8], p0[9], p0[10], p0[11], 
            derivative(p0)[6], derivative(p0)[7], derivative(p0)[8], 
            derivative(p0)[9], derivative(p0)[10], derivative(p0)[11]]
    df = pd.DataFrame(data=[data], columns=['P1: X Position', 'P2: X Position', 
                                'P3: X Position', 'P1: Y Position', 'P2: Y Position', 
                                'P3: Y Position', 'P1: X Velocity', 'P2: X Velocity', 
                                'P3: X Velocity', 'P1: Y Velocity', 'P2: Y Velocity', 
                                'P3: Y Velocity', 'P1: X Acceleration', 'P2: X Acceleration', 
                                'P3: X Acceleration', 'P1: Y Acceleration', 'P2: Y Acceleration', 
                                'P3: Y Acceleration'])
    # TODO: verify times and step sizes are correct
    for i in range(0, N):
        ptemp = p0 + t * derivative(p0)
        dp0 = derivative(p0)
        dptemp = derivative(ptemp)
        p0 = p0 + t/2 * (dp0 + dptemp)
        data = [p0[0], p0[1], p0[2], p0[3], p0[4], p0[5], p0[6], p0[7], p0[8], p0[9], p0[10], p0[11], 
            derivative(p0)[6], derivative(p0)[7], derivative(p0)[8], derivative(p0)[9], derivative(p0)[10], 
            derivative(p0)[11]]
        df2 = pd.DataFrame(data=[data], columns=['P1: X Position', 'P2: X Position', 
                                'P3: X Position', 'P1: Y Position', 'P2: Y Position', 
                                'P3: Y Position', 'P1: X Velocity', 'P2: X Velocity', 
                                'P3: X Velocity', 'P1: Y Velocity', 'P2: Y Velocity', 
                                'P3: Y Velocity', 'P1: X Acceleration', 'P2: X Acceleration', 
                                'P3: X Acceleration', 'P1: Y Acceleration', 'P2: Y Acceleration', 
                                'P3: Y Acceleration'])
        df2['P1: X Position'] = p0[0]
        df2['P2: X Position'] = p0[1]
        df2['P3: X Position'] = p0[2]
        df2['P1: Y Position'] = p0[3]
        df2['P2: Y Position'] = p0[4]
        df2['P3: Y Position'] = p0[5]
        df2['P1: X Velocity'] = p0[6]
        df2['P2: X Velocity'] = p0[7]
        df2['P3: X Velocity'] = p0[8]
        df2['P1: Y Velocity'] = p0[9]
        df2['P2: Y Velocity'] = p0[10]
        df2['P3: Y Velocity'] = p0[11]
        df = pd.concat([df, df2], ignore_index=True)
    
    df.insert(0, 'Time', [i * t for i in range(0, N + 1)])
    return df


def derivative(p0: np.array):
    p1 = 0 * p0
    p1[0] = p0[6]
    p1[1] = p0[7]
    p1[2] = p0[8]
    p1[3] = p0[9]
    p1[4] = p0[10]
    p1[5] = p0[11]
    p1[6] = - ((p0[0] - p0[1])/((p0[0]-p0[1])**2+(p0[3]-p0[4])**2)**(3/2)) - ((p0[0] - p0[2])/((p0[0]-p0[2])**2+(p0[3]-p0[5])**2)**(3/2))
    p1[7] = - ((p0[1] - p0[0])/((p0[1]-p0[0])**2+(p0[4]-p0[3])**2)**(3/2)) - ((p0[1] - p0[2])/((p0[1]-p0[2])**2+(p0[4]-p0[5])**2)**(3/2))
    p1[8] = - ((p0[2] - p0[0])/((p0[2]-p0[0])**2+(p0[5]-p0[3])**2)**(3/2)) - ((p0[2] - p0[1])/((p0[2]-p0[1])**2+(p0[5]-p0[4])**2)**(3/2))
    p1[9] = - ((p0[3] - p0[4])/((p0[0]-p0[1])**2+(p0[3]-p0[4])**2)**(3/2)) - ((p0[3] - p0[5])/((p0[0]-p0[2])**2+(p0[3]-p0[5])**2)**(3/2))
    p1[10] = - ((p0[4] - p0[3])/((p0[1]-p0[0])**2+(p0[4]-p0[3])**2)**(3/2)) - ((p0[4] - p0[5])/((p0[1]-p0[2])**2+(p0[4]-p0[5])**2)**(3/2))
    p1[11] = - ((p0[5] - p0[3])/((p0[2]-p0[0])**2+(p0[5]-p0[3])**2)**(3/2)) - ((p0[5] - p0[4])/((p0[2]-p0[1])**2+(p0[5]-p0[4])**2)**(3/2))
    return p1



def path2(p, N, t, x_var, y_var):
    H = heun(p, N, t)
    x = H[x_var]
    y = H[y_var]
    
    x_path = np.zeros((N,))
    y_path = np.zeros((N,))
    hyp = np.zeros((N,))
    ang_temp = np.zeros((N,))
    angle = np.zeros((N,))

    for i in range(0, N):
        x_path[i] = x[i+1] - x[i]
        x_path[i] = x_path[i] * 200

        y_path[i] = y[i+1] - y[i]
        y_path[i] = y_path[i] * 200

        hyp[i] = math.sqrt((x_path[i])**2 + (y_path[i])**2)

        # if x_path[i] > 0 and y_path[i] > 0:
        #     hyp[i] = math.sqrt((x_path[i])**2 + (y_path[i])**2)
        # else:
        #     hyp[i] = - math.sqrt((x_path[i])**2 + (y_path[i])**2)


    if y_path[0] > 0:
            ang_temp[0] = math.degrees(math.acos(((x_path[0])**2 + (hyp[0])**2 - (y_path[0])**2)/(2 * (x_path[0]) * (hyp[0]))))
    else:
            ang_temp[0] = - math.degrees(math.acos(((x_path[0])**2 + (hyp[0])**2 - (y_path[0])**2)/(2 * (x_path[0]) * (hyp[0]))))
    angle[0] = ang_temp[0]

    for i in range(1, N):
        m = (x_path[i])**2 + (hyp[i])**2 - (y_path[i])**2

        if y_path[i-1] > 0:
            ang_temp[i] = math.degrees(math.acos(m/(2 * (x_path[i]) * (hyp[i]))))
        else:
            ang_temp[i] = - math.degrees(math.acos(m/(2 * (x_path[i]) * (hyp[i]))))

        angle[i] = ang_temp[i] - ang_temp[i-1]
        
    
    return hyp, angle, x, y
    



def moveTogether(body, p, N, t, x_var, y_var):
    speed = body.speed()
    body.pendown()

    hyp, angle, x, y = path2(p, N, t, x_var, y_var)

    body.penup()
    body.setposition(x[0]*200, y[0]*200)
    # print(body.position())
    body.pendown()

    for (i,j) in zip(hyp, angle):
        body.left(j)
        body.forward(i)
        yield(0)
    
    body.penup()




def draw(p, N, t):
    
    motion1 = moveTogether(body1, p, N, t, 'P1: X Position', 'P1: Y Position')
    motion2 = moveTogether(body2, p, N, t, 'P2: X Position', 'P2: Y Position')
    motion3 = moveTogether(body3, p, N, t, 'P3: X Position', 'P3: Y Position')

    while (next(motion1, 1) + next(motion2, 1) + next(motion3, 1) < 3):
        pass


p = np.array([-1, 1, 0.05, 0, 0, 0.06, 0, 0, 0, -1, 1, 0])

d = draw(p, 3000, 0.001)


win.exitonclick()