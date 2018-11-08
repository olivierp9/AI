
cours(inf1005c).
cours(inf1500).
cours(inf1600).
cours(log1000).
cours(inf1010).
cours(inf2010).
cours(log2410).
cours(mth1007).
cours(log2990).
cours(inf1900).
cours(log2810).
cours(inf2205).



prerequis(inf1005c,inf1010).
prerequis(inf1005c,log1000).
prerequis(inf1005c,inf1600).

prerequis(inf1500,inf1600).

prerequis(log1000,log2410).
prerequis(inf1010,log2410).

prerequis(inf1010,inf2010).

prerequis(inf2010,inf2705).
prerequis(mth1007,inf2705).


corequis(log2810,inf2010).

corequis(log2990,inf2705).


corequis(inf1900,inf1600).
corequis(inf1900,log1000).
corequis(inf1900,inf2205).

ancestor(X,Y) :- prerequis(X,Y).
ancestor(X,Y) :- 
	prerequis(Z,Y),sibling(X,Z).	
ancestor(X,Y) :- 
	prerequis(Z,Y),ancestor(X,Z).	

sibling(X,Y) :- corequis(X,Y).
sibling(X,Y) :- corequis(Y,X).
sibling(X,Y) :- 
	corequis(Z,Y),sibling(X,Z),Z\==X,Z\==Y,Y\==X.
sibling(X,Y) :- 
	corequis(Z,Y),ancestor(X,Z),Z\==X,Z\==Y,Y\==X.
sibling(X,Y) :- 
	corequis(Y,Z),ancestor(X,Z),Z\==X,Z\==Y,Y\==X.
	
coursAPrendreComplet(X,L) :- setof(Y,X^(sibling(Y,X);ancestor(Y,X)),L).


