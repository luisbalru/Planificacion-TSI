(define (domain ejercicio6)
    (:requirements :strips :equality :typing :fluents)
    (:types zona orientacion objeto personaje - object
            personaje objeto - locatable
            Princesa Principe Bruja Profesor Leonardo Player - personaje
            oscar manzana rosa algoritmo oro Zapatilla Bikini - objeto)

    (:constants
          norte sur este oeste - orientacion
          tipoLeo tipoBr tipoPrincipe tipoPrincesa tipoProfe - tipoPersonaje
          tipoOscar tipoManz tipoRosa tipoAlg tipoOro - tipoObjeto
    )

    (:predicates
        (conectadas ?x - zona ?y - zona ?o - orientacion)
        (orientado ?j - Player ?o - orientacion)
        (mano-vacia ?j - Player)
        (mochila-vacia ?j - Player)
        (posee-mano ?x - Player ?o - objeto)
        (posee-mochila ?x - Player ?o - objeto)
        (es-tipo-p ?t - tipoPersonaje ?p - personaje)
        (es-tipo-o ?to - tipoObjeto ?o - objeto)
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


    (:functions
        (distancia ?x ?y - zona)
        (distancia-total)
        (puntos ?p - tipoPersonaje ?o - tipoObjeto)
        (puntos-indiv ?x - Player)
        (puntos-total)
        (huecos-bolsillo ?p - personaje)
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
                    (posee-mano ?x ?o)
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
                        (posee-mano ?x ?o)
                     )
        :effect(and
                   (mano-vacia ?x)
                   (not (posee-mano ?x ?o))
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
                        (posee-mano ?x ?o)
                        (mochila-vacia ?x)
                     )
        :effect(and
                  (mano-vacia ?x)
                  (posee-mochila ?x ?o)
                  (not (posee-mano ?x ?o))
                  (not (mochila-vacia ?x))
               )
    )

    (:action SACAR
        :parameters(?x - Player ?o - objeto)
        :precondition(and
                        (mano-vacia ?x)
                        (posee-mochila ?x ?o)
                     )
        :effect(and
                  (mochila-vacia ?x)
                  (not (posee-mochila ?x ?o))
                  (posee-mano ?x ?o)
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
                        (en ?x ?z)
                        (en ?p ?z)
                        (>= (huecos-bolsillo ?p ) 1)
                        (posee-mano ?x ?o)
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
                    ; comprobación para tipoPrincipe
                    (when (and
                              (es-tipo-p tipoPrincipe ?p)
                              (es-tipo-o tipoOscar ?o)
                          )
                          (and
                            (increase (puntos-total) (puntos tipoPrincipe tipoOscar))
                            (increase (puntos-indiv ?x) (puntos tipoPrincipe tipoOscar))
                          )
                    )
                    (when (and
                              (es-tipo-p tipoPrincipe ?p)
                              (es-tipo-o tipoRosa ?o)
                          )
                          (and
                            (increase (puntos-total) (puntos tipoPrincipe tipoRosa))
                            (increase (puntos-indiv ?x) (puntos tipoPrincipe tipoRosa))
                          )
                    )
                    (when (and
                              (es-tipo-p tipoPrincipe ?p)
                              (es-tipo-o tipoManz ?o)
                          )
                          (and
                            (increase (puntos-total) (puntos tipoPrincipe tipoManz))
                            (increase (puntos-indiv ?x) (puntos tipoPrincipe tipoManz))
                          )
                    )
                    (when (and
                              (es-tipo-p tipoPrincipe ?p)
                              (es-tipo-o tipoAlg ?o)
                          )
                          (and
                            (increase (puntos-total) (puntos tipoPrincipe tipoAlg))
                            (increase (puntos-indiv ?x) (puntos tipoPrincipe tipoAlg))
                          )
                    )
                    (when (and
                              (es-tipo-p tipoPrincipe ?p)
                              (es-tipo-o tipoOro ?o)
                          )
                          (and
                            (increase (puntos-total) (puntos tipoPrincipe tipoOro))
                            (increase (puntos-indiv ?x) (puntos tipoPrincipe tipoOro))
                          )
                    )
                    ; comprobación para tipo princesa
                    (when (and
                              (es-tipo-p tipoPrincesa ?p)
                              (es-tipo-o tipoOscar ?o)
                          )
                          (and
                            (increase (puntos-total) (puntos tipoPrincesa tipoOscar))
                            (increase (puntos-indiv ?x) (puntos tipoPrincesa tipoOscar))
                          )
                    )
                    (when (and
                              (es-tipo-p tipoPrincesa ?p)
                              (es-tipo-o tipoRosa ?o)
                          )
                          (and
                            (increase (puntos-total) (puntos tipoPrincesa tipoRosa))
                            (increase (puntos-indiv ?x) (puntos tipoPrincesa tipoRosa))
                          )
                    )
                    (when (and
                              (es-tipo-p tipoPrincesa ?p)
                              (es-tipo-o tipoManz ?o)
                          )
                          (and
                            (increase (puntos-total) (puntos tipoPrincesa tipoManz))
                            (increase (puntos-indiv ?x) (puntos tipoPrincesa tipoManz))
                          )
                    )
                    (when (and
                              (es-tipo-p tipoPrincesa ?p)
                              (es-tipo-o tipoAlg ?o)
                          )
                          (and
                            (increase (puntos-total) (puntos tipoPrincesa tipoAlg))
                            (increase (puntos-indiv ?x) (puntos tipoPrincesa tipoAlg))
                          )
                    )
                    (when (and
                              (es-tipo-p tipoPrincesa ?p)
                              (es-tipo-o tipoOro ?o)
                          )
                          (and
                            (increase (puntos-total) (puntos tipoPrincesa tipoOro))
                            (increase (puntos-indiv ?x) (puntos tipoPrincesa tipoOro))
                          )
                    )

                    ; comprobación tipo bruja
                    (when (and
                              (es-tipo-p tipoBr ?p)
                              (es-tipo-o tipoOscar ?o)
                          )
                          (and
                            (increase (puntos-total) (puntos tipoBr tipoOscar))
                            (increase (puntos-indiv ?x) (puntos tipoBr tipoOscar))
                          )
                    )
                    (when (and
                              (es-tipo-p tipoBr ?p)
                              (es-tipo-o tipoRosa ?o)
                          )
                          (and
                            (increase (puntos-total) (puntos tipoBr tipoRosa))
                            (increase (puntos-indiv ?x) (puntos tipoBr tipoRosa))
                          )
                    )
                    (when (and
                              (es-tipo-p tipoBr ?p)
                              (es-tipo-o tipoManz ?o)
                          )
                          (and
                            (increase (puntos-total) (puntos tipoBr tipoManz))
                            (increase (puntos-indiv ?x) (puntos tipoBr tipoRosa))
                          )
                    )
                    (when (and
                              (es-tipo-p tipoBr ?p)
                              (es-tipo-o tipoAlg ?o)
                          )
                          (and
                            (increase (puntos-total) (puntos tipoBr tipoAlg))
                            (increase (puntos-indiv ?x) (puntos tipoBr tipoAlg))
                          )
                    )
                    (when (and
                              (es-tipo-p tipoBr ?p)
                              (es-tipo-o tipoOro ?o)
                          )
                          (and
                            (increase (puntos-total) (puntos tipoBr tipoOro))
                            (increase (puntos-indiv ?x) (puntos tipoBr tipoOro))
                          )
                    )

                  ; comprobacion tipo profesor
                  (when (and
                            (es-tipo-p tipoProfe ?p)
                            (es-tipo-o tipoOscar ?o)
                        )
                        (and
                          (increase (puntos-total) (puntos tipoProfe tipoOscar))
                          (increase (puntos-indiv ?x) (puntos tipoProfe tipoOscar))
                        )
                  )
                  (when (and
                            (es-tipo-p tipoProfe ?p)
                            (es-tipo-o tipoRosa ?o)
                        )
                        (and
                          (increase (puntos-total) (puntos tipoProfe tipoRosa))
                          (increase (puntos-indiv ?x) (puntos tipoProfe tipoRosa))
                        )
                  )
                  (when (and
                            (es-tipo-p tipoProfe ?p)
                            (es-tipo-o tipoManz ?o)
                        )
                        (and
                          (increase (puntos-total) (puntos tipoProfe tipoManz))
                          (increase (puntos-indiv ?x) (puntos tipoProfe tipoManz))
                        )
                  )
                  (when (and
                            (es-tipo-p tipoProfe ?p)
                            (es-tipo-o tipoAlg ?o)
                        )
                        (and
                          (increase (puntos-total) (puntos tipoProfe tipoAlg))
                          (increase (puntos-indiv ?x) (puntos tipoProfe tipoAlg))
                        )
                  )
                  (when (and
                            (es-tipo-p tipoProfe ?p)
                            (es-tipo-o tipoOro ?o)
                        )
                        (and
                          (increase (puntos-total) (puntos tipoProfe tipoOro))
                          (increase (puntos-indiv ?x) (puntos tipoProfe tipoOro))
                        )
                  )

                  ; comprobación tipo Leonardo
                  (when (and
                            (es-tipo-p tipoLeo ?p)
                            (es-tipo-o tipoOscar ?o)
                        )
                        (and
                          (increase (puntos-total) (puntos tipoLeo tipoOscar))
                          (increase (puntos-indiv ?x) (puntos tipoLeo tipoOscar))
                        )
                  )
                  (when (and
                            (es-tipo-p tipoLeo ?p)
                            (es-tipo-o tipoRosa ?o)
                        )
                        (and
                          (increase (puntos-total) (puntos tipoLeo tipoRosa))
                          (increase (puntos-indiv ?x) (puntos tipoLeo tipoRosa))
                        )
                  )
                  (when (and
                            (es-tipo-p tipoLeo ?p)
                            (es-tipo-o tipoManz ?o)
                        )
                        (and
                          (increase (puntos-total) (puntos tipoLeo tipoManz))
                          (increase (puntos-indiv ?x) (puntos tipoLeo tipoManz))
                        )
                  )
                  (when (and
                            (es-tipo-p tipoLeo ?p)
                            (es-tipo-o tipoAlg ?o)
                        )
                        (and
                          (increase (puntos-total) (puntos tipoLeo tipoAlg))
                          (increase (puntos-indiv ?x) (puntos tipoLeo tipoAlg))
                        )
                  )
                  (when (and
                            (es-tipo-p tipoLeo ?p)
                            (es-tipo-o tipoOro ?o)
                        )
                        (and
                          (increase (puntos-total) (puntos tipoLeo tipoOro))
                          (increase (puntos-indiv ?x) (puntos tipoLeo tipoOro))
                        )
                  )


                    (tiene-objeto ?p)
                    (mano-vacia ?x)
                    (not (posee-mano ?x ?o))
                    (decrease (huecos-bolsillo ?p) 1)
               )
    )


)
