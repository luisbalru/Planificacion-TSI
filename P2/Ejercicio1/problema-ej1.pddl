(define (problem prueba1-ej1)
    (:domain ejercicio1)
    (:objects
        z1 z2 z3 z4 z5 z6 z7 z8 z9 z10 z11 z12 z13 z14 z15 z16 z17 z18 z19 z20 z21 z22 z23 z24 z25 - zona
        princesa1 - princesa
        principe1 - principe
        bruja1 - bruja
        profesor1 - profesor
        dicaprio1 - dicaprio
        oscar1 - oscar
        manzana1 - manzana
        rosa1 - rosa
        oro1 - oro
        alg - algoritmo
        luis - avatar
    )
    (:init
      (esta-en luis z1)
      (personaje-en princesa1 z4)
      (personaje-en principe1 z6)
      (personaje-en bruja1 z15)
      (personaje-en profesor1 z10)
      (personaje-en dicaprio1 z20)
      (objeto-en oscar1 z13)
      (objeto-en manzana1 z3)
      (objeto-en rosa1 z18)
      (objeto-en oro1 z23)
      (objeto-en alg z16)
      (orientado luis sur)
      (or-sig-iz norte oeste)
      (or-sig-iz oeste sur)
      (or-sig-iz sur este)
      (or-sig-iz este norte)
      (or-sig-der norte este)
      (or-sig-der este sur)
      (or-sig-der sur oeste)
      (or-sig-der oeste norte)
    ;; z1 z2 z3 z4 z5 z6 z7 z8 z9 z10 z11 z12 z13 z14 z15 z16 z17 z18 z19 z20 z21 z22 z23 z24 z25
        (conectadas z1 z2 este)
        (conectadas z2 z1 oeste)
        (conectadas z2 z3 este)
        (conectadas z3 z2 oeste)
        (conectadas z3 z4 este)
        (conectadas z4 z3 oeste)
        (conectadas z4 z5 este)
        (conectadas z5 z4 oeste)
        (conectadas z5 z6 este)
        (conectadas z6 z5 oeste)
        (conectadas z6 z7 este)
        (conectadas z7 z6 oeste)
        (conectadas z7 z8 este)
        (conectadas z8 z7 oeste)
        (conectadas z8 z9 este)
        (conectadas z9 z8 oeste)
        (conectadas z9 z10 este)
        (conectadas z10 z9 oeste)
        (conectadas z10 z11 este)
        (conectadas z11 z10 oeste)
        (conectadas z11 z12 este)
        (conectadas z12 z11 oeste)
        (conectadas z12 z13 este)
        (conectadas z13 z12 oeste)
        (conectadas z13 z14 este)
        (conectadas z14 z13 oeste)
        (conectadas z14 z15 este)
        (conectadas z15 z14 oeste)
        (conectadas z15 z16 este)
        (conectadas z16 z15 oeste)
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
    )
    (:goal (and
                (tiene-objeto princesa1)
                (tiene-objeto principe1)
                (tiene-objeto bruja1)
                (tiene-objeto dicaprio1)
                (tiene-objeto profesor1)
            )
    )
)
