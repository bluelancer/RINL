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
   np([coord:_,sem:NP]), 
   vp([coord:_,sem:VP]), 
   {combine(s:Sem,[np:NP,vp:VP])}.

/*========================================================================
   Noun Phrases
========================================================================*/

%% NP dan NP
np([coord:yes,sem:NP])--> 
   np([coord:no,sem:NP1]), 
   coord([type:conj,sem:C]), 
   np([coord:_,sem:NP2]), 
   {combine(np:NP,[np:NP1,coord:C,np:NP2])}.

% NP -> Det N
np([coord:no,sem:NP])--> 
   det([class:F,type:_,sem:Det]), 
   n([coord:_,class:F,sem:N]), 
   {combine(np:NP,[det:Det,n:N])}.

% NP -> PN
np([coord:no,sem:NP])--> 
   pn([sem:PN]), 
   {combine(np:NP,[pn:PN])}.

% NP -> PN PP
np([coord:no,sem:NP])--> 
   pn([sem:PN]), 
   pp([sem:PP]),
   {combine(np:NP,[pn:PN,pp:PP])}.

/*========================================================================
   Nouns
========================================================================*/

n([coord:no,class:F,sem:N])-->
   noun([class:F,sem:Noun]),
   {combine(n:N,[noun:Noun])}.

n([coord:no,class:F,sem:Sem])--> 
   noun([class:F,sem:N]), 
   pp([sem:PP]),
   {combine(n:Sem,[noun:N,pp:PP])}. 

/*========================================================================
   Verb Phrases
========================================================================*/

%% VP -> VP dan VP
vp([coord:yes,sem:VP])--> 
   vp([coord:no,sem:VP1]), 
   coord([type:conj,sem:C]), 
   vp([coord:_,sem:VP2]),
   {combine(vp:VP,[vp:VP1,coord:C,vp:VP2])}.

%%  VP -> IV
vp([coord:no,sem:VP])--> 
   iv([sem:IV]), 
   {combine(vp:VP,[iv:IV])}.

%%  VP -> TV NP
vp([coord:no,sem:VP])-->   
   tv([sem:TV]), 
   np([coord:_,sem:NP]), 
   {combine(vp:VP,[tv:TV,np:NP])}.

%%  VP -> IV PP
vp([coord:no,sem:VP])--> 
   iv([sem:IV]), 
   pp([sem:PP]),
   {combine(vp:VP,[iv:IV,pp:PP])}.

/*========================================================================
   Prepositional Phrases
========================================================================*/

pp([sem:PP])--> 
   prep([sem:Prep]), 
   np([coord:_,sem:NP]), 
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

det([class:F,type:Type,sem:Det])--> 
   {lexEntry(det,[syntax:Word,type:Type,class:F])},
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

noun([class:F,sem:Sem])--> 
   {lexEntry(noun,[symbol:Sym,syntax:Word,class:F])},
   Word,
   {semLex(noun,[symbol:Sym,sem:Sem])}.
