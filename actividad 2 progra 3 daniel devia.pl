conexion(vancouver,edmonton,16).
conexion(vancouver,calgary,13).
conexion(calgary,edmonton,4).
conexion(calgary,regina,14).
conexion(edmonton,saskatoon,12).
conexion(saskatoon,calgary,9).
conexion(saskatoon,winnipeg,20).
conexion(regina,saskatoon,7).
conexion(regina,winnipeg,4).

arista(X):- conexion(X,_,_); conexion(_,X,_).

haycone(X,Y):- haycone(X,Y,[]).
haycone(X,Y,_):- conexion(X,Y,_).

haycone(X,Y,Visit):- conexion(X,Z,_),
    				\+ member(Z,Visit),
    				haycone(Z,Y,[X | Visit]).

conectado(X,Y,C):- conexion(X,Y,C);conexion(Y,X,C).

costo(X, Y, C) :-
    costo(X, Y, C, []).

costo(X, Y, C, _) :-
    conexion(X, Y, C).

costo(X, Y, C, Visit) :-
    conexion(X, Z, C1),
    \+ member(Z, Visit),
    costo(Z, Y, C2, [X|Visit]),
    C is C1 + C2.

costointer(X, Y, Z, C) :-
    costo(X, Y, C1),
    costo(Y, Z, C2),
    C is C1 + C2.

