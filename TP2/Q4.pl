ask(politique, X) :-
	format('~w politique ? ', [X]),
	read(Reponse),
	Reponse = 'oui'.
ask(artiste, X) :-
	format('~w art ? ', [X]),
	read(Reponse),
	Reponse = 'oui'.
ask(gouverne, Y) :-
	format('~w gouverne ? ', [Y]),
	read(Reponse),
	Reponse = 'oui'.
ask(acteur, X) :-
	format('~w est un acteur ? ', [X]),
	read(Reponse),
	Reponse = 'oui'.
ask(auteur, X) :-
	format('~w est un auteur ? ', [X]),
	read(Reponse),
	Reponse = 'oui'.
ask(chanteur, X) :-
	format('~w est un chanteur ? ', [X]),
	read(Reponse),
	Reponse = 'oui'.
ask(homme, X) :-
	format('~w est un homme ? ', [X]),
	read(Reponse),
	Reponse = 'oui'.
ask(acteurauteur, X) :-
	format('~w est un acteur et un auteur? ', [X]),
	read(Reponse),
	Reponse = 'oui'.
ask(video, X) :-
	format('~w est un jeuvideo? ', [X]),
	read(Reponse),
	Reponse = 'oui'.

personne(X) :- ask(politique,X), politicien(X).
personne(X) :- ask(artiste, X), artiste(X).
personne(X) :- ask(religion, X), artiste(X).
personne(X) :- ask(personnage, X), artiste(X).

% dernier sera direct personne(X):- asdas(X) (sans ask)

artiste(X) :- ask(chanteur, X), chanteurhomme(X).
chanteurhomme(X):- ask(homme, X),chanteur(X), homme(X).
chanteurhomme(X):- femme(X),chanteur(X).

artiste(X) :- ask(acteurauteur, X), acteur(X),auteur(X). % voir a la fin
artiste(X) :- ask(acteur, X), acteurhomme(X). % acteur auteur
acteurhomme(X):- ask(homme, X),acteur(X), homme(X).
acteurhomme(X):- femme(X),acteur(X).

artiste(X) :- ask(auteur, X), auteurhomme(X).
auteurhomme(X):- ask(homme, X),jeuvideo(X).
auteurhomme(X):- auteur(X), femme(X).
jeuvideo(X) :- ask(video, X), auteur(X),homme(X),video(X).
jeuvideo(X) :- auteur(X),homme(X),\+video(X).

artiste(X) :- dessinateur(X).
acteurauteur(X) :- auteur(X),acteur(X),ask(auteur, X).

politicien(X) :- gouverne(X, Y), pays(Y), ask(gouverne, Y).

origine(X) :- naissance(X, Y), pays(Y), ask(naissance, Y).

pays(usa).
pays(russie).
pays(japon).
pays(angleterre).
pays(italie).
pays(egypte).
pays(bresil).
pays(espagne).
pays(argentine).

dessinateur(banksy).

chanteur(michael_jackson).
homme(michael_jackson).

chanteur(lady_gaga).
acteur(denzel_washington).
acteur(jennifer_lawrence).
acteur(quentin_tanrantino).
auteur(quentin_tanrantino).
auteur(victor_hugo).
auteur(hideo_kojima).
auteur(jk_rowling).
homme(denzel_washington).
homme(hideo_kojima).
homme(victor_hugo).
femme(jk_rowling).
femme(jennifer_lawrence).
femme(lady_gaga).
video(hideo_kojima).
