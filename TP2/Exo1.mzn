% Use this editor as a MiniZinc scratch book
% use_module(library(clpfd)) -- n'oubliez pas d'utiliser ce module.

include "globals.mzn"; 

var int: Rouge;
var int: Vert;
var int: Bleu;
var int: Blanc;
var int: Jaune;

var int: Anglais;
var int: Ukrainien;
var int: Espagnol;
var int: Japonais;
var int: Norvegien;

var int: The;
var int: Cafe;
var int: Lait;
var int: JusOrange;
var int: Eau;

var int: Acrobate;
var int: Sculpteur;
var int: Diplomate;
var int: Medecin;
var int: Violiniste;

var int: Chien;
var int: Escargots;
var int: Renard;
var int: Cheval;
var int: Zebre;

array[1..5] of var 1..5: Couleurs;
array[1..5] of var 1..5: Nationalites;
array[1..5] of var 1..5: Animaux;
array[1..5] of var 1..5: Boissons;
array[1..5] of var 1..5: Metiers;

solve satisfy;

constraint


   inverse(Couleurs,[Rouge,Vert, Bleu, Blanc,Jaune]) /\
   inverse(Nationalites, [Anglais, Ukrainien, Espagnol, Japonais, Norvegien]) /\
   inverse(Animaux, [Chien, Renard, Escargots, Cheval, Zebre]) /\
   inverse(Boissons, [The, Cafe, Lait, JusOrange, Eau]) /\
   inverse(Metiers, [Acrobate, Sculpteur, Diplomate, Medecin, Violiniste]) /\

    all_different(Nationalites)/\
    all_different(Couleurs)/\
    all_different(Boissons)/\
    all_different(Metiers)/\
    all_different(Animaux)/\

    Anglais = Rouge/\ % Hint 1
    Espagnol = Chien/\ % Hint 2
    Vert = Cafe /\ % Hint 3
    Ukrainien = The /\% Hint 4
    Vert = Blanc + 1/\% Hint 5
    Sculpteur = Escargots/\% Hint 7
    Jaune = Diplomate/\% Hint 7,
    Lait = 3/\ %Hint 11
    Norvegien  = 1/\ % Hint 8
    abs(Medecin - Renard) = 1/\ %Hint 9
    abs(Cheval- Diplomate) = 1/\ % Hint 10
    Violiniste = JusOrange/\ %Hint 13
    Japonais = Acrobate/\ %Hint 12
    abs(Norvegien - Bleu) = 1 %Hint 14
;
output 
[
"Zebre: ",
show(Zebre),
"\nEau: ",
show(Eau),
"\nAnglais: ",
show(Anglais),
"\nUkrainien: ",
show(Ukrainien),
"\nEspagnol: ",
show(Espagnol),
"\nNorvegien: ",
show(Norvegien),
"\nJaponais: ",
show(Japonais)
]
;