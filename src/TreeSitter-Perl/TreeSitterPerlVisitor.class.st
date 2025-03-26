Class {
	#name : 'TreeSitterPerlVisitor',
	#superclass : 'TSVisitor',
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

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitNode: aTSNode [

	| selector |
	selector := 'visitPerl' , aTSNode type capitalized , ':'.
	^self perform: selector asSymbol with: aTSNode
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlAbstractNode: aTSNode [

	super visitNode: aTSNode
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
