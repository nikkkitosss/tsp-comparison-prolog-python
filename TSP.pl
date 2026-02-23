% Факти: відстані між містами​
distance(a, b, 10).​
distance(a, c, 15).​
distance(a, d, 20).​
distance(b, c, 35).​
distance(b, d, 25).​
distance(c, d, 30).

% Симетричність відстаней​
dist(X, Y, D) :- ​
distance(X, Y, D).​
dist(X, Y, D) :- ​
distance(Y, X, D).​

% Nearest Neighbor для TSP​
tsp_nn(Start, Cities, Path, Dist) :-​
  nn([Start], Cities, Path, 0, Dist).​
​

% Базовий випадок: всі міста відвідано​
nn(Path, [], FinalPath, Acc, Total) :-​
  reverse(Path, [Last|_]),​
  reverse(Path, [_|Rest]),​
  reverse(Rest, [First|_]),​
  dist(Last, First, RetDist),​
  Total is Acc + RetDist,​
  FinalPath = Path.​
​

% Рекурсивний крок​
nn([Curr|Rest], Remaining, Path, Acc, Total) :-​
  find_nearest(Curr, Remaining, Next, D),​
  delete(Remaining, Next, NewRem),​
  NewAcc is Acc + D,​
  nn([Next,Curr|Rest], NewRem, Path, NewAcc, Total).​
​

% Пошук найближчого міста​
find_nearest(Curr, [City], City, D) :- dist(Curr, City, D).​
​

find_nearest(Curr, [City1, City2 | Rest], Nearest, MinD) :-​
    find_nearest(Curr, [City2 | Rest], N1, D1),​
    dist(Curr, City1, D2),​
    (D2 < D1 -> (Nearest = City1, MinD = D2) ; (Nearest = N1, MinD = D1)).​
​