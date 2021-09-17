Predicates
	D(integer,integer,integer).
Clauses
	D(A,B,C):- D=B*B-4*A*C,
		D>0,
		!,
		X1=(-B-sqrt(D))/(2*A),
		X2=(-B+sqrt(D))/(2*A),
		write("X1=",X1, "X2=", X2).
	D(A,B,C):- D=B*B-4*A*C,
		D=0,
		!,
		X=(-B-sqrt(D))/(2*A),
		write("X=",X).
	D(A,B,C):-	write("D<0").
Goal
    write("A="),
	readint(A),
	write("B="),
	readint(B),
	write("C="),
	readint(C),
	D(A,B,C).