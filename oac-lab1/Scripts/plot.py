import matplotlib.pyplot as plt
import numpy as np
from sklearn.linear_model import LinearRegression
from scipy.optimize import curve_fit

#############
## Linear ###
#############
y = [113, 213, 313, 413, 513, 613, 713, 813, 913, 1013]
y = np.array(y)

x = [x for x in range(10, 110, 10)]
x = np.array(x).reshape((-1, 1))

model = LinearRegression().fit(x, y)

linear_curve, = plt.plot(x, y, 'bo--', label='$t_o$')
# linear_curve_legend = 
print('linear model:', model.intercept_, model.coef_)


##################
## Exponencial ###
##################
# https://lmfit.github.io/lmfit-py/model.html
# https://docs.scipy.org/doc/scipy/reference/generated/scipy.optimize.curve_fit.html
def quadratic(x, a, b):
    return a * x**2 + b

y = [878, 3486, 7941, 14162, 22201, 31978, 43426, 56873, 72029, 89073]
y = np.array([i*1.0 for i in y])
x = np.linspace(10, 100, 10)

quadratic_curve, = plt.plot(x, y, 'ro', label='$t_i$')
quadratic_curve_legend = plt.legend(handles=[quadratic_curve], loc='upper left')

best_vals, pcov = curve_fit(quadratic, x, y)
plt.plot(x, quadratic(x, *best_vals), 'r--')
# 8.9*x^2 - 79.9

print('parabola', best_vals)

# fig, ax = plt.subplots()

plt.xlabel('n (tamanho do vetor)')
plt.legend(handles=[linear_curve, quadratic_curve], loc='upper left')
plt.ylabel('I (número de instruções executadas)')
plt.title('$t_i$, $t_0$ x n')
plt.show()
