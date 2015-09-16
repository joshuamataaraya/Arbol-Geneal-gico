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
	sexo=symbol
predicates
	pom(persona,persona)	
	par(persona,persona,dia,mes,anio)
/*	split(persona,persona,dia,mes,anio) */
	nac(persona,sexo,dia,mes,anio)	


	/* ------------------*/
	padre(persona,persona)
	madre(persona,persona) 
	padreN(persona,persona)
	
	hijo(persona,persona)
	hija(persona,persona)
	hijoN(persona,persona)

	abuelo(persona,persona)
	abuela(persona,persona)
	abueloN(persona,persona)
	abueloPaterno(persona,persona)
	abuelaPaterno(persona,persona)
	abueloNPaterno(persona,persona)
	abueloMaterno(persona,persona)
	abuelaMaterno(persona,persona)
	abueloNMaterno(persona,persona)
	
	nieto(persona,persona)
	nieta(persona,persona)
	nietoN(persona,persona)
	
	hermano(persona,persona)
	hermana(persona,persona)
	hermanoN(persona,persona)
	
	mayor (persona,persona)
	
	hermanoMayor(persona,persona)
	hermanaMayor(persona,persona)
	hermanoNMayor(persona,persona)
	
	hermanoMenor(persona,persona)
	hermanaMenor(persona,persona)
	hermanoNMenor(persona,persona)
	
	tio(persona,persona)
	tia(persona,persona)
	tioN(persona,persona) 
	
	tioPaterno(persona,persona)
	tiaPaterno(persona,persona)
	tioNPaterno(persona,persona) 
	
	tioMaterno(persona,persona)
	tiaMaterno(persona,persona)
	tioNMaterno(persona,persona) 
	
clauses
	tioMaterno(X,Y):-
		madre(Z,Y),
		hermano(X,Z).
	tiaMaterno(X,Y):-
		madre(Z,Y),
		hermana(X,Z).
	tioNMaterno(X,Y):-
		madre(Z,Y),
		hermanoN(X,Z).
	
	tioPaterno(X,Y):-
		padre(Z,Y),
		hermano(X,Z).
	tiaPaterno(X,Y):-
		padre(Z,Y),
		hermana(X,Z).
	tioNPaterno(X,Y):-
		padre(Z,Y),
		hermanoN(X,Z).
	
	tio(X,Y):-
		pom(Z,Y),
		hermano(X,Z).
	tia(X,Y):-
		pom(Z,Y),
		hermana(X,Z).
	tioN(X,Y):-
		pom(Z,Y),
		hermanoN(X,Z).
		
	hermanoMenor(X,Y):-
		pom(Z,X),
		pom(W,X),
		pom(Z,Y),
		pom(W,Y),
		X<>Y,
		par(Z,W,_,_,_),
		nac(X,S,_,_,_),
		M=mujer,S<>M,
		mayor(Y,X).
	hermanaMenor(X,Y):-
		pom(Z,X),
		pom(W,X),
		pom(Z,Y),
		pom(W,Y),
		par(Z,W,_,_,_),
		X<>Y,
		nac(X,S,_,_,_),
		M=hombre,S<>M,
		mayor(Y,X).
	hermanoNMenor(X,Y):-
		pom(Z,X),
		pom(W,X),
		pom(Z,Y),
		pom(W,Y),
		par(Z,W,_,_,_),
		X<>Y,
		mayor(Y,X).
	hermanoMayor(X,Y):-
		pom(Z,X),
		pom(W,X),
		pom(Z,Y),
		pom(W,Y),
		X<>Y,
		par(Z,W,_,_,_),
		nac(X,S,_,_,_),
		M=mujer,S<>M,
		mayor(X,Y).
	hermanaMayor(X,Y):-
		pom(Z,X),
		pom(W,X),
		pom(Z,Y),
		pom(W,Y),
		par(Z,W,_,_,_),
		X<>Y,
		nac(X,S,_,_,_),
		M=hombre,S<>M,
		mayor(X,Y).
	hermanoNMayor(X,Y):-
		pom(Z,X),
		pom(W,X),
		pom(Z,Y),
		pom(W,Y),
		par(Z,W,_,_,_),
		X<>Y,
		mayor(X,Y).
	
	mayor(X,Y):- 
		nac(X,_,D,M,A),
		nac(Y,_,DD,MM,AA),
		Edadx=(A*365)+(M*30.41)+D,
		Edady=(AA*365)+(MM*30.41)+DD,
		Edadx < Edady.
	
	hermano(X,Y):-
		pom(Z,X),
		pom(W,X),
		pom(Z,Y),
		pom(W,Y),
		X<>Y,
		par(Z,W,_,_,_),
		nac(X,S,_,_,_),
		M=mujer,S<>M.
	hermana(X,Y):-
		pom(Z,X),
		pom(W,X),
		pom(Z,Y),
		pom(W,Y),
		par(Z,W,_,_,_),
		X<>Y,
		nac(X,S,_,_,_),
		M=hombre,S<>M.
	hermanoN(X,Y):-
		pom(Z,X),
		pom(W,X),
		pom(Z,Y),
		pom(W,Y),
		par(Z,W,_,_,_),
		X<>Y.	
	
			
	nieto(Y,X):- 
		pom(X,Z),
		pom(Z,Y),
		nac(Y,S,_,_,_),
		M=mujer,S<>M.
	nieta(Y,X):-
		pom(X,Z),
		pom(Z,Y),
		nac(Y,S,_,_,_),
		M=hombre,S<>M.
	nietoN(Y,X):-
		pom(X,Z),
		pom(Z,Y).
	
	abuelo(X,Y):- 
		pom(X,Z),
		pom(Z,Y),
		nac(X,S,_,_,_),
		M=mujer,S<>M.
	abuela(X,Y):-
		pom(X,Z),
		pom(Z,Y),
		nac(X,S,_,_,_),
		M=hombre,S<>M.
	abueloN(X,Y):-
		pom(X,Z),
		pom(Z,Y).
	abueloPaterno(X,Y):- 
		pom(X,Z),
		padre(Z,Y),nac(X,S,_,_,_),
		M=mujer,S<>M.
	abuelaPaterno(X,Y):-
		pom(X,Z),
		padre(Z,Y),
		nac(X,S,_,_,_),M=hombre,S<>M.
	abueloNPaterno(X,Y):-
		pom(X,Z),
		padre(Z,Y).

	abueloMaterno(X,Y):- 
		pom(X,Z),
		madre(Z,Y),nac(X,S,_,_,_),
		M=mujer,S<>M.
	abuelaMaterno(X,Y):-
		pom(X,Z),
		madre(Z,Y),
		nac(X,S,_,_,_),M=hombre,S<>M.
	abueloNMaterno(X,Y):-
		pom(X,Z),
		madre(Z,Y).
	
	hijo(X,Y):- pom(Y,X), nac(X,S,_,_,_),M=mujer,S<>M.
	hija(X,Y):- pom(Y,X),nac(X,S,_,_,_),H=hombre,S<>H.
	hijoN(X,Y):- pom(Y,X).
	
	padre(Y,X):- pom(Y,X), nac(Y,S,_,_,_),M=mujer,S<>M.
	madre(Y,X):- pom(Y,X),nac(Y,S,_,_,_),H=hombre,S<>H.
	padreN(Y,X):- pom(Y,X).
	
	
	
	
/*-------------------------------------------
	BASE DE DATOS
  -----------------------------------------*/
	
	pom(jonathan,joshua).
	pom(francinie,joshua).
	pom(jonathan,alison).
	pom(francinie,alison).
	
	pom(wilbert,jonathan).
	pom(ligia,jonathan).
	pom(wilbert,will).
	pom(ligia,will).
	pom(wilbert,hasell).
	pom(ligia,hasell).
	pom(wilbert,kattia).
	pom(ligia,kattia).
	
	pom(edith,francinie).
	pom(eduardo,francinie).	
	pom(edith,jairo).
	pom(eduardo,jairo).
	pom(edith,junior).
	pom(eduardo,junior).
	pom(edith,randall).
	pom(eduardo,randall).
	
	pom(antonio,wilbert).
	pom(gladis,wilbert).
	pom(antonio,noel).
	pom(gladis,noel).
	
	pom(noel,noelia).
	pom(mary,noelia).
	pom(noel,ruth).
	pom(mary,ruth).
	
	pom(will,cecile).
	pom(will,veyda).
	pom(naylene,cecile).
	pom(naylene,veyda).
	
	par(jonathan,francinie,6,12,1996).
	par(will,naylene,4,7,2006).
	par(wilbert,ligia,1,1,1965).
	par(gladis,antonio,1,1,1932).
	par(noel,mary,1,1,1970).
	par(eduardo,edith,1,1,1965).
	par(jairo,ania,21,1,2006).
	
	nac(joshua,hombre,13,6,1996).
	nac(jonathan,hombre,26,8,1978).
	nac(francinie,mujer,23,5,1978).
	nac(alison,mujer,4,1,2001).	
	nac(junior,hombre,16,11,1972).
	nac(randall,hombre,9,11,1968).
	nac(jairo,hombre,25,12,1979).
	nac(kattia,mujer,2,7,1968).
	nac(hasell,mujer,26,1,1976).
	nac(will,hombre,23,8,1977).
	nac(wilbert,hombre,23,3,1952).
	nac(eduardo,hombre,1,1,1948).
	nac(edith,mujer,1,1,1948).
	nac(ligia,mujer,13,3,1951).
	nac(noel,hombre,17,3,1950).
	nac(ania,mujer,6,7,1981).
	nac(naylene,mujer,1,30,1984).
	nac(cecile,mujer,8,7,2015).
	nac(veyda,mujer,23,2,2013).