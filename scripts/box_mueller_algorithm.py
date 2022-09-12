#!/usr/bin/env python3


def box_muller(mu = None, sigma = None):
    u,v = (np.random.uniform(0,1,1000), np.random.uniform(0,1,1000))
    
    x_append = []
    y_append = []
    for i in range(0,len(u)):
        x = mu + sigma * math.sqrt(-2*math.log(u[i]))*(math.cos(2*math.pi*v[i]))
        y = mu + sigma * math.sqrt(-2*math.log(u[i]))*(math.sin(2*math.pi*v[i]))
       
        y_append.append(y)
        x_append.append(x)
    return x_append,y_append
