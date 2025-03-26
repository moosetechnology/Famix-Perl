Extension { #name : 'TSLanguage' }

{ #category : '*TreeSitter-Perl' }
TSLanguage class >> perl [

	^ TSPerlLibrary uniqueInstance tree_sitter_perl
]
