(define (domain zeno-travel)


(:requirements
  :typing
  :fluents
  :derived-predicates
  :negative-preconditions
  :universal-preconditions
  :disjuntive-preconditions
  :conditional-effects
  :htn-expansion

  ; Requisitos adicionales para el manejo del tiempo
  :durative-actions
  :metatags
 )

(:types aircraft person city - object)
(:constants slow fast - object)
(:predicates (at ?x - (either person aircraft) ?c - city)
             (in ?p - person ?a - aircraft)
             (different ?x ?y) (igual ?x ?y)
             (hay-fuel ?a ?c1 ?c2)
             (gasto-adecuado ?a)
             (destino ?p - person ?c - city)
             )
(:functions (fuel ?a - aircraft)
            (distance ?c1 - city ?c2 - city)
            (slow-speed ?a - aircraft)
            (fast-speed ?a - aircraft)
            (slow-burn ?a - aircraft)
            (fast-burn ?a - aircraft)
            (capacity ?a - aircraft)
            (refuel-rate ?a - aircraft)
            (num-pasajeros ?a - aircraft)
            (limite-pasajeros ?a - aircraft)
            (fuel-limit)
            (total-fuel-used)
            (boarding-time)
            (debarking-time)
            )

;; el consecuente "vac�o" se representa como "()" y significa "siempre verdad"
(:derived
  (igual ?x ?x) ())

(:derived
  (different ?x ?y) (not (igual ?x ?y)))

(:derived

  (hay-fuel ?a - aircraft ?c1 - city ?c2 - city)
  (> (fuel ?a) 1))



(:task transport-person
	:parameters (?p - person ?c - city)

  (:method Case1
	 :precondition (at ?p ?c)
	 :tasks ()
   )

   (:method Case2
	  :precondition (and (at ?p - person ?c1 - city)
			                 (at ?a - aircraft ?c1 - city))


	  :tasks (
	  	      (board ?p ?a ?c1)
		        (mover-avion ?a ?c1 ?c)
		        (debark ?p ?a ?c )))

  (:method Case3
    :precondition (and (at ?p - person ?c1 - city)
                        (at ?a - aircraft ?c2 - city))
    :tasks(
            (mover-avion ?a ?c2 ?c1)
            (board ?p ?a ?c1)
            (mover-avion ?a ?c1 ?c)
		        (debark ?p ?a ?c ))
    )
)

(:task mover-avion
  :parameters (?a - aircraft ?c1 - city ?c2 -city)
  (:method con-fuel
    :precondition(hay-fuel ?a ?c1 ?c2)
    :tasks(
            (volar ?a ?c1 ?c2)
          )
  )
  (:method sin-fuel
    :precondition(and
                    (not (hay-fuel ?a ?c1 ?c2))
                )
    :tasks(
            (repostar ?a ?c1 ?c2)
            (volar ?a ?c1 ?c2)
          )
  )
)

(:task volar
 :parameters (?a - aircraft ?c1 - city ?c2 -city)
 (:method fuel-suficiente-zoom
  :precondition (and
                    (hay-fuel ?a ?c1 ?c2)
                    (> (fuel-limit) (+ (total-fuel-used) (* (distance ?c1 ?c2) (fast-burn ?a))))
                )
  :tasks (
          (zoom ?a ?c1 ?c2)
         )
   )
  (:method fuel-fly
    :precondition(and
                    (hay-fuel ?a ?c1 ?c2)
                    (> (fuel-limit) (+ (total-fuel-used) (* (distance ?c1 ?c2) (slow-burn ?a))))
                )
    :tasks (
            (fly ?a ?c1 ?c2)
           )
  )
)

(:task repostar
  :parameters(?a - aircraft ?c1 - city ?c2 - city)
  (:method no-fuel
    :precondition (and
                    (not (hay-fuel ?a ?c1 ?c2))
                  )
    :tasks(
            (refuel ?a ?c1)
      )
  )
)

(:task montar-persona
  :parameters(?a - aircraft ?c - city)
  (:method no-hay
    :precondition(or
                    (not (at ?p - person ?c))
                    (> (num-pasajeros ?a) (limite-pasajeros ?a))
                  )
    :task()
  )
  (:method quedan
    :precondition(and
                    (at ?p - person ?c)
                    (at ?a ?c)
                    (< (num-pasajeros ?a) (limite-pasajeros ?a))
                    (not (destino ?p - person ?c))
                  )
    :task(and
            (board ?p - person ?a ?c)
            (montar-persona ?a ?c)
         )
  )
)

(:task bajar-persona
  :parameters(?a - aircraft ?c - city)
  (:method no-hay
    :precondition()
    :task()
  )
  (:method quedan
    :precondition(and
                    (at ?p - person ?c)
                    (at ?a ?c)
                    (destino ?p - person ?c)
                  )
    :task(and
            (debark ?p - person ?a ?c)
            (bajar-persona ?a ?c)
          )
    )
)

(:import "Primitivas-ZenoTravel.pddl")


)
