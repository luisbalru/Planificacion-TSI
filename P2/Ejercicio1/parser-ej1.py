# -*- coding: utf-8 -*-

# Parser para el ejercicio 1. Lee un archivo dado como parámetro y crea el problema en PDDL
# Autor: Luis Balderas Ruiz
# Técnicas de los Sistemas Inteligentes. UGR 2019

import sys

filename = sys.argv[1]
f = open(filename, 'r')
zonas = f.readline()
num_zonas = int(zonas[16:])
