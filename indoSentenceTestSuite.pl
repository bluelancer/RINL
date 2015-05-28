/*************************************************************************

    File: sentenceTestSuite.pl
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

:- module(sentenceTestSuite,[sentence/2]).


/*========================================================================
   Sentences
========================================================================*/

sentence([semua,dosen,berlari],1).

sentence([seorang,mahasiswa,berlari],1).

sentence([seorang,mahasiswa,membaca,sebuah,buku],1).

sentence([anto,berlari,dari,seekor,harimau],1).

sentence([anto,dan,seorang,dosen,berlari],1).

sentence([semua,mahasiswa,berlari,dan,membaca,sebuah,buku],1).

sentence([anto,membaca,sebuah,buku,dari,seorang,dosen],1).

sentence([seorang,mahasiswa,membaca,sebuah,buku,dari,seorang,dosen],1).

sentence([anto,berlari],1).

sentence([anto,membaca,sebuah,buku],1).

sentence([anto,dari,seekor,harimau,berlari],1).

sentence([seorang,dosen,dari,seekor,harimau,berlari],1).

sentence([seorang,dosen,berlari,dari,seekor,harimau],1).
