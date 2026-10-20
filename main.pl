%hombre(martin).
%mujer(rosa).
%progenitor(martin, luis).   % martin es padre o madre de luis

%HECHOS
hombre(arthur).
hombre(henry).
hombre(charles).
hombre(thomas).
hombre(robert).
hombre(david).
hombre(james).
hombre(edward).
hombre(george).
hombre(liam).
hombre(oliver).

mujer(eleanor).
mujer(beatrice).
mujer(isabel).
mujer(florence).
mujer(grace).
mujer(margareth).
mujer(sarah).
mujer(clara).
mujer(elizabeth).
mujer(sophia).

progenitor(arthur, henry).
progenitor(eleanor, henry).
progenitor(charles, isabel).
progenitor(beatrice, isabel).
progenitor(henry, thomas).
progenitor(henry, robert).
progenitor(isabel, thomas).
progenitor(isabel, robert).
progenitor(david, james).
progenitor(florence, james).
progenitor(edward, margareth).
progenitor(grace, margareth).
progenitor(james, elizabeth).
progenitor(james, george).
progenitor(margareth, elizabeth).
progenitor(margareth, george).
progenitor(robert, liam).
progenitor(elizabeth, liam).
progenitor(thomas, oliver).
progenitor(clara, oliver).
progenitor(george, sophia).
progenitor(sarah, sophia).


%Reglas_AND
padre(X, Y) :- progenitor(X, Y), hombre(X).
madre(X, Y) :- progenitor(X, Y), mujer(X).
hijo(Y, X) :- progenitor(X, Y), hombre(Y).
hija(Y, X) :- progenitor(X, Y), mujer(Y).
abuelo(X, Z) :- progenitor(X, Y), progenitor(Y, Z), hombre(X).
abuela(X, Z) :- progenitor(X, Y), progenitor(Y, Z), mujer(X).
hermano(Y, Z) :- progenitor(X, Y), progenitor(X, Z), hombre(Y), Y \= Z.
hermana(Y, Z) :- progenitor(X, Y), progenitor(X, Z), mujer(Y), Y \= Z.
%Reglas_compuestas_y_OR
tio(X, Z) :- (hermano(X, Y); hermana(X, Y)), progenitor(Y, Z), hombre(X).
tia(X, Z) :- (hermano(X, Y); hermana(X, Y)), progenitor(Y, Z), mujer(X).
primo(Y, Z) :- progenitor(X, Y), (hermano(X, W); hermana(X, W)), progenitor(W, Z), hombre(Y).
prima(Y, Z) :- progenitor(X, Y), (hermano(X, W); hermana(X, W)), progenitor(W, Z), mujer(Y).
familiar(X, Y) :- progenitor(X, Y); (hijo(X, Y); hija(X, Y)); (abuelo(X, Y); abuela(X, Y)); (hermano(X, Y); hermana(X, Y)); (tio(X, Y); tia(X, Y)); (primo(X, Y); prima(X, Y)).
%Reglas_compuestas_y_recursion
ancestro(X, Y) :- progenitor(X, Y).
ancestro(X, Y) :- progenitor(X, Z), ancestro(Z, Y).
descendiente(X, Y) :- hijo(X, Y); hija(X, Y).
descendiente(X, Y) :- (hijo(X, Z); hija(X, Z)), descendiente(Z, Y).
