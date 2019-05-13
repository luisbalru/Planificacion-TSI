# -*- coding: utf-8 -*-

# Parser para el ejercicio 1. Lee un archivo dado como parámetro y crea el problema en PDDL
# Autor: Luis Balderas Ruiz
# Técnicas de los Sistemas Inteligentes. UGR 2019

entrada = "entrada.txt"
salida = "salida.txt"

f_en = open(entrada,'r')
f_sal = open(salida, 'w')

zonas = []

objects = []

cosas-zonas = []

relaciones = []

dominio = ""
problema = ""

dominio = f_en.readline()
dominio = dominio.split("Dominio:")[1]
problema = f_en.readline()
problema = problema.split("Problema:")[1]


for line in f_en:
    if "->" in line:
        linea = line.split("->")
        O = linea[0].strip()
        aux = linea[1].strip()
        zones = aux.split(" ")
        for z in zones:
            l = z.split("[")
            if l[0] not in zonas:
                zonas.append(l[0])
                ob = l[1].split(",")
                objects.append(ob)
                per-ob = []
                for o in ob:
                    p = o.split("-")
                    per-ob.append(p)
                cosas-zonas.append(per-ob)
