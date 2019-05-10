# -*- coding: utf-8 -*-

# Parser para el ejercicio 1. Lee un archivo dado como parámetro y crea el problema en PDDL
# Autor: Luis Balderas Ruiz
# Técnicas de los Sistemas Inteligentes. UGR 2019

entrada = "entrada.txt"
salida = "salida.txt"

f_en = open(entrada,'r')
f_sal = open(salida, 'w')

zonas = []

personajes = []

objetos = []


for line in f_en:
    line = line.lower()
    if "->" in line:
        linea = line.split("->")
        linea[0].strip()
        linea[1].strip()
