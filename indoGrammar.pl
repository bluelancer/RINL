/*************************************************************************

    File: englishGrammar.pl
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
   Texts
========================================================================*/

t([sem:T])--> 
   s([coord:no,sem:S]),
   {combine(t:T,[s:S])}.

t([sem:T])--> 
   s([coord:yes,sem:S]),
   {combine(t:T,[s:S])}.

/*========================================================================
   Sentences
========================================================================*/

s([coord:no,sem:Sem])--> 
   np([coord:_,gap:[],sem:NP]), 
   vp([coord:_,gap:[],sem:VP]), 
   {combine(s:Sem,[np:NP,vp:VP])}.

/*========================================================================
   Noun Phrases
========================================================================*/

%% np([coord:no,gap:[np:NP],sem:NP])--> [].

%% NP dan NP
np([coord:yes,gap:[],sem:NP])--> 
   np([coord:no,gap:[],sem:NP1]), 
   coord([type:conj,sem:C]), 
   np([coord:_,gap:[],sem:NP2]), 
   {combine(np:NP,[np:NP1,coord:C,np:NP2])}.

% NP -> Det N
np([coord:no,gap:[],sem:NP])--> 
   det([type:_,sem:Det]), 
   n([coord:_,sem:N]), 
   {combine(np:NP,[det:Det,n:N])}.

% NP -> PN
np([coord:no,gap:[],sem:NP])--> 
   pn([sem:PN]), 
   {combine(np:NP,[pn:PN])}.

%% todo: NP PP

/*========================================================================
   Nouns
========================================================================*/

n([coord:yes,sem:N])--> 
   n([coord:no,sem:N1]), 
   coord([type:_,sem:C]),  
   n([coord:_,sem:N2]),
   {combine(n:N,[n:N1,coord:C,n:N2])}.

n([coord:no,sem:N])--> 
   noun([sem:Noun]),
   {combine(n:N,[noun:Noun])}.

n([coord:no,sem:Sem])--> 
   noun([sem:N]), 
   nmod([sem:PP]),
   {combine(n:Sem,[noun:N,nmod:PP])}. 

nmod([sem:N])--> 
   pp([sem:PP]),
   {combine(nmod:N,[pp:PP])}.

nmod([sem:Sem])--> 
   pp([sem:PP]), 
   nmod([sem:NMod]),
   {combine(nmod:Sem,[pp:PP,nmod:NMod])}.


/*========================================================================
   Verb Phrases
========================================================================*/

%% VP -> VP dan VP
vp([coord:yes,gap:[],sem:VP])--> 
   vp([coord:no,gap:[],sem:VP1]), 
   coord([type:conj,sem:C]), 
   vp([coord:_,gap:[],sem:VP2]),
   {combine(vp:VP,[vp:VP1,coord:C,vp:VP2])}.

%%  VP -> IV
vp([coord:no,gap:[],sem:VP])--> 
   iv([sem:IV]), 
   {combine(vp:VP,[iv:IV])}.

%%  VP -> TV NP
vp([coord:no,gap:G,sem:VP])-->   
   tv([sem:TV]), 
   np([coord:_,gap:G,sem:NP]), 
   {combine(vp:VP,[tv:TV,np:NP])}.

%%  todo: VP -> VP PP

/*========================================================================
   Prepositional Phrases
========================================================================*/

pp([sem:PP])--> 
   prep([sem:Prep]), 
   np([coord:_,gap:[],sem:NP]), 
   {combine(pp:PP,[prep:Prep,np:NP])}.

/*========================================================================
   Lexical Rules
========================================================================*/

iv([sem:Sem])--> 
   {lexEntry(iv,[symbol:Sym,syntax:Word])},
   Word,
   {semLex(iv,[symbol:Sym,sem:Sem])}.

tv([sem:Sem])--> 
   {lexEntry(tv,[symbol:Sym,syntax:Word])},
   Word,
   {semLex(tv,[symbol:Sym,sem:Sem])}.

det([type:Type,sem:Det])--> 
   {lexEntry(det,[syntax:Word,type:Type])},
   Word,
   {semLex(det,[type:Type,sem:Det])}. 

pn([sem:Sem])--> 
   {lexEntry(pn,[symbol:Sym,syntax:Word])},
   Word,  
   {semLex(pn,[symbol:Sym,sem:Sem])}.

prep([sem:Sem])--> 
   {lexEntry(prep,[symbol:Sym,syntax:Word])},
   Word,
   {semLex(prep,[symbol:Sym,sem:Sem])}.

coord([type:Type,sem:Sem])--> 
   {lexEntry(coord,[syntax:Word,type:Type])},
   Word, 
   {semLex(coord,[type:Type,sem:Sem])}.

noun([sem:Sem])--> 
   {lexEntry(noun,[symbol:Sym,syntax:Word])},
   Word,
   {semLex(noun,[symbol:Sym,sem:Sem])}.

