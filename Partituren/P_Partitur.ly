%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% (c) 2017 by Wolfgang Skala.
% This file is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
% To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\version "2.18.0"

#(set-global-staff-size 14.14)

\layout {
	\context {
		\Lyrics
		\override LyricText.font-size = #-1
	}
}

\book {
	\bookpart {
		\header {
			title = \markup {
				\medium \center-column {
					\normal-text \larger \larger \line { Ecce Nunc Benedicite }
					\smaller \smaller \smaller \line { ZWV 99 }
				}
			}
			composer = \markup { \larger "Dresden, 1739" }
		}
		\paper { systems-per-page = #2 }
		\score {
			<<
				\new StaffGroup {
					\new GrandStaff <<
						\new Staff {
							\set Staff.instrumentName = "Oboe I"
							\OboeI
						}
						\new Staff {
							\set Staff.instrumentName = "Oboe II"
							\override Staff.VerticalAxisGroup.minimum-Y-extent = #'(-10 . 4)
							\OboeII
						}
					>>
				}
				\new StaffGroup <<
					\new GrandStaff <<
						\new Staff {
							\set Staff.instrumentName = "Violino I"
							\ViolinoI
						}
						\new Staff {
							\set Staff.instrumentName = "Violino II"
							\override Staff.VerticalAxisGroup.minimum-Y-extent = #'(-10 . 4)
							\ViolinoII
						}
					>>
					\new Staff {
						\set Staff.instrumentName = "Viola"
						\Viola
					}
				>>
				\new ChoirStaff <<
					\new Staff {
						\set Staff.instrumentName = \SopranoIncipit
						\override Staff.InstrumentName.self-alignment-Y = ##f
						\override Staff.InstrumentName.self-alignment-X = #RIGHT
						\new Voice = "Soprano" { \dynamicUp \SopranoNotes }
					}
					\new Lyrics \lyricsto Soprano \SopranoLyrics
					
					\new Staff {
						\set Staff.instrumentName = \AltoIncipit
						\override Staff.InstrumentName.self-alignment-Y = ##f
						\override Staff.InstrumentName.self-alignment-X = #RIGHT
						\new Voice = "Alto" { \dynamicUp \AltoNotes }
					}
					\new Lyrics \lyricsto Alto \AltoLyrics
					
					\new Staff {
						\set Staff.instrumentName = \TenoreIncipit
						\override Staff.InstrumentName.self-alignment-Y = ##f
						\override Staff.InstrumentName.self-alignment-X = #RIGHT
						\new Voice = "Tenore" { \dynamicUp \TenoreNotes }
					}
					\new Lyrics \lyricsto Tenore \TenoreLyrics
					
					\new Staff {
						\set Staff.instrumentName = "Basso"
						\new Voice = "Basso" { \dynamicUp \BassoNotes }
					}
					\new Lyrics \lyricsto Basso \BassoLyrics
				>>
				\new StaffGroup <<
					\new Staff {
						\set Staff.instrumentName = "Bassi ed Organo"
						\BassiOrgano
					}
				>>
				\new FiguredBass { \BassFigures }
			>>
% 			\midi { }
		}
	}
}