/*************************************************************************

    File: englishLexicon.pl
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
   Determiners
========================================================================*/

lexEntry(det,[syntax:[semua],type:uni,class:_]).
lexEntry(det,[syntax:[seorang],type:indef,class:man]).
lexEntry(det,[syntax:[seekor],type:indef,class:animal]).
lexEntry(det,[syntax:[sebuah],type:indef,class:thing]).

/*========================================================================
   Nouns
========================================================================*/

lexEntry(noun,[symbol:harimau,syntax:[harimau],class:animal]).
lexEntry(noun,[symbol:buku,syntax:[buku],class:thing]).
lexEntry(noun,[symbol:dosen,syntax:[dosen],class:man]).
lexEntry(noun,[symbol:mahasiswa,syntax:[mahasiswa],class:man]).

/*========================================================================
   Proper Names
========================================================================*/

lexEntry(pn,[symbol:anto,syntax:[anto]]).

/*========================================================================
   Intransitive Verbs
========================================================================*/

lexEntry(iv, [symbol:berlari,syntax:[berlari]]).

/*========================================================================
   Transitive Verbs
========================================================================*/

lexEntry(tv,[symbol:membaca,syntax:[membaca]]).

/*========================================================================
   Prepositions
========================================================================*/

lexEntry(prep,[symbol:dari,syntax:[dari]]).

/*========================================================================
   Coordinations
========================================================================*/

lexEntry(coord,[syntax:[dan],type:conj]).