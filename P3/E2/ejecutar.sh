#!/bin/bash

dominio=$1
problema=$2

wine htnp.exe -d $dominio -p $problema |& sed -e "s/\r/\n/g"
