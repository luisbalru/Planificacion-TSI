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
		 (orientado player1 sur)
		 (conectadas z1 z3 sur)
		 (conectadas z3 z1 norte)
		 (conectadas z3 z6 sur)
		 (conectadas z6 z3 norte)
		 (conectadas z2 z3 este)
		 (conectadas z3 z2 oeste)
		 (conectadas z3 z4 este)
		 (conectadas z4 z3 oeste)
		 (conectadas z5 z6 este)
		 (conectadas z6 z5 oeste)
		 (conectadas z6 z7 este)
		 (conectadas z7 z6 oeste)
		 (en bruja1 z1)
		 (en player1 z2)
		 (en manzana1 z4)
		 (en oscar1 z5)
		 (en princesa1 z7)
	 )
	 (:goal (and
		 (tiene-objeto bruja1)
		 (tiene-objeto manzana1)
		 (tiene-objeto oscar1)
		 (tiene-objeto princesa1)
	     )
	)
)