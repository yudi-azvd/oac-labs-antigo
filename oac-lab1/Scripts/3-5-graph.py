import os
import matplotlib.pyplot as plt
from mpl_toolkits import mplot3d
import numpy as np


def get_file_content(filename):
    working_dir = os.getcwd()
    full_path_filename = os.path.join(working_dir, 'oac-lab1', 'Scripts', filename)
    file = open(full_path_filename, 'r')
    
    if not file:
        return None

    content = []
    for line in file:
        content.append(line.strip().split(' '))

    file.close()
    return content

def parse_content(content):
    # data = { 'points': [], 'fixed_variable': '' }   # fixed_variable eh 'r', 'a' ou 'p'
    data = { 'r': [], 'a': [], 'p': [], 't_exec': [], 'fixed_variable': '' }
    for i in range(0, len(content), 3):
        rap = list(map(int, content[i]))    # r: rap[0], a: rap[1], p: rap[2]
        data['r'].append(rap[0])
        data['a'].append(rap[1])
        data['p'].append(rap[2])
        t_exec_vertices = content[i+1][0]   # tempo de exec do proc vertices
        t_exec_desenha  = content[i+2][0]   # tempo de exec do proc desenha
        t_exec = (int(t_exec_vertices) + int(t_exec_desenha)) # tempo em ms
        t_exec /= 1000 # tempo em s

        data['t_exec'].append(t_exec)
    return data

def plot_data_i(data):
    # r = data['r'] # fixo = 100
    fig = plt.figure()
    ax = plt.axes(projection="3d")

    a = data['a']
    p = data['p']
    t_exec = data['t_exec']

    # x, y, z
    ax.plot3D(a, p, t_exec, 'red', label='r = 100 (fixo)')
    ax.set_xlabel('Ângulo (°)')
    ax.set_ylabel('P (lados)')
    ax.set_zlabel('Tempo de execução (s)')
    ax.legend()
    plt.title('$t_{exec}}$ x $a$,$p$')
    plt.show()
    return

def plot_data_ii(data):
    # a = data['a']
    fig = plt.figure()
    ax = plt.axes(projection="3d")

    r = data['r']
    p = data['p']
    t_exec = data['t_exec']

    # x, y, z
    ax.plot3D(r, p, t_exec, 'blue', label='a = 90° (fixo)')
    ax.set_xlabel('Raio')
    ax.set_ylabel('P (lados)')
    ax.set_zlabel('Tempo de execução (s)')
    plt.title('$t_{exec}}$ x $r$,$p$')
    plt.legend()
    plt.show()
    return

def plot_data_iii(data):
    # p = data['p'] # fixo: 5
    fig = plt.figure()
    ax = plt.axes(projection="3d")

    r = data['r']
    a = data['a']
    t_exec = data['t_exec']

    # x, y, z
    ax.plot3D(r, a, t_exec, 'green', label='p = 5 (fixo)')
    ax.set_xlabel('Raio')
    ax.set_ylabel('Ângulo (°)')
    ax.set_zlabel('Tempo de execução (s)')
    plt.title('$t_{exec}}$ x $r$,$a$')
    plt.legend()
    plt.show()
    return

def plot(filename):
    map_filename_to_plotter = {
        '3-5-i.txt': plot_data_i,
        '3-5-ii.txt': plot_data_ii,
        '3-5-iii.txt': plot_data_iii,
    }

    content = get_file_content(filename)
    data = parse_content(content)
    plotter = map_filename_to_plotter[filename]
    plotter(data)
    return 

def main():
    filenames = [
        '3-5-i.txt',
        '3-5-ii.txt',
        '3-5-iii.txt',
    ]

    # plot('3-5-i.txt')
    plot('3-5-ii.txt')
    return

if __name__ == "__main__":
    main()
