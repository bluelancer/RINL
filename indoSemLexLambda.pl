/*************************************************************************

    File: semLexLambda.pl
    Copyright (C) 2004,2005,2006 Patrick Blackburn & Johan Bos

    This file is part of BB1, version 1.3 (November 2006).

    BB1 is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    BB1 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with BB1; if not, write to the Free Software Foundation, Inc., 
    59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

*************************************************************************/

semLex(det,M):-
   M = [type:uni,
        sem:lam(U,lam(V,all(X,imp(app(U,X),app(V,X)))))].

semLex(det,M):-
   M = [type:indef,
        sem:lam(P,lam(Q,some(X,and(app(P,X),app(Q,X)))))].

semLex(pn,M):-
   M = [symbol:Sym,
        sem:lam(P,app(P,Sym))].

semLex(noun,M):-
   M = [symbol:Sym,
        sem:lam(X,Formula)],
   compose(Formula,Sym,[X]).

semLex(iv,M):-
   M = [symbol:Sym,
        sem:lam(X,Formula)],
   compose(Formula,Sym,[X]).

semLex(tv,M):-
   M = [symbol:Sym,
        sem:lam(K,lam(Y,app(K,lam(X,Formula))))], 
   compose(Formula,Sym,[Y,X]).

semLex(prep,M):-
   M = [symbol:Sym,
        sem:lam(K,lam(P,lam(Y,and(app(K,lam(X,F)),app(P,Y)))))],
   compose(F,Sym,[Y,X]).

semLex(coord,M):-
   M = [type:conj,
        sem:lam(X,lam(Y,lam(P,and(app(X,P),app(Y,P)))))]. 
