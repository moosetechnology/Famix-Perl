Class {
	#name : 'TSPerlLibrary',
	#superclass : 'FFILibrary',
	#category : 'TreeSitter-Perl',
	#package : 'TreeSitter-Perl'
}

{ #category : 'accessing - platform' }
TSPerlLibrary >> tree_sitter_perl [

	^ self ffiCall: 'TSLanguage * tree_sitter_perl ()'
]

{ #category : 'accessing - platform' }
TSPerlLibrary >> unix64LibraryName [
	"Users should use unix32* or unix64*"

	^ FFIUnix64LibraryFinder findAnyLibrary: #( 'libtree-sitter-perl.so' )
]
