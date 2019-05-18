(define (problem prueba1-ej5)
    (:domain ejercicio5)
    (:objects
        z1 z2 z3 z4 z5 z6 z7 z8 z9 z10 z11 z12 z13 z14 z15 z16 z17 z18 z19 z20 z21 z22 z23 z24 z25 - zona
        princesa1 - Princesa
        principe1 - Principe
        bruja1 - Bruja
        profesor1 - Profesor
        leonardo1 - Leonardo
        oscar1 - oscar
        manzana1 - manzana
        rosa1 - rosa
        oro1 - oro
        alg - algoritmo
        zap - Zapatilla
        luis - Player
        oscar2 - oscar
        manzana2 - manzana
        rosa2 - rosa
        oro2 - oro
        alg2 - algoritmo
        zap2 - Zapatilla
    )
    (:init
      ; definición de tipos personajes
      (es-tipo-p tipoPrincipe principe1)
      (es-tipo-p tipoPrincesa princesa1)
      (es-tipo-p tipoProfe profesor1)
      (es-tipo-p tipoBr bruja1)
      (es-tipo-p tipoLeo leonardo1)

      ; definición de tipos objetos
      (es-tipo-o tipoOscar oscar1)
      (es-tipo-o tipoOscar oscar2)
      (es-tipo-o tipoManz manzana1)
      (es-tipo-o tipoManz manzana2)
      (es-tipo-o tipoRosa rosa1)
      (es-tipo-o tipoRosa rosa2)
      (es-tipo-o tipoAlg alg)
      (es-tipo-o tipoAlg alg2)
      (es-tipo-o tipoOro oro1)
      (es-tipo-o tipoOro oro2)

      ; objetos en zonas
      (en luis z1)
      (en princesa1 z4)
      ;(en zap z3)
      (en principe1 z6)
      (en bruja1 z15)
      (en profesor1 z10)
      (en leonardo1 z20)
      (en oscar1 z13)
      (en manzana1 z3)
      (en rosa1 z18)
      (en oro1 z23)
      (en alg z16)
      (en oscar2 z13)
      (en manzana2 z3)
      (en rosa2 z18)
      (en oro2 z23)
      (en alg2 z16)
      (mochila-vacia luis)
      (mano-vacia luis)
      (= (huecos-bolsillo bruja1) 3)
      (= (huecos-bolsillo profesor1) 3)
      (= (huecos-bolsillo leonardo1) 3)
      (= (huecos-bolsillo principe1) 3)
      (= (huecos-bolsillo princesa1) 3)

      ;(es-bosque z10)
      (orientado luis sur)
      (or-sig-iz norte oeste)
      (or-sig-iz oeste sur)
      (or-sig-iz sur este)
      (or-sig-iz este norte)
      (or-sig-der norte este)
      (or-sig-der este sur)
      (or-sig-der sur oeste)
      (or-sig-der oeste norte)

      ; z1  z2  z3  z4  z5
      ; z6  z7  z8  z9  z10
      ; z11 z12 z13 z14 z15
      ; z16 z17 z18 z19 z20
      ; z21 z22 z23 z24 z25
      (conectadas z1 z2 este)
      (conectadas z2 z1 oeste)
      (conectadas z2 z3 este)
      (conectadas z3 z2 oeste)
      (conectadas z3 z4 este)
      (conectadas z4 z3 oeste)
      (conectadas z4 z5 este)
      (conectadas z5 z4 oeste)
      (conectadas z6 z7 este)
      (conectadas z7 z6 oeste)
      (conectadas z7 z8 este)
      (conectadas z8 z7 oeste)
      (conectadas z8 z9 este)
      (conectadas z9 z8 oeste)
      (conectadas z9 z10 este)
      (conectadas z10 z9 oeste)
      (conectadas z11 z12 este)
      (conectadas z12 z11 oeste)
      (conectadas z12 z13 este)
      (conectadas z13 z12 oeste)
      (conectadas z13 z14 este)
      (conectadas z14 z13 oeste)
      (conectadas z14 z15 este)
      (conectadas z15 z14 oeste)
      (conectadas z16 z17 este)
      (conectadas z17 z16 oeste)
      (conectadas z17 z18 este)
      (conectadas z18 z17 oeste)
      (conectadas z18 z19 este)
      (conectadas z19 z18 oeste)
      (conectadas z19 z20 este)
      (conectadas z20 z19 oeste)
      (conectadas z20 z21 este)
      (conectadas z21 z20 oeste)
      (conectadas z21 z22 este)
      (conectadas z22 z21 oeste)
      (conectadas z22 z23 este)
      (conectadas z23 z22 oeste)
      (conectadas z23 z24 este)
      (conectadas z24 z23 oeste)
      (conectadas z24 z25 este)
      (conectadas z25 z24 oeste)
      (conectadas z1 z6 sur)
      (conectadas z6 z1 norte)
      (conectadas z6 z11 sur)
      (conectadas z11 z6 norte)
      (conectadas z11 z16 sur)
      (conectadas z16 z11 norte)
      (conectadas z16 z21 sur)
      (conectadas z21 z16 norte)
      (conectadas z2 z7 sur)
      (conectadas z7 z2 norte)
      (conectadas z7 z12 sur)
      (conectadas z12 z7 norte)
      (conectadas z12 z17 sur)
      (conectadas z17 z12 norte)
      (conectadas z17 z22 sur)
      (conectadas z22 z17 norte)
      (conectadas z3 z8 sur)
      (conectadas z8 z3 norte)
      (conectadas z8 z13 sur)
      (conectadas z13 z8 norte)
      (conectadas z13 z18 sur)
      (conectadas z18 z13 norte)
      (conectadas z18 z23 sur)
      (conectadas z23 z18 norte)
      (conectadas z4 z9 sur)
      (conectadas z9 z4 norte)
      (conectadas z9 z14 sur)
      (conectadas z14 z9 norte)
      (conectadas z14 z19 sur)
      (conectadas z19 z14 norte)
      (conectadas z19 z24 sur)
      (conectadas z24 z19 norte)
      (conectadas z5 z10 sur)
      (conectadas z10 z5 norte)
      (conectadas z10 z15 sur)
      (conectadas z15 z10 norte)
      (conectadas z15 z20 sur)
      (conectadas z20 z15 norte)
      (conectadas z20 z25 sur)
      (conectadas z25 z20 norte)

      ; puntos de luis
      (= (puntos-jugador) 0)
      ; puntos para leonardo1
      (= (puntos tipoLeo tipoOscar) 10)
      (= (puntos tipoLeo tipoRosa) 1)
      (= (puntos tipoLeo tipoManz) 3)
      (= (puntos tipoLeo tipoAlg) 4)
      (= (puntos tipoLeo tipoOro) 5)
      ; puntos para princesa1
      (= (puntos tipoPrincesa tipoOscar) 5)
      (= (puntos tipoPrincesa tipoRosa) 10)
      (= (puntos tipoPrincesa tipoManz) 1)
      (= (puntos tipoPrincesa tipoAlg) 3)
      (= (puntos tipoPrincesa tipoOro) 4)
    ; puntos para bruja1
      (= (puntos tipoBr tipoOscar) 4)
      (= (puntos tipoBr tipoRosa) 5)
      (= (puntos tipoBr tipoManz) 10)
      (= (puntos tipoBr tipoAlg) 1)
      (= (puntos tipoBr tipoOro) 3)
      ; puntos para profesor1
      (= (puntos tipoProfe tipoOscar) 3)
      (= (puntos tipoProfe tipoRosa) 4)
      (= (puntos tipoProfe tipoManz) 5)
      (= (puntos tipoProfe tipoAlg) 10)
      (= (puntos tipoProfe tipoOro) 1)
    ; puntos para principe1
      (= (puntos tipoPrincipe tipoOscar) 1)
      (= (puntos tipoPrincipe tipoRosa) 3)
      (= (puntos tipoPrincipe tipoManz) 4)
      (= (puntos tipoPrincipe tipoAlg) 5)
      (= (puntos tipoPrincipe tipoOro) 10)
      ;distancias
      (= (distancia-total) 0)
      (= (distancia z1 z2) 2)
      (= (distancia z2 z1) 2)
      (= (distancia z2 z3) 2)
      (= (distancia z3 z2) 2)
      (= (distancia z3 z4) 2)
      (= (distancia z4 z5) 2)
      (= (distancia z4 z3) 2)
      (= (distancia z5 z4) 2)
      (= (distancia z6 z7) 2)
      (= (distancia z7 z6) 2)
      (= (distancia z7 z8) 2)
      (= (distancia z8 z7) 2)
      (= (distancia z9 z8) 2)
      (= (distancia z8 z9) 2)
      (= (distancia z9 z10) 2)
      (= (distancia z10 z9) 2)
      (= (distancia z11 z12) 2)
      (= (distancia z12 z11) 2)
      (= (distancia z12 z13) 2)
      (= (distancia z13 z12) 2)
      (= (distancia z13 z14) 2)
      (= (distancia z14 z15) 2)
      (= (distancia z14 z13) 2)
      (= (distancia z15 z14) 2)
      (= (distancia z16 z17) 2)
      (= (distancia z17 z16) 2)
      (= (distancia z17 z18) 2)
      (= (distancia z18 z17) 2)
      (= (distancia z18 z19) 2)
      (= (distancia z19 z18) 2)
      (= (distancia z19 z20) 2)
      (= (distancia z20 z19) 2)
      (= (distancia z21 z22) 2)
      (= (distancia z22 z21) 2)
      (= (distancia z22 z23) 2)
      (= (distancia z23 z22) 2)
      (= (distancia z23 z24) 2)
      (= (distancia z24 z23) 2)
      (= (distancia z24 z25) 2)
      (= (distancia z25 z24) 2)
      (= (distancia z1 z6) 2)
      (= (distancia z6 z1) 2)
      (= (distancia z6 z11) 2)
      (= (distancia z11 z6) 2)
      (= (distancia z11 z16) 2)
      (= (distancia z16 z11) 2)
      (= (distancia z16 z21) 2)
      (= (distancia z21 z16) 2)
      (= (distancia z2 z7) 2)
      (= (distancia z7 z2) 2)
      (= (distancia z7 z12) 2)
      (= (distancia z12 z7) 2)
      (= (distancia z12 z17) 2)
      (= (distancia z17 z12) 2)
      (= (distancia z17 z22) 2)
      (= (distancia z22 z17) 2)
      (= (distancia z3 z8) 2)
      (= (distancia z8 z3) 2)
      (= (distancia z8 z13) 2)
      (= (distancia z13 z8) 2)
      (= (distancia z13 z18) 2)
      (= (distancia z18 z13) 2)
      (= (distancia z18 z23) 2)
      (= (distancia z23 z18) 2)
      (= (distancia z4 z9) 2)
      (= (distancia z9 z4) 2)
      (= (distancia z9 z14) 2)
      (= (distancia z14 z9) 2)
      (= (distancia z14 z19) 2)
      (= (distancia z19 z14) 2)
      (= (distancia z19 z24) 2)
      (= (distancia z24 z19) 2)
      (= (distancia z5 z10) 2)
      (= (distancia z10 z5) 2)
      (= (distancia z10 z15) 2)
      (= (distancia z15 z10) 2)
      (= (distancia z15 z20) 2)
      (= (distancia z20 z15) 2)
      (= (distancia z20 z25) 2)
      (= (distancia z25 z20) 2)
    )
    (:goal (and
                (tiene-objeto princesa1)
                (tiene-objeto principe1)
                (tiene-objeto bruja1)
                (tiene-objeto leonardo1)
                (tiene-objeto profesor1)
                (<= (distancia-total) 700)
                (>= (puntos-jugador) 20)
            )
    )
)
