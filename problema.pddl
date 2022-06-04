
(define (problem agencia-transporte)(:domain agencia-transporte)


(:objects
	p1 p2 p3 p4 p5 - pedido
	v1 v2 v3 v4 - vehiculo
	A B C D E F - zona
)

(:init
	(= (distance A A) 0)
	(= (distance A B) 4)
	(= (distance A C) 6)
	(= (distance A D) 10)
	(= (distance A E) 52)
	(= (distance A F) 100)
	
	(= (distance B A) 4)
	(= (distance B B) 0)
	(= (distance B C) 4)
	(= (distance B D) 16)
	(= (distance B E) 20)
	(= (distance B F) 40)
	
	(= (distance C A) 6)
	(= (distance C B) 4)
	(= (distance C C) 0)
	(= (distance C D) 28)
	(= (distance C E) 55)
	(= (distance C F) 30)

	(= (distance D A) 10)
	(= (distance D B) 16)
	(= (distance D C) 28)
	(= (distance D D) 0)
	(= (distance D E) 30)
	(= (distance D F) 10)

	(= (distance E A) 52)
	(= (distance E B) 20)
	(= (distance E C) 55)
	(= (distance E D) 30)
	(= (distance E E) 0)
	(= (distance E F) 160)

	(= (distance F A) 100)
	(= (distance F B) 40)
	(= (distance F C) 30)
	(= (distance F D) 10)
	(= (distance F E) 160)
	(= (distance F F) 0)



; PRESUPUESTO
	
	(= (presupuesto) 40)

; PRECIO COMPAR DERECHOS

         (= (incremento-en-euros) 20)

; ORIGEN PEDIDOS

	(pedido-en p1 A)
	(pedido-en p2 B)
	(pedido-en p3 F)
	(pedido-en p4 D)
	(pedido-en p5 E)

; LOCALIZACIÓON VEHÍICULO
 	(at v1 C)
	(at v2 C)
	(at v3 B)
	(at v4 B)

; TIPO VEHÍCULO

 	(combustion v1)
	(combustion v2)
	(electrico v3)
	(electrico v4)

; ZONA INTERCAMBIO

	(intercambio C)
	(intercambio D)
	(intercambio E)

; DISTANCIA RECORRIBLE POR COMBUSTIBLES

	(=(total-distancia-recorrible-por-combustibles)70)

; zona no-zle
	(no-zle C)
	(no-zle D)
	(no-zle E)
	(no-zle F)




)

; OBJETIVO (DESTINO PEDIDOS)
	
(:goal (and
	(pedido-en p1 F)
	(pedido-en p2 E)
	(pedido-en p3 D)
	(pedido-en p4 E)
	(pedido-en p5 A)
))

(:metric minimize (+ (* 0.8 (total-time)) (* 0.2 (total-dinero-extra))))
)




