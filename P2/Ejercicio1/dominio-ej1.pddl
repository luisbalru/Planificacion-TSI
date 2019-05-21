(define (domain ejercicio1)
    (:requirements :strips :equality :typing)
    (:types zona orientacion objeto personaje - object
            personaje objeto - locatable
            Princesa Principe Bruja Profesor Leonardo Player - personaje
            oscar manzana rosa algoritmo oro - objeto)

    (:constants
        norte sur este oeste - orientacion
    )

    (:predicates
        (conectadas ?x - zona ?y - zona ?o - orientacion)
        (orientado ?j - personaje ?o - orientacion)
        (en ?l - locatable ?z - zona)
        (posee ?x - personaje ?o - objeto)
        (mano-vacia ?x - Player)
        (tiene-objeto ?p - personaje)
        (or-sig-iz ?actual - orientacion ?siguiente - orientacion)
        (or-sig-der ?actual - orientacion ?siguiente - orientacion)
    )


    (:action GIRAR-IZQ
        :parameters(?x - personaje ?actual ?siguiente - orientacion)
        ; Compruebo la orientación del personaje
        :precondition(and
                        (orientado ?x ?actual)
                        (or-sig-iz ?actual ?siguiente)
                     )
        :effect(and
                  (not(orientado ?x ?actual))
                  (orientado ?x ?siguiente)
               )
    )

    (:action GIRAR-DER
      :parameters(?x - personaje ?actual ?siguiente - orientacion)
      ; Compruebo la orientación del personaje
      :precondition(and
                      (orientado ?x ?actual)
                      (or-sig-der ?actual ?siguiente)
                   )
      :effect(and
                (not(orientado ?x ?actual))
                (orientado ?x ?siguiente)
             )
    )

    ; no sé cómo van las posiciones (tiene que estar en la misma, conectadas y con la orientación correcta ?????)
    (:action COGER
        :parameters(?x - Player ?o - objeto ?z - zona)
        :precondition(and
                        (en ?x ?z)
                        (en ?o ?z)
                        (mano-vacia ?x)
                     )
        :effect(and
                    (posee ?x ?o)
                    (not (mano-vacia ?x))
                    (not (en ?o ?z))
               )
    )

    ; no sé cómo van las posiciones (tiene que estar en la misma, conectadas y con la orientación correcta ?????)
    (:action DEJAR
        :parameters(?x - Player ?o - objeto ?z - zona)
        :precondition(and
                        (en ?x ?z)
                        (posee ?x ?o)
                     )
        :effect(and
                    (not(posee ?x ?o))
                    (mano-vacia ?x)
                    (en ?o ?z)
               )
    )

    (:action IR
        :parameters(?j - Player ?or - orientacion ?x - zona ?y - zona)
        :precondition(and
                        (en ?j ?x)
                        (conectadas ?x ?y ?or)
                        (orientado ?j ?or)
                     )
        :effect(and
                    (en ?j ?y)
                    (not(en ?j ?x))
                )
    )

    ; no sé cómo van las posiciones (tiene que estar en la misma, conectadas y con la orientación correcta ?????)
    (:action ENTREGAR
        :parameters(?x - Player ?p - personaje  ?o - objeto ?z - zona)
        :precondition(and
                        (posee ?x ?o)
                        (not(tiene-objeto ?p))
                        (en ?x ?z)
                        (en ?p ?z)
                     )
        :effect(and
                    (not(posee ?x ?o))
                    (mano-vacia ?x)
                    (tiene-objeto ?p)
               )
    )


)
