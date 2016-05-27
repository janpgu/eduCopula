### Imports ###
import os
import numpy as np
import numpy as np
from mpl_toolkits.mplot3d import Axes3D
from matplotlib import cm
from matplotlib.ticker import LinearLocator, FormatStrFormatter
import matplotlib.pyplot as plt

### Define 3 Basic Copula Functions ###
def lowerBound(X, Y):
	Z = np.maximum(X + Y - 1, 0)
	return Z

def productCopula(X, Y):
	Z = X * Y
	return Z

def upperBound(X, Y):
	Z = np.minimum(X, Y)
	return Z

### Create Data Points ###
x = np.arange(0, 1, 0.01)              # points in the x axis
y = np.arange(0, 1, 0.01)              # points in the y axis
X, Y = np.meshgrid(x, y)               # create the "base grid"
Z1 = lowerBound(X, Y)                  # points in the z axis
Z2 = productCopula(X, Y)               # points in the z axis
Z3 = upperBound(X, Y)                  # points in the z axis

### Plotting ###
fig = plt.figure()
ax = fig.gca(projection='3d')
ax.plot_surface(X, Y, Z1, 
                rstride=5, 
                cstride=5, 
                alpha=0.5,           
                cmap=cm.Spectral)
plt.savefig('FHBounds1.pdf')
plt.close(fig)

fig = plt.figure()
ax = fig.gca(projection='3d')
ax.plot_surface(X, Y, Z2, 
                rstride=5, 
                cstride=5, 
                alpha=0.5,           
                cmap=cm.Spectral)
plt.savefig('FHBounds2.pdf')
plt.close(fig)

fig = plt.figure()
ax = fig.gca(projection='3d')
ax.plot_surface(X, Y, Z3, 
                rstride=5, 
                cstride=5, 
                alpha=0.5,           
                cmap=cm.Spectral)
plt.savefig('FHBounds3.pdf')
plt.close(fig)