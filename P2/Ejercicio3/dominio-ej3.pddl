(define (domain ejercicio3)
    (:requirements :strips :equality :typing :fluents)
    (:types zona orientacion objeto personaje - object
            personaje objeto - locatable
            Princesa Principe Bruja Profesor Leonardo Player - personaje
            oscar manzana rosa algoritmo oro Zapatilla Bikini - objeto)

    (:predicates
        (conectadas ?x - zona ?y - zona ?o - orientacion)
        (orientado ?j - personaje ?o - orientacion)
        (mano-vacia ?j - personaje)
        (mochila-vacia ?j - personaje)
        (en ?l - locatable ?z - zona)
        (posee ?x - personaje ?o - objeto)
        (es-bikini ?o - objeto)
        (es-zapatilla ?o - objeto)
        (tiene-bikini ?x - personaje)
        (tiene-zapatilla ?x - personaje)
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

    (:action COGER
        :parameters(?x - personaje ?o - objeto ?z - zona)
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

    (:action DEJAR
        :parameters(?x - personaje ?o - objeto ?z - zona)
        :precondition(and
                        (en ?x ?z)
                        (posee ?x ?o)
                     )
        :effect(and
                   (not (posee ?x ?o))
                   (mano-vacia ?x)
                   (en ?o ?z)
               )
    )

    (:action METER
        :parameters(?x - personaje ?o - objeto)
        :precondition(and
                        (not (mano-vacia ?x))
                        (posee ?x ?o)
                        (mochila-vacia ?x)
                     )
        :effect(and
                  (mano-vacia ?x)
                  (not (mochila-vacia ?x))
               )
    )

    (:action SACAR
        :parameters(?x - personaje ?o - objeto)
        :precondition(and
                        (mano-vacia ?x)
                        (not (mochila-vacia ?o))
                        (posee ?x ?o)
                     )
        :effect(and
                  (mochila-vacia ?o)
                  (not (mano-vacia ?x))
               )
    )
    ; pendiente de modificación para quitar when erroneo. Utilizar información del correo
    (:action IR
        :parameters(?j - personaje ?or - orientacion ?x - zona ?y - zona)
        :precondition(and
                        (en ?j ?x)
                        (conectadas ?x ?y ?or)
                        (orientado ?j ?or)
                        (not (es-precipicio ?y))
                        (when (and (es-tierra ?y))
                            (and (tiene-zapatilla ?j))
                        )
                        (when (and (es-agua ?y))
                            (and (tiene-bikini ?j))
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
        :parameters(?x - personaje ?p - personaje  ?o - objeto ?z - zona)
        :precondition(and
                        (posee ?x ?o)
                        (not(personaje-posee ?p ?o ))
                        (en ?x ?z)
                        (en ?p ?z)
                     )
        :effect(and
                    (not(posee ?x ?o))
                    (tiene-objeto ?p)
               )
    )


)
