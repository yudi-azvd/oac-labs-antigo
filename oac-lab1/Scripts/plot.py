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
def exp(x, a, b, c):
    return a * np.exp(-b*x) + c

y = [878, 3486, 7941, 14162, 22201, 31978, 43426, 56873, 72029, 89073]
y = np.array([i*1.0 for i in y])
x = np.linspace(10, 100, 10)

exp_curve, = plt.plot(x, y, 'ro', label='$t_i$')
exp_curve_legend = plt.legend(handles=[exp_curve], loc='upper left')
# plt.plot(x, y, 'r', label='array ordenado inversamente') # array ordenado inversamente

best_vals, pcov = curve_fit(exp, x, y)
plt.plot(x, exp(x, *best_vals), 'r--')
# 1.9e+04*exp(x*-1.8*10^-02) - 2.32438249e+04

print('exponencial', best_vals)

# fig, ax = plt.subplots()

plt.xlabel('n (tamanho do vetor)')
plt.legend(handles=[linear_curve, exp_curve], loc='upper left')
plt.ylabel('I (número de instruções executadas)')
plt.title('$t_i$, $t_0$ x n')
plt.show()
