define(problem Problema1)
	 (:domain Ejercicio1)
	 (:objects
		z1 - zona
		z3 - zona
		z6 - zona
		z2 - zona
		z4 - zona
		z5 - zona
		z7 - zona
		bruja1-Bruja
		oro1-oro
		player1-Player
		manzana1-Manzana
		oscar1-Oscar
		princesa1-Princesa
	 )
	 (:init
		 (or-sig-iz norte oeste)
		 (or-sig-iz oeste sur)
		 (or-sig-iz sur este)
		 (or-sig-iz este norte)
		 (or-sig-der norte este)
		 (or-sig-der este sur)
		 (or-sig-der sur oeste)
		 (or-sig-der oeste norte)
		 (= (distancia-total) 0)
		 (orientado player1 sur)
		 (conectadas z1 10 sur)
		 (conectadas 10 z1 norte)
		 (= (distancia z1 z3) 10)
		 (= (distancia z3 z1) 10)
		 (conectadas z3 5 sur)
		 (conectadas 5 z3 norte)
		 (= (distancia z3 z6) 5)
		 (= (distancia z6 z3) 5)
		 (conectadas z2 10 este)
		 (conectadas 10 z2 oeste)
		 (= (distancia z2 z3) 10)
		 (= (distancia z3 z2) 10)
		 (conectadas z3 5 este)
		 (conectadas 5 z3 oeste)
		 (= (distancia z3 z4) 5)
		 (= (distancia z4 z3) 5)
		 (conectadas z5 10 este)
		 (conectadas 10 z5 oeste)
		 (= (distancia z5 z6) 10)
		 (= (distancia z6 z5) 10)
		 (conectadas z6 5 este)
		 (conectadas 5 z6 oeste)
		 (= (distancia z6 z7) 5)
		 (= (distancia z7 z6) 5)
		 (en bruja1 z1)
		 (en oro1 z3)
		 (en player1 z2)
		 (en manzana1 z4)
		 (en oscar1 z5)
		 (en princesa1 z7)
	 )
	 (:goal (and
		 (tiene-objeto bruja1)
		 (tiene-objeto oro1)
		 (tiene-objeto manzana1)
		 (tiene-objeto oscar1)
		 (tiene-objeto princesa1)
		 (<= (distancia-total) 126)
	     )
	)
)