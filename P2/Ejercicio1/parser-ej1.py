# -*- coding: utf-8 -*-

# Parser para el ejercicio 1. Lee un archivo dado como parámetro y crea el problema en PDDL
# Autor: Luis Balderas Ruiz
# Técnicas de los Sistemas Inteligentes. UGR 2019

import sys

entrada = sys.argv[1]
salida = sys.argv[2]

f_en = open(entrada,'r')

zonas = []
zonas_def = []

objects = []

cosas_zonas = []

relaciones = []

dominio = ""
problema = ""

dominio = f_en.readline()
dominio = dominio.split("Dominio:")[1]
dominio = dominio[:-1]
problema = f_en.readline()
problema = problema.split("Problema:")[1]
problema = problema[:-1]

for line in f_en:
    if "->" in line:
        linea = line.split("->")
        O = linea[0].strip()
        aux = linea[1].strip()
        zones = aux.split(" ")
        i = 0
        while(i+1 < len(zones)):
        	if O == 'V':
        		a = "(conectadas " + zones[i].split("[")[0] + " " + zones[i+1].split("[")[0] + " sur)\n"
        		relaciones.append(a)
        		a = "(conectadas " + zones[i+1].split("[")[0] + " " + zones[i].split("[")[0] + " norte)\n"
        		relaciones.append(a)
        	else:
        		a = "(conectadas " + zones[i].split("[")[0] + " " + zones[i+1].split("[")[0] + " este)\n"
        		relaciones.append(a)
        		a = "(conectadas " + zones[i+1].split("[")[0] + " " + zones[i].split("[")[0] + " oeste)\n"
        		relaciones.append(a)
        	i = i+1
        	
        for z in zones:
            l = z.split("[")
            if l[0] not in zonas:
                zonas.append(l[0])
                ob = l[1].split("]")[0].split(",")
                objects.append(ob)
                per_ob = []
                for o in ob:
                	p = o.split("-")
                	per_ob.append(p[0])
                cosas_zonas.append(per_ob)


f_sal = open(salida, 'w')
f_sal.write("define(problem " + problema+")\n")
f_sal.write("\t (:domain " + dominio +")\n")
f_sal.write("\t (:objects\n")
for z in zonas:
	f_sal.write("\t\t" + z + " - zona\n")
for o in objects:
	for obj in o:
		if obj != '':
			f_sal.write("\t\t" + obj +"\n")
		if 'Player' in obj:
			orientacion = "\t\t (orientado " + obj.split("-")[0] + " sur)\n"
f_sal.write("\t )\n")
f_sal.write("\t (:init\n")
f_sal.write("\t\t (or-sig-iz norte oeste)\n")
f_sal.write("\t\t (or-sig-iz oeste sur)\n")
f_sal.write("\t\t (or-sig-iz sur este)\n")
f_sal.write("\t\t (or-sig-iz este norte)\n")
f_sal.write("\t\t (or-sig-der norte este)\n")
f_sal.write("\t\t (or-sig-der este sur)\n")
f_sal.write("\t\t (or-sig-der sur oeste)\n")
f_sal.write("\t\t (or-sig-der oeste norte)\n")
f_sal.write(orientacion)
for r in relaciones:
	f_sal.write("\t\t " + r)
	
for i in range(len(zonas)):
	for c in cosas_zonas[i]:
		if c != '':
			f_sal.write("\t\t (en " + c + " " + zonas[i] + ")\n")
f_sal.write("\t )\n")
f_sal.write("\t (:goal (and\n")
for o in objects:
	for ob in o:
		if ob != '' and 'Player' not in ob:
			print(ob)
			f_sal.write("\t\t (tiene-objeto " + ob.split("-")[0] +")\n")
f_sal.write("\t     )\n")
f_sal.write("\t)\n")
f_sal.write(")")
	
