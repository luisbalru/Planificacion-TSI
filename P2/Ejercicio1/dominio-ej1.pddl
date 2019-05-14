(define (domain ejercicio1)
    (:requirements :strips :equality :typing)
    (:types zona orientacion objeto personaje - object
            personaje objeto - locatable
            Princesa Principe Bruja Profesor Leonardo Player - personaje
            oscar manzana rosa algoritmo oro - objeto)

    (:predicates
        (conectadas ?x - zona ?y - zona ?o - orientacion)
        (orientado ?j - personaje ?o - orientacion)
        (en ?l - locatable ?z - zona)
        (posee ?x - personaje ?o - objeto)
        (tiene-objeto ?p - personaje)
        (or-sig-iz ?actual - orientacion ?siguiente - orientacion)
        (or-sig-der ?actual - orientacion ?siguiente - orientacion)
        (personaje-posee ?x - personaje ?o - objeto)
    )

    (:constants
        norte sur este oeste - orientacion
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
        :parameters(?x - personaje ?o - objeto ?z - zona)
        :precondition(and
                        (en ?x ?z)
                        (en ?o ?z)
                        (not(posee ?x ?o))
                     )
        :effect(and
                    (posee ?x ?o)
                    (not (en ?o ?z))
               )
    )

    ; no sé cómo van las posiciones (tiene que estar en la misma, conectadas y con la orientación correcta ?????)
    (:action DEJAR
        :parameters(?x - personaje ?o - objeto ?z - zona)
        :precondition(and
                        (en ?x ?z)
                        (posee ?x ?o)
                     )
        :effect(and
                    (not(posee ?x ?o))
                    (en ?o ?z)
               )
    )

    (:action IR
        :parameters(?j - personaje ?or - orientacion ?x - zona ?y - zona)
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
        :parameters(?x - personaje ?p - personaje  ?o - objeto ?z - zona)
        :precondition(and
                        (posee ?x ?o)
                        (not(personaje-posee ?p ?o ))
                        (en ?x ?z)
                        (en ?p ?z)
                     )
        :effect(and
                    (not(posee ?x ?o))
                    (personaje-posee ?p ?o)
                    (tiene-objeto ?p)
               )
    )


)
