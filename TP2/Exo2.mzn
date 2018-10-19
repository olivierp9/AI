include "globals.mzn"; 

int: nbTeams;
int: color = 7;
int: maxrow = 3;


% i joue contre j a domile (i a domicile)
array[1..nbTeams,1..nbTeams] of int: pv;
array[1..nbTeams,1..nbTeams-1] of var 1..nbTeams: tournament;
array[1..nbTeams,1..nbTeams-1] of var 0..1: home_away;
array[1..nbTeams,1..nbTeams-1] of var 0..1: away_home;

constraint
    forall(i in 1..nbTeams)(
        alldifferent( [ tournament[i,j] | j in 1..nbTeams-1 ])) /\%toutes les equipes joue contre une équipe differente chaque semaine
    forall(i in 1..nbTeams)(
        forall(j in 1..nbTeams-1)(
              tournament[i,j] != i)) /\% une equipe ne joue pas contre elle meme
    forall(i in 1..nbTeams)(
        forall(j in 1..nbTeams-1)(
              tournament[tournament[i,j],j]=i))/\% symetrie des match
    forall(i in 1..nbTeams)(
        forall(j in 1..nbTeams-1)(
              home_away[i,j]=pv[i,tournament[i,j]]))/\%matrice home_away :1 quand joue home
    forall(i in 1..nbTeams)(
        forall(j in 1..nbTeams-1)(
              away_home[i,j]!=home_away[i,j]))/\%matrice away_home :1 quand joue away
    forall(i in 1..nbTeams)(
        forall(j in 1..nbTeams-4)(
              sum(k in 0..maxrow)(home_away[i,j+k])<4))/\ %pas plus de 3 match home de suite
    forall(i in 1..nbTeams)(
        forall(j in 1..nbTeams-4)(
              sum(k in 0..maxrow)(away_home[i,j+k])<4));  %pas plus de 3 match away de suite
solve satisfy;

output [ show(tournament[i,j])
            ++ (if j mod 13 == 0 then "\n" else " " endif) 
         | i in 1..nbTeams, j in 1..nbTeams-1 ];
output [ "\n\n"];
output [ show(home_away[i,j])
            ++ (if j mod 13 == 0 then "\n" else " " endif) 
         | i in 1..nbTeams, j in 1..nbTeams-1 ];