ask(politique) :-
	format('fait de la politique ? '),
	read(Reponse),
	Reponse = 'oui'.
ask(artiste) :-
	format('fait de l''art ? '),
	read(Reponse),
	Reponse = 'oui'.
ask(religion) :-
	format('est-ce un personnage religieux ? '),
	read(Reponse),
	Reponse = 'oui'.
ask(fiction) :-
	format('est-ce un personnage fictif ? '),
	read(Reponse),
	Reponse = 'oui'.
ask(acteur) :-
	format('Est-ce un acteur(actrice) ? '),
	read(Reponse),
	Reponse = 'oui'.
ask(auteur) :-
	format('Est-ce un auteur(e) ? '),
	read(Reponse),
	Reponse = 'oui'.
ask(chanteur) :-
	format('Est-ce un chanteur(euse) ? '),
	read(Reponse),
	Reponse = 'oui'.
ask(homme) :-
	format('Cest un homme ? '),
	read(Reponse),
	Reponse = 'oui'.
ask(acteurauteur) :-
	format('Est-ce un acteur et un auteur? '),
	read(Reponse),
	Reponse = 'oui'.
ask(francais) :-
	format('est-il francais? '),
	read(Reponse),
	Reponse = 'oui'.
ask(japonais) :-
	format('est-il japonais? '),
	read(Reponse),
	Reponse = 'oui'.
ask(americain) :-
	format('est-il americain? '),
	read(Reponse),
	Reponse = 'oui'.
ask(egypte) :-
	format('est-elle egyptienne? '),
	read(Reponse),
	Reponse = 'oui'.
ask(russe) :-
	format('est-il russe? '),
	read(Reponse),
	Reponse = 'oui'.
ask(resign) :-
	format('as-t-il demissionne de son poste? '),
	read(Reponse),
	Reponse = 'oui'.
ask(vin) :-
	format('as-t-il transforme de leau en vin? '),
	read(Reponse),
	Reponse = 'oui'.
ask(prophete) :-
	format('est-il un prophete? '),
	read(Reponse),
	Reponse = 'oui'.
ask(alive) :-
	format('est-il encore en vie? '),
	read(Reponse),
	Reponse = 'oui'.
ask(pilote) :-
	format('est-il pilote de course? '),
	read(Reponse),
	Reponse = 'oui'.
ask(espagnol):-
	format('est-il espagnol? '),
	read(Reponse),
	Reponse = 'oui'.
ask(bresilien):-
	format('est-il bresilien? '),
	read(Reponse),
	Reponse = 'oui'.
ask(georgien):-
	format('est-il d''origine georgienne? '),
	read(Reponse),
	Reponse = 'oui'.
personne(X) :- ask(politique), politique(X).
personne(X) :- ask(artiste), artiste(X).
personne(X) :- ask(religion), religion(X).
personne(X) :- ask(fiction), fictif(X).
personne(X) :- ask(pilote),course(X).

% dernier sera direct personne(X):- asdas(X) (sans ask)
politique(X):- ask(egypte), egypte(X), politicien(X).
politique(X):- ask(russe),russe(X),politicien(X).
politique(X):- ask(georgien),georgien(X),politicien(X).
politique(X):- politicien(X), americain(X), ask(americain), resign(X), ask(resign).
politique(X):- politicien(X), americain(X).

religion(X):-ask(vin),vin(X),religieux(X).
religion(X):-ask(prophete),prophete(X),religieux(X).
religion(X):-ask(alive),alive(X),religieux(X).

artiste(X) :- ask(chanteur, X), chanteurhomme(X).
chanteurhomme(X):- ask(homme, X),chanteur(X), homme(X).
chanteurhomme(X):- femme(X),chanteur(X).

artiste(X) :- ask(acteurauteur, X), acteur(X),auteur(X). % voir a la fin
artiste(X) :- ask(acteur, X), acteurhomme(X). % acteur auteur
acteurhomme(X):- ask(homme, X),acteur(X), homme(X).
acteurhomme(X):- femme(X),acteur(X).

artiste(X) :- ask(auteur, X), ask(homme), auteurhomme(X).
auteurhomme(X):- auteur(X), homme(X), francais(X), ask(francais).
auteurhomme(X):- auteur(X), homme(X) , japonais(X), ask(japonais).
auteurhomme(X):- auteur(X), homme(X), americain(X), ask(americain).
artiste(X):- auteur(X), femme(X).

artiste(X) :- dessinateur(X).
acteurauteur(X) :- auteur(X),acteur(X),ask(auteur, X).

course(X):- pilote(X), bresilien(X), ask(bresilien).
course(X):- pilote(X), espagnol(X),ask(espagnol).

fictif(X):- personnage(X),ask(homme),homme(X).
fictif(X):- personnage(X),femme(X).

personnage(mario).
personnage(lara_croft).

politicien(mikhail_gorbachev).
politicien(dwight_d_eisenhower).
politicien(cleopatre).
politicien(richard_nixon).
politicien(joseph_stalin).

gouverne(mikhail_gorbachev,russie).
gouverne(dwight_d_eisenhower,usa).
gouverne(cleopatre,egypte).
gouverne(richard_nixon,usa).

dessinateur(banksy).

chanteur(michael_jackson).
chanteur(lady_gaga).

acteur(denzel_washington).
acteur(jennifer_lawrence).
acteur(quentin_tarantino).

auteur(quentin_tarantino).
auteur(victor_hugo).
auteur(hideo_kojima).
auteur(jk_rowling).

homme(denzel_washington).
homme(michael_jackson).
homme(hideo_kojima).
homme(victor_hugo).
homme(mario).
homme(quentin_tarantino).

femme(jk_rowling).
femme(jennifer_lawrence).
femme(lady_gaga).
femme(lara_croft).
francais(victor_hugo).
japonais(hideo_kojima).
americain(quentin_tarantino).
americain(richard_nixon).
americain(dwight_d_eisenhower).
egypte(cleopatre).
russe(mikhail_gorbachev).
georgien(joseph_stalin).
bresilien(ayrton_senna).
espagnol(fernando_alonso).

resign(richard_nixon).

pilote(ayrton_senna).
pilote(fernando_alonso).

religieux(jesus).
religieux(moise).
religieux(pape_francois).

vin(jesus).
prophete(moise).
alive(pape_francois).
