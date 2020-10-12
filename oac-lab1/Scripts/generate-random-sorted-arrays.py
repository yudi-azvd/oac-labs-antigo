from random import random

array_sizes = [x for x in range(10, 110, 10)]

sorted_arrays = []

def create_array_with_size(n):
    a = []
    for i in range(n):
        a.append(int(random()*100))
    a.sort()
    return a

def create_inverted_array_with_size(n):
    a = []
    for i in range(n):
        a.append(int(random()*100))
    a.sort(reverse=True)
    return a

for array_size in array_sizes:
    sorted_arrays.append(create_inverted_array_with_size(array_size))

for sorted_array in sorted_arrays:
    print(sorted_array)
