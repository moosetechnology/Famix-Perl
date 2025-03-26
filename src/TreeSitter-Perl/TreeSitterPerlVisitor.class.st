Class {
	#name : 'TreeSitterPerlVisitor',
	#superclass : 'Object',
	#instVars : [
		'sourceCode',
		'indent',
		'outputStream'
	],
	#category : 'TreeSitter-Perl',
	#package : 'TreeSitter-Perl'
}

{ #category : 'reflective operations' }
TreeSitterPerlVisitor >> doesNotUnderstand: aMessage [

	| code |
	(aMessage selector beginsWith: 'visitPerl') ifFalse: [ super doesNotUnderstand: aMessage ].

	code := aMessage selector , 'aTSNode 

	^self visitPerlAbstractNode: aTSNode'.

	self class compile: code classified: #visiting.

	self visitNode: aMessage arguments first
]

{ #category : 'tracing' }
TreeSitterPerlVisitor >> indentedLine [

	(indent = 0) ifTrue: [ ^self ].

	1 to: indent do: [ :i |
		(i even)
			ifTrue: [outputStream << '| ']
			ifFalse: [ outputStream << '  ' ]
	]
]

{ #category : 'instance creation' }
TreeSitterPerlVisitor >> on: aTSNode [

	indent := 0.
	^String streamContents: [ :stream |
		outputStream := stream.
		aTSNode accept: self
	]
]

{ #category : 'accessing' }
TreeSitterPerlVisitor >> outputStream [
	^ outputStream
]

{ #category : 'accessing' }
TreeSitterPerlVisitor >> sourceCode: aString [

	sourceCode := aString 
]

{ #category : 'instance creation' }
TreeSitterPerlVisitor >> traceFields: aTSNode [

	| fields |
	fields := aTSNode collectFieldNameOfNamedChild.
	outputStream << ' ['.
	fields keys do: [ :k |
		outputStream
			<< ' ' ;
			<< (k ifEmpty: ['-'])
	].
	outputStream << ' ]'.

]

{ #category : 'instance creation' }
TreeSitterPerlVisitor >> traceSourceCode: aTSNode [

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
TreeSitterPerlVisitor >> visitNode: aTSNode [

	| selector |
	selector := 'visitPerl' , aTSNode type capitalized , ':'.
	^self perform: selector asSymbol with: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlAbstractNode: aTSNode [

	| result |
	self indentedLine.
	outputStream
		<< 'visiting ' ;
		<< aTSNode type.
	self traceSourceCode: aTSNode.
	self traceFields: aTSNode.
	outputStream cr.

	indent := indent  + 1.
	result := aTSNode collectNamedChild collect: [ :child |
		child accept: self ].
	indent := indent - 1.

	^result 
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlAmbiguous_function_call_expression:aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlAnonymous_hash_expression:aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlArray:aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlAssignment_expression: aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlAutoquoted_bareword:aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlBareword:aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlBlock:aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlComment: aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlEscape_sequence:aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlExpression_statement: aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlFunc1op_call_expression:aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlFunction:aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlHash_element_expression:aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlInterpolated_string_literal:aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlList_expression:aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlNumber: aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlPackage: aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlPackage_statement: aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlPostfix_conditional_expression:aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlReturn_expression:aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlScalar: aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlSource_file: aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlString_content:aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlSubroutine_declaration_statement: aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlVariable_declaration: aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlVarname: aTSNode [ 

	^self visitPerlAbstractNode: aTSNode
]
