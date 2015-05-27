/*************************************************************************

    File: semRulesLambda.pl
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

/*========================================================================
   Semantic Rules
========================================================================*/

combine(t:Converted,[s:Sem]):- 
   betaConvert(Sem,Converted).

combine(t:Converted,[q:Sem]):- 
   betaConvert(Sem,Converted).

combine(s:app(A,B),[np:A,vp:B]).

combine(np:app(app(B,A),C),[np:A,coord:B,np:C]).
combine(np:app(A,B),[det:A,n:B]).
combine(np:A,[pn:A]).
%% combine(np:lam(P,app(A,app(B,P))),[np:A,pp:B]). %% tambahan

combine(n:app(app(B,A),C),[n:A,coord:B,n:C]).
combine(n:A,[noun:A]).
%% combine(n:app(B,A),[noun:A,nmod:B]).

%% combine(nmod:A,[pp:A]).
%% combine(nmod:lam(P,app(A,app(B,P))),[pp:A,nmod:B]).

combine(vp:app(app(B,A),C),[vp:A,coord:B,vp:C]).
combine(vp:A,[iv:A]).
combine(vp:app(A,B),[tv:A,np:B]).

%% combine(vp:app(A,B),[vp:A,pp:B]).
%% combine(vp:A,[iv:A,np:B]). %% tambahan
combine(vp:app(B,A),[iv:A,pp:B]).


combine(pp:app(A,B),[prep:A,np:B]).