(define (domain ejercicio3)
    (:requirements :strips :equality :typing :fluents)
    (:types zona orientacion objeto personaje - object
            personaje objeto - locatable
            Princesa Principe Bruja Profesor Leonardo Player - personaje
            oscar manzana rosa algoritmo oro Zapatilla Bikini - objeto)

    (:predicates
        (conectadas ?x - zona ?y - zona ?o - orientacion)
        (orientado ?j - Player ?o - orientacion)
        (mano-vacia ?j - Player)
        (mochila-vacia ?j - Player)
        (en ?l - locatable ?z - zona)
        (es-bikini ?o - objeto)
        (es-zapatilla ?o - objeto)
        (tiene-bikini ?x - Player)
        (tiene-zapatilla ?x - Player)
        (es-bosque ?z - zona)
        (es-agua ?z - zona)
        (es-precipicio ?z - zona)
        (es-arena ?z - zona)
        (es-piedra ?z - zona)
        (tiene-objeto ?p - personaje)
        (or-sig-iz ?actual - orientacion ?siguiente - orientacion)
        (or-sig-der ?actual - orientacion ?siguiente - orientacion)
    )

    (:constants
        norte sur este oeste - orientacion
    )

    (:functions
        (distancia ?x ?y - zona)
        (distancia-total)
        (puntos ?p - personaje ?objeto)
        (puntos-jugador)
    )

    (:action GIRAR-IZQ
        :parameters(?x - Player ?actual ?siguiente - orientacion)
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
      :parameters(?x - Player ?actual ?siguiente - orientacion)
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

    (:action COGER
        :parameters(?x - Player ?o - objeto ?z - zona)
        :precondition(and
                        (en ?x ?z)
                        (en ?o ?z)
                        (mano-vacia ?x)
                     )
        :effect(and
                    (not (mano-vacia ?x))
                    (not (en ?o ?z))
                    (when (and (es-bikini ?o))
                        (and
                            (tiene-bikini ?x)
                        )
                    )
                    (when (and (es-zapatilla ?o))
                        (and
                            (tiene-zapatilla ?x)
                        )
                    )
               )
    )

    (:action DEJAR
        :parameters(?x - Player ?o - objeto ?z - zona)
        :precondition(and
                        (en ?x ?z)
                        (not (mano-vacia ?x))
                     )
        :effect(and
                   (mano-vacia ?x)
                   (en ?o ?z)
                   (when (and (es-bikini ?o))
                       (and
                           (not (tiene-bikini ?x))
                       )
                   )
                   (when (and (es-zapatilla ?o))
                       (and
                           (not (tiene-zapatilla ?x))
                       )
                   )
               )
    )

    (:action METER
        :parameters(?x - Player ?o - objeto)
        :precondition(and
                        (not (mano-vacia ?x))
                        (mochila-vacia ?x)
                     )
        :effect(and
                  (mano-vacia ?x)
                  (not (mochila-vacia ?x))
               )
    )

    (:action SACAR
        :parameters(?x - Player ?o - objeto)
        :precondition(and
                        (mano-vacia ?x)
                        (not (mochila-vacia ?x))
                     )
        :effect(and
                  (mochila-vacia ?x)
                  (not (mano-vacia ?x))
               )
    )


    (:action IR
        :parameters(?j - Player ?or - orientacion ?x - zona ?y - zona)
        :precondition(and
                        (en ?j ?x)
                        (conectadas ?x ?y ?or)
                        (orientado ?j ?or)
                        (not (es-precipicio ?y))
                        (or
                            (es-bosque ?y)
                            (tiene-zapatilla ?j)
                            (or
                                (not (es-bosque ?y))
                                (es-agua ?y)
                                (tiene-bikini ?j)
                                (and
                                    (not (es-agua ?y))
                                )
                            )
                        )
                     )
        :effect(and
                    (en ?j ?y)
                    (not(en ?j ?x))
                    (increase (distancia-total) (distancia ?x ?y))
                )
    )

    ; no sé cómo van las posiciones (tiene que estar en la misma, conectadas y con la orientación correcta ?????)
    (:action ENTREGAR
        :parameters(?x - Player ?p - personaje  ?o - objeto ?z - zona)
        :precondition(and
                        (not (tiene-objeto ?p))
                        (en ?x ?z)
                        (en ?p ?z)
                     )
        :effect(and
                    (when (and (es-bikini ?o))
                        (and
                            (not (tiene-bikini ?x))
                        )
                    )
                    (when (and (es-zapatilla ?o))
                        (and
                            (not (tiene-zapatilla ?x))
                        )
                    )
                    (tiene-objeto ?p)
                    (increase (puntos-jugador) (puntos ?p ?o))
               )
    )


)