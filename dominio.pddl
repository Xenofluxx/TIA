


;DOMINIO
(define (domain agencia-transporte)


;acciones durativas,predicados con tipo,funciones num�ricas
(:requirements :durative-actions :typing :fluents)

;OBJETOS
(:types pedido vehiculo zona - object)


;PREDICADOS, BOOLEAN!!!!!!!!!
(:predicates 
	     (at ?vehiculo - vehiculo ?zona - zona)
             (in ?p - pedido ?vehiculo - vehiculo)
	     (pedido-en ?p - pedido ?zona - zona)
	     (no-zle ?zona - zona)
	     (intercambio ?zona -zona)
	     (electrico ?vehiculo - vehiculo)
	     (combustion ?vehiculo - vehiculo))


;FUNCIONES, NUM�RICAS!!!!!!!!
(:functions 

 

;distancia entre zonas	
            (distance ?zona1 ?zona2 - zona)

;presupuesto de la empresa
 	    (presupuesto)

;cantidad del incremento al comprar derechos
	    (incremento-en-euros)

;dinero extra que se ha gastado para mover veh�culos combustible, se le sumar�a (incremento-en-euros)
	    (total-dinero-extra)

;total distancia que se puede recorrer por veh�culos combustible, se le sumar� (incremento-en-euros)
	    (total-distancia-recorrible-por-combustibles)

)


;acciones

(:durative-action transportC
 :parameters (?vehiculo - vehiculo ?zona1 ?zona2 - zona )
 :duration (= ?duration  (/( distance ?zona1 ?zona2)4)  )
 :condition (and (at start (at ?vehiculo ?zona1))
	         (over all (combustion ?vehiculo))
		 (over all (no-zle ?zona1))
	         (over all (no-zle ?zona2))
	         (over all (<= (distance ?zona1 ?zona2)  (total-distancia-recorrible-por-combustibles)))
	    )

 :effect (and (at start (not (at ?vehiculo ?zona1)))
	      (at end (at ?vehiculo ?zona2))
	      (at end (decrease (total-distancia-recorrible-por-combustibles) (distance ?zona1 ?zona2)))      )
) 


(:durative-action transportE
 :parameters (?vehiculo - vehiculo ?zona1 ?zona2 - zona )
 :duration (= ?duration ( distance ?zona1 ?zona2))
 :condition (and(at start (at ?vehiculo ?zona1)) 
	         (over all (electrico ?vehiculo)))
 :effect (and (at start (not (at ?vehiculo ?zona1)))
	      (at end (at ?vehiculo ?zona2))))


(:durative-action incrementar
 :parameters ()
 :duration ( = ?duration 1)
 :condition (and (over all(<= (incremento-en-euros) presupuesto)) 
		 (over all (> presupuesto -100) )
)
 

 :effect (and (at start(decrease (presupuesto) incremento-en-euros)) 
	      
	      (at end(increase  (total-distancia-recorrible-por-combustibles) incremento-en-euros) )
	      (at end(increase  (total-dinero-extra) incremento-en-euros) ) 
	       

)
)


(:durative-action recoger
 :parameters (?pedido - pedido ?vehiculo - vehiculo ?zona - zona)
 :duration (= ?duration 1)
 :condition (and (at start(pedido-en ?pedido ?zona))  (over all(at ?vehiculo ?zona)) )
 :effect (and (at start(not (pedido-en ?pedido ?zona)))
	      (at end(in ?pedido ?vehiculo))   
)
)



(:durative-action entregar
 :parameters (?pedido - pedido ?vehiculo - vehiculo ?zona - zona)
 :duration (= ?duration 2)
 :condition (and (at start(in ?pedido ?vehiculo)) 
	         (over all(at ?vehiculo ?zona)) )
 :effect (and (at start(not (in ?pedido ?vehiculo))) 
	      (at end(pedido-en ?pedido ?zona))   )
)

(:durative-action intercambiar
 :parameters (?pedido - pedido ?vehiculo1 ?vehiculo2 - vehiculo ?zona - zona)
 :duration (= ?duration 3)
 :condition (and (over all(at ?vehiculo1  ?zona)) 
                 (over all(at ?vehiculo2 ?zona))
		 (at start(in ?pedido ?vehiculo1)) )
 :effect (and (at start(not (in ?pedido ?vehiculo1))) 
	      (at end(in ?pedido ?vehiculo2))  
)
)
)


