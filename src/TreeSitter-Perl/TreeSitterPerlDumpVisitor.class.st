Class {
	#name : 'TreeSitterPerlDumpVisitor',
	#superclass : 'TreeSitterPerlVisitor',
	#instVars : [
		'sourceCode',
		'indent',
		'outputStream'
	],
	#category : 'TreeSitter-Perl',
	#package : 'TreeSitter-Perl'
}

{ #category : 'tracing' }
TreeSitterPerlDumpVisitor >> indentedLine [

	(indent = 0) ifTrue: [ ^self ].

	1 to: indent do: [ :i |
		(i even)
			ifTrue: [outputStream << '| ']
			ifFalse: [ outputStream << '  ' ]
	]
]

{ #category : 'instance creation' }
TreeSitterPerlDumpVisitor >> on: aTSNode [

	indent := 0.
	^String streamContents: [ :stream |
		outputStream := stream.
		aTSNode accept: self
	]
]

{ #category : 'accessing' }
TreeSitterPerlDumpVisitor >> outputStream [
	^ outputStream
]

{ #category : 'accessing' }
TreeSitterPerlDumpVisitor >> sourceCode: aString [

	sourceCode := aString 
]

{ #category : 'tracing' }
TreeSitterPerlDumpVisitor >> traceNode: aTSNode [

	self indentedLine.
	outputStream
		<< 'visiting ' ;
		<< aTSNode type.
	self traceSourceCode: aTSNode.
	outputStream cr.
]

{ #category : 'tracing' }
TreeSitterPerlDumpVisitor >> traceSourceCode: aTSNode [

	| lines |
	sourceCode ifNil: [ ^self ].

	lines := (aTSNode textFromSourceText: sourceCode) lines.
	outputStream
		<< ': ''' ;
		<< lines first.
	(lines size > 1)
	ifTrue: [
		outputStream
			<< ' ...'
	].
	outputStream << $'
]

{ #category : 'visiting' }
TreeSitterPerlDumpVisitor >> visitNode: aTSNode [

	self traceNode: aTSNode.

	indent := indent  + 1.
	super visitNode: aTSNode.
	indent := indent - 1.

]
