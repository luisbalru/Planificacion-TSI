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
        (tiene-orientacion ?x - jugador ?y - orientacion)
        (esta-en ?x - jugador ?z - zona)
        (personaje-en ?x - personaje ?z - zona)
        (objeto-en ?o - objeto ?z - zona)
        (posee ?x - jugador ?o - objeto)
        (personaje-posee ?x - personaje ?o - objeto)
    )
    
    (:action GIRAR-IZQ
        :parameters(?x - jugador ?or - orientacion)
        ; Compruebo la orientación del jugador
        :precondition(and
                        (tiene-orientacion ?x ?or)
                     )
        :effect()             
        
    )
    
    (:action GIRAR-DER
        :parameters(?x - jugador ?or - orientacion)
        :precondition(and
                        (tiene-orientacion ?x ?or)
                     )
        
        :effect()
    )
    
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
    
    (:action DEJAR
        :parameters(?x - jugador ?o - objeto ?z - zona)
        :precondition(and
                        (esta-en ?x ?z)
                        (posee ?j ?o)
                     )
        :effect(and
                    (not(posee ?j ?o))
                    (objeto-en(?o ?z))
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








)