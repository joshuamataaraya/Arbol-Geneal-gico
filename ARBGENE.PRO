/*  
Instituto Tecnologico de Costa Rica
Escuela de Computacion
Ingenieria en Computacion
Lenguajes de Programacion
Joshua Mata Araya
2014079095


Este programa realiza consultas sobre un arbol genealogico

 */
domains
	persona=symbol
	dia=integer
	mes=integer
	anio=integer
	
predicates
	pom(persona,persona)	
	par(persona,persona,dia,mes,anio)
	split(persona,persona,dia,mes,anio)
	nac(pesona,symbol,dia,mes,anio)	
clauses
	pom(jonathan,joshua)
	pom(francinie,joshua)
	pom(edith,francinie)
	pom(eduardo,francinie)	
	
	