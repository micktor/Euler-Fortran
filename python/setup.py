import numpy as np
import matplotlib.pyplot as plt
import os

def error(x,y):
    sum = 0
    i = 0
    for a in np.nditer(x):
        sum += abs(exact(a) - y[i])
        i += 1

    return sum

def exact(x):
    return np.sqrt(2*np.log(x**2 + 1) + 4) * -1

def graph(formula, range):
    x = np.array(range)
    y = formula(x)
    plt.plot(x, y)

os.chdir("../fortran")
os.system("make && ./main")

def plotter(i):
    t,sol = np.loadtxt(
        'output_'+str(i)+'.txt',
        skiprows = 1,
        unpack = True
    )

    err = error(t,sol)

    graph(exact, range(0, 10))
    plt.ylabel('y axis')
    plt.xlabel('t axis')
    plt.grid()
    plt.title('calculated error: ' + str(err))

    plt.plot(t,sol,'ro--')
    os.chdir("../python")
    plt.savefig("result_"+str(i)+".png")
    os.chdir("../fortran")
    plt.clf()


plotter(8)
plotter(16)
plotter(32)
plotter(64)

os.system("make clean")
