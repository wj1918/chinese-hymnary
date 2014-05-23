%StartMarker
% Generated by nwc2ly C# version 1.0.1.1 by Phil Holmes
% Based on nwc2ly by Mike Wiering
% Filename = AuldLangSyne.ly

{
\autoBeamOff
\override MultiMeasureRest #'expand-limit = #1
 \accidentalStyle "modern-voice-cautionary"
 \clef "bass"
 \key f\major
\numericTimeSignature
 \time 4/4
 < f a>4  |  % 1
 < f a>4. < f a>8 < f a>4 < f c'>4  |  % 2
 < c c'>4. < c c'>8 < c c'>4 < c bes>4  |  % 3
 < f a>4. < f a>8 < f c'>4 < f a>4  |  % 4
 < bes, bes>2. < d bes>4  |  % 5
 < f a>4. < f c'>8 < f c'>4 < f a>4  |  % 6
 < c c'>4. < c c'>8 < c c'>4 < c e>4  |  % 7
 < d f>4. < bes, f>8 < bes, f>4 < c e>4  |  % 8
 < f, f>2.\mark \markup { \musicglyph #"scripts.segno" }  
 < f bes>4  |  % 9
 < f a>4. < f c'>8 < f c'>4 < f a>4  |  % 10
 < c c'>4. < c c'>8 < c c'>4 < c bes>4  |  % 11
 < f a>4. < f c'>8 < f c'>4 < f a>4  |  % 12
 < bes, bes>2. < d bes>4  |  % 13
 < f a>4. < f c'>8 < f c'>4 < f a>4  |  % 14
 < c c'>4. < c c'>8 < c c'>4 < c e>4  |  % 15
 < d f>4. < bes, f>8 < bes, f>4 < c e>4  |  % 16
 < f, f>2.  % Error
#(ly:warning "Unparsed Flow command: ~a" "DSalFine")
 % |Flow|Style:DSalFine|Pos:11|Justify:Right|Placement:AsStaffSignature
 \bar "|."
}
