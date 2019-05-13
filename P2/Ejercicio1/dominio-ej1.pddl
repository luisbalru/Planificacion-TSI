(define (domain ejercicio1)
    (:requirements :strips :equality :typing)
    (:types jugador zona orientacion objeto personaje - object
            Princesa Principe Bruja Profesor Leonardo - personaje
            Player - jugador
            oscar manzana rosa algoritmo oro - objeto)

    (:predicates
        (conectadas ?x - zona ?y - zona ?o - orientacion)
        (orientado ?j - jugador ?o - orientacion)
        (esta-en ?x - jugador ?z - zona)
        (personaje-en ?x - personaje ?z - zona)
        (objeto-en ?o - objeto ?z - zona)
        (posee ?x - jugador ?o - objeto)
        (tiene-objeto ?p - personaje)
        (or-sig-iz ?actual - orientacion ?siguiente - orientacion)
        (or-sig-der ?actual - orientacion ?siguiente - orientacion)
        (personaje-posee ?x - personaje ?o - objeto)
    )

    (:constants
        norte sur este oeste - orientacion
    )

    (:action GIRAR-IZQ
        :parameters(?x - jugador ?actual ?siguiente - orientacion)
        ; Compruebo la orientación del jugador
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
      :parameters(?x - jugador ?actual ?siguiente - orientacion)
      ; Compruebo la orientación del jugador
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
        :parameters(?x - jugador ?o - objeto ?z - zona)
        :precondition(and
                        (esta-en ?x ?z)
                        (objeto-en ?o ?z)
                        (not(posee ?x ?o))
                     )
        :effect(and
                    (posee ?x ?o)
                    (not (objeto-en ?o ?z))
               )
    )

    ; no sé cómo van las posiciones (tiene que estar en la misma, conectadas y con la orientación correcta ?????)
    (:action DEJAR
        :parameters(?x - jugador ?o - objeto ?z - zona)
        :precondition(and
                        (esta-en ?x ?z)
                        (posee ?x ?o)
                     )
        :effect(and
                    (not(posee ?x ?o))
                    (objeto-en ?o ?z)
               )
    )

    (:action IR
        :parameters(?j - jugador ?or - orientacion ?x - zona ?y - zona)
        :precondition(and
                        (esta-en ?j ?x)
                        (conectadas ?x ?y ?or)
                        (orientado ?j ?or)
                     )
        :effect(and
                    (esta-en ?j ?y)
                    (not(esta-en ?j ?x))
                )
    )

    ; no sé cómo van las posiciones (tiene que estar en la misma, conectadas y con la orientación correcta ?????)
    (:action ENTREGAR
        :parameters(?x - jugador ?p - personaje  ?o - objeto ?z - zona)
        :precondition(and
                        (posee ?x ?o)
                        (not(personaje-posee ?p ?o ))
                        (esta-en ?x ?z)
                        (personaje-en ?p ?z)
                     )
        :effect(and
                    (not(posee ?x ?o))
                    (personaje-posee ?p ?o)
                    (tiene-objeto ?p)
               )
    )


)
