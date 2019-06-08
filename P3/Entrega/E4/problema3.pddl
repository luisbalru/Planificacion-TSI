(define (problem zeno-0) (:domain zeno-travel)
(:customization
(= :time-format "%d/%m/%Y %H:%M:%S")
(= :time-horizon-relative 2500)
(= :time-start "05/06/2007 08:00:00")
(= :time-unit :hours))

(:objects
  p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 - person
  almeria barcelona bilbao cadiz cordoba gibraltar granada huelva jaen madrid malaga sevilla - city
  a1 a2 a3 a4 a5 a6 - aircraft
)

(:init
  (= (distance almeria barcelona) 809)
  (= (distance barcelona almeria) 809)
  (= (distance almeria bilbao) 958)
  (= (distance bilbao almeria) 958)
  (= (distance almeria cadiz) 463)
  (= (distance cadiz almeria) 463)
  (= (distance almeria cordoba) 316)
  (= (distance cordoba almeria) 316)
  (= (distance almeria gibraltar) 339)
  (= (distance gibraltar almeria) 339)
  (= (distance almeria granada) 162)
  (= (distance granada almeria) 162)
  (= (distance almeria huelva) 505)
  (= (distance huelva almeria) 505)
  (= (distance almeria jaen) 220)
  (= (distance jaen almeria) 220)
  (= (distance almeria madrid) 547)
  (= (distance madrid almeria) 547)
  (= (distance almeria malaga) 207)
  (= (distance malaga almeria) 207)
  (= (distance almeria sevilla) 410)
  (= (distance sevilla almeria) 410)
  (= (distance almeria almeria) 0)

  (= (distance barcelona bilbao) 620)
  (= (distance bilbao barcelona) 620)
  (= (distance barcelona cadiz) 1284)
  (= (distance cadiz barcelona) 1284)
  (= (distance barcelona cordoba) 908)
  (= (distance cordoba barcelona) 908)
  (= (distance barcelona gibraltar) 1124)
  (= (distance gibraltar barcelona) 1124)
  (= (distance barcelona granada) 868)
  (= (distance granada barcelona) 868)
  (= (distance barcelona huelva) 1140)
  (= (distance huelva barcelona) 1140)
  (= (distance barcelona jaen) 804)
  (= (distance jaen barcelona) 804)
  (= (distance barcelona madrid) 621)
  (= (distance madrid barcelona) 621)
  (= (distance barcelona malaga) 997)
  (= (distance malaga barcelona) 997)
  (= (distance barcelona sevilla) 1046)
  (= (distance sevilla barcelona) 1046)
  (= (distance barcelona barcelona) 0)

  (= (distance bilbao cadiz) 1058)
  (= (distance cadiz bilbao) 1058)
  (= (distance bilbao cordoba) 796)
  (= (distance cordoba bilbao) 796)
  (= (distance bilbao gibraltar) 1110)
  (= (distance gibraltar bilbao) 1110)
  (= (distance bilbao granada) 829)
  (= (distance granada bilbao) 829)
  (= (distance bilbao huelva) 939)
  (= (distance huelva bilbao) 939)
  (= (distance bilbao jaen) 730)
  (= (distance jaen bilbao) 730)
  (= (distance bilbao madrid) 395)
  (= (distance madrid bilbao) 395)
  (= (distance bilbao malaga) 939)
  (= (distance malaga bilbao) 939)
  (= (distance bilbao sevilla) 933)
  (= (distance sevilla bilbao) 933)
  (= (distance bilbao bilbao) 0)

  (= (distance cadiz cordoba) 261)
  (= (distance cordoba cadiz) 261)
  (= (distance cadiz gibraltar) 124)
  (= (distance gibraltar cadiz) 124)
  (= (distance cadiz granada) 296)
  (= (distance granada cadiz) 296)
  (= (distance cadiz huelva) 214)
  (= (distance huelva cadiz) 214)
  (= (distance cadiz jaen) 330)
  (= (distance jaen cadiz) 330)
  (= (distance cadiz madrid) 654)
  (= (distance madrid cadiz) 654)
  (= (distance cadiz malaga) 240)
  (= (distance malaga cadiz) 240)
  (= (distance cadiz sevilla) 126)
  (= (distance sevilla cadiz) 126)
  (= (distance cadiz cadiz) 0)

  (= (distance cordoba gibraltar) 294)
  (= (distance gibraltar cordoba) 294)
  (= (distance cordoba granada) 160)
  (= (distance granada cordoba) 160)
  (= (distance cordoba huelva) 241)
  (= (distance huelva cordoba) 241)
  (= (distance cordoba jaen) 108)
  (= (distance jaen cordoba) 108)
  (= (distance cordoba madrid) 396)
  (= (distance madrid cordoba) 396)
  (= (distance cordoba malaga) 165)
  (= (distance malaga cordoba) 165)
  (= (distance cordoba sevilla) 143)
  (= (distance sevilla cordoba) 143)
  (= (distance cordoba cordoba) 0)

  (= (distance gibraltar granada) 255)
  (= (distance granada gibraltar) 255)
  (= (distance gibraltar huelva) 289)
  (= (distance huelva gibraltar) 289)
  (= (distance gibraltar jaen) 335)
  (= (distance jaen gibraltar) 335)
  (= (distance gibraltar madrid) 662)
  (= (distance madrid gibraltar) 662)
  (= (distance gibraltar malaga) 134)
  (= (distance malaga gibraltar) 134)
  (= (distance gibraltar sevilla) 201)
  (= (distance sevilla gibraltar) 201)
  (= (distance gibraltar gibraltar) 0)

  (= (distance granada huelva) 346)
  (= (distance huelva granada) 346)
  (= (distance granada jaen) 93)
  (= (distance jaen granada) 93)
  (= (distance granada madrid) 421)
  (= (distance madrid granada) 421)
  (= (distance granada malaga) 125)
  (= (distance malaga granada) 125)
  (= (distance granada sevilla) 252)
  (= (distance sevilla granada) 252)
  (= (distance granada granada) 0)

  (= (distance huelva jaen) 347)
  (= (distance jaen huelva) 347)
  (= (distance huelva madrid) 591)
  (= (distance madrid huelva) 591)
  (= (distance huelva malaga) 301)
  (= (distance malaga huelva) 301)
  (= (distance huelva sevilla) 95)
  (= (distance sevilla huelva) 95)
  (= (distance huelva huelva) 0)

  (= (distance jaen madrid) 335)
  (= (distance madrid jaen) 335)
  (= (distance jaen malaga) 203)
  (= (distance malaga jaen) 203)
  (= (distance jaen sevilla) 246)
  (= (distance sevilla jaen) 246)
  (= (distance jaen jaen) 0)

  (= (distance madrid malaga) 532)
  (= (distance malaga madrid) 532)
  (= (distance madrid sevilla) 534)
  (= (distance sevilla madrid) 534)
  (= (distance madrid madrid) 0)
  (= (distance sevilla sevilla) 0)

  (= (distance malaga sevilla) 209)
  (= (distance malaga madrid) 209)
  (= (distance malaga malaga) 0)

  (at p1 granada)
  (at p2 granada)
  (at p3 granada)
  (at p4 granada)
  (at p5 granada)
  (at p6 granada)
  (at p7 granada)
  (at p8 granada)
  (at p9 granada)
  (at p10 gibraltar)
  (at p11 gibraltar)
  (at p12 gibraltar)
  (at p13 gibraltar)
  (at p14 gibraltar)
  (at p15 gibraltar)
  (at p16 gibraltar)
  (at p17 gibraltar)
  (at p18 gibraltar)
  (at p19 gibraltar)
  (at p20 gibraltar)



  (destino p1 madrid)
  (destino p2 madrid)
  (destino p3 madrid)
  (destino p4 madrid)
  (destino p5 madrid)
  (destino p6 madrid)
  (destino p7 madrid)
  (destino p8 madrid)
  (destino p9 madrid)
  (destino p10 sevilla)
  (destino p11 sevilla)
  (destino p12 sevilla)
  (destino p13 sevilla)
  (destino p14 sevilla)
  (destino p15 sevilla)
  (destino p16 granada)
  (destino p17 granada)
  (destino p18 granada)
  (destino p19 granada)
  (destino p20 barcelona)



  (at a1 madrid)
  (at a2 gibraltar)
  (at a3 huelva)
  (at a6 granada)
  (at a5 malaga)
  (at a4 bilbao)

  (= (fuel a1) 200)
  (= (slow-speed a1) 50)
  (= (fast-speed a1) 100)
  (= (slow-burn a1) 1)
  (= (fast-burn a1) 2)
  (= (capacity a1) 1500)
  (= (refuel-rate a1) 1)
  (= (num-pasajeros a1) 0)
  (= (limite-pasajeros a1) 25)
  (= (limite-horas a1) 10000)
  (= (tiempo-vuelo a1) 0)
  (= (fuel-limit a1) 15136)

  (= (fuel a2) 200)
  (= (slow-speed a2) 10)
  (= (fast-speed a2) 20)
  (= (slow-burn a2) 1)
  (= (fast-burn a2) 2)
  (= (capacity a2) 1500)
  (= (refuel-rate a2) 1)
  (= (num-pasajeros a2) 0)
  (= (limite-pasajeros a2) 25)
  (= (limite-horas a2) 10000)
  (= (tiempo-vuelo a2) 0)
  (= (fuel-limit a2) 15136)

  (= (fuel a3) 200)
  (= (slow-speed a3) 10)
  (= (fast-speed a3) 20)
  (= (slow-burn a3) 1)
  (= (fast-burn a3) 2)
  (= (capacity a3) 1500)
  (= (refuel-rate a3) 1)
  (= (num-pasajeros a3) 0)
  (= (limite-pasajeros a3) 25)
  (= (limite-horas a3) 10000)
  (= (tiempo-vuelo a3) 0)
  (= (fuel-limit a3) 15136)

  (= (fuel a4) 200)
  (= (slow-speed a4) 50)
  (= (fast-speed a4) 100)
  (= (slow-burn a4) 1)
  (= (fast-burn a4) 2)
  (= (capacity a4) 1500)
  (= (refuel-rate a4) 1)
  (= (num-pasajeros a4) 0)
  (= (limite-pasajeros a4) 25)
  (= (limite-horas a4) 15000)
  (= (tiempo-vuelo a4) 0)
  (= (fuel-limit a4) 15136)

  (= (fuel a5) 200)
  (= (slow-speed a5) 50)
  (= (fast-speed a5) 100)
  (= (slow-burn a5) 1)
  (= (fast-burn a5) 2)
  (= (capacity a5) 1500)
  (= (refuel-rate a5) 1)
  (= (num-pasajeros a5) 0)
  (= (limite-pasajeros a5) 25)
  (= (limite-horas a5) 15000)
  (= (tiempo-vuelo a5) 0)
  (= (fuel-limit a5) 15136)

  (= (fuel a6) 200)
  (= (slow-speed a6) 50)
  (= (fast-speed a6) 100)
  (= (slow-burn a6) 1)
  (= (fast-burn a6) 2)
  (= (capacity a6) 1500)
  (= (refuel-rate a6) 1)
  (= (num-pasajeros a6) 0)
  (= (limite-pasajeros a6) 25)
  (= (limite-horas a6) 15000)
  (= (tiempo-vuelo a6) 0)
  (= (fuel-limit a6) 15136)

  (= (total-fuel-used) 0)
  (= (boarding-time) 1)
  (= (debarking-time) 1)

)

(:tasks-goal
  :tasks(
    (transport-person p1 madrid)
    (transport-person p2 madrid)
    (transport-person p3 madrid)
    (transport-person p4 madrid)
    (transport-person p5 madrid)
    (transport-person p6 madrid)
    (transport-person p7 madrid)
    (transport-person p8 madrid)
    (transport-person p9 madrid)
    (transport-person p10 sevilla)
    (transport-person p11 sevilla)
    (transport-person p12 sevilla)
    (transport-person p13 sevilla)
    (transport-person p14 sevilla)
    (transport-person p15 sevilla)
    (transport-person p16 granada)
    (transport-person p17 granada)
    (transport-person p18 granada)
    (transport-person p19 granada)
    (transport-person p20 barcelona))
)
)
