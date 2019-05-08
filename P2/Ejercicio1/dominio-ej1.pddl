(define (domain ejercicio1)
    (:requirements :strips :equality :typing)
    (:types princesa principe bruja profesor dicaprio - personaje
            avatar - jugador
            zona
            orientacion
            oscar manzana rosa algoritmo oro - objetos)

    (:constants
        norte - orientacion
        sur - orientacion
        este - orientacion
        oeste - orientacion)

    (:predicates
        (conectadas ?x - zona ?y - zona)
        (esta-al ?x - orientacion ?z1 - zona ?z2 - zona)
        (orientado ?j - jugador ?o - orientacion)
        (tiene-orientacion ?j - jugador ?o - orientacion)
        (esta-en ?x - jugador ?z - zona)
        (personaje-en ?x - personaje ?z - zona)
        (objeto-en ?o - objeto ?z - zona)
        (posee ?x - jugador ?o - objeto)
        (or-sig-iz ?actual - orientacion ?siguiente - orientacion)
        (or-sig-der ?actual - orientacion ?siguiente - orientacion)
        (personaje-posee ?x - personaje ?o - objeto)
    )

    (:action GIRAR-IZQ
        :parameters(?x - jugador ?actual ?siguiente - orientacion)
        ; Compruebo la orientación del jugador
        :precondition(and
                        (tiene-orientacion ?x ?actual)
                        (or-sig-iz ?actual ?siguiente)
                     )
        :effect(and
                  (not(tiene-orientacion ?x ?actual))
                  (tiene-orientacion ?x ?siguiente)
               )
    )

    (:action GIRAR-DER
      :parameters(?x - jugador ?actual ?siguiente - orientacion)
      ; Compruebo la orientación del jugador
      :precondition(and
                      (tiene-orientacion ?x ?actual)
                      (or-sig-der ?actual ?siguiente)
                   )
      :effect(and
                (not(tiene-orientacion ?x ?actual))
                (tiene-orientacion ?x ?siguiente)
             )
    )

    ; no sé cómo van las posiciones (tiene que estar en la misma, conectadas y con la orientación correcta ?????)
    (:action COGER
        :parameters(?x - jugador ?o - objeto ?z - zona)
        :precondition(and
                        (esta-en ?x ?z)
                        (objeto-en ?o ?z)
                        (not(posee ?j ?o))
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
                        (posee ?j ?o)
                     )
        :effect(and
                    (not(posee ?j ?o))
                    (objeto-en ?o ?z)
               )
    )

    (:action IR
        :parameters(?j - jugador ?or - orientacion ?x - zona ?y - zona)
        :precondition(and
                        (esta-en ?j ?x)
                        (conectadas ?x ?y)
                        (esta-al ?or ?x ?y)
                        (tiene-orientacion ?j ?or)
                     )
        :effect(and
                    (esta-en ?j ?y)
                    (not(esta-en ?j ?x))
                )
    )

    ; no sé cómo van las posiciones (tiene que estar en la misma, conectadas y con la orientación correcta ?????)
    (:action ENTREGAR
        :parameters(?x - jugador ?p - personaje  ?o - objeto)
        :precondition(and
                        (posee ?x ?o)
                        (not(personaje-posee ?p ?o ))
                        ()
                     )
        :effect(and
                    (not(posee ?x ?o))
                    (personaje-posee ?p ?o)
               )
    )


)
