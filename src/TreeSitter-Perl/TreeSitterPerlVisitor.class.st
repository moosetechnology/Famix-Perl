Class {
	#name : 'TreeSitterPerlVisitor',
	#superclass : 'TSVisitor',
	#category : 'TreeSitter-Perl',
	#package : 'TreeSitter-Perl'
}

{ #category : 'reflective operations' }
TreeSitterPerlVisitor >> createVisitMethod: aMessage [

	| fields aTSNode |
	aTSNode := aMessage arguments first.
	fields := aMessage arguments second.

	^String streamContents: [ :str |
		str
			<< 'visitPerl'.
			($_ split: aTSNode type) do: [ :word | str << word capitalized ].
			str
				<< ': aTSNode withFields: fields' ;
				cr ;
				<< '	^{' ;
				cr.

		fields keysDo: [ :key |
			str
				<< '		self visitKey: ''' ;
				<< key ;
				<< ''' inDictionnary: fields.' ;
				cr
		].
		str
			<< '	}' ;
			cr
	]

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitKey: aKey inDictionnary: childrenDictionnary [
	"childrenDictionnary of  fields and their associated nodes.
	 Visit the nodes and put the result back in the childrenDictionnary"

	| child |
	child := childrenDictionnary at: aKey ifAbsent: [^nil].

	childrenDictionnary
		at: aKey
		put: (child isCollection
			ifTrue: [ child collect: [ :c | c accept: self ] ]
			ifFalse: [ child accept: self ]).

	^childrenDictionnary 
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitNode: aTSNode [

	| selector |
	selector := String streamContents: [ :st |
		st << 'visitPerl'.
		($_ split: aTSNode type) do: [ :word | st << word capitalized ].
		st << ':withFields:'
	].

	^self
		perform: selector asSymbol
		with: aTSNode
		with: aTSNode collectFieldNameOfNamedChild
]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlAmbiguousFunctionCallExpression: aTSNode withFields: fields [
	^{
		self visitKey: 'function' inDictionnary: fields.
		self visitKey: 'arguments' inDictionnary: fields.
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlAnonymousHashExpression: aTSNode withFields: fields [
	^{
		self visitKey: '<unnamedChild>' inDictionnary: fields.
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlArray: aTSNode withFields: fields [
	^{
		self visitKey: '<unnamedChild>' inDictionnary: fields.
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlAssignmentExpression: aTSNode withFields: fields [
	^{
		self visitKey: 'left' inDictionnary: fields.
		self visitKey: 'right' inDictionnary: fields.
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlAutoquotedBareword: aTSNode withFields: fields [
	^{
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlBareword: aTSNode withFields: fields [
	^{
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlBlock: aTSNode withFields: fields [
	^{
		self visitKey: '<unnamedChild>' inDictionnary: fields.
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlComment: aTSNode withFields: fields [
	^{
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlEscapeSequence: aTSNode withFields: fields [
	^{
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlExpressionStatement: aTSNode withFields: fields [
	^{
		self visitKey: '<unnamedChild>' inDictionnary: fields.
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlFunc1opCallExpression: aTSNode withFields: fields [
	^{
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlFunction: aTSNode withFields: fields [
	^{
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlHashElementExpression: aTSNode withFields: fields [
	^{
		self visitKey: '<unnamedChild>' inDictionnary: fields.
		self visitKey: 'key' inDictionnary: fields.
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlInterpolatedStringLiteral: aTSNode withFields: fields [
	^{
		self visitKey: 'content' inDictionnary: fields.
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlListExpression: aTSNode withFields: fields [
	^{
		self visitKey: '<unnamedChild>' inDictionnary: fields.
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlPackage: aTSNode withFields: fields [
	^{
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlPackageStatement: aTSNode withFields: fields [
	^{
		self visitKey: 'name' inDictionnary: fields.
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlPostfixConditionalExpression: aTSNode withFields: fields [
	^{
		self visitKey: '<unnamedChild>' inDictionnary: fields.
		self visitKey: 'condition' inDictionnary: fields.
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlReturnExpression: aTSNode withFields: fields [
	^{
		self visitKey: '<unnamedChild>' inDictionnary: fields.
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlScalar: aTSNode withFields: fields [
	^{
		self visitKey: '<unnamedChild>' inDictionnary: fields.
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlSourceFile: aTSNode withFields: fields [
	^{
		self visitKey: '<unnamedChild>' inDictionnary: fields.
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlStringContent: aTSNode withFields: fields [
	^{
		self visitKey: '<unnamedChild>' inDictionnary: fields.
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlSubroutineDeclarationStatement: aTSNode withFields: fields [
	^{
		self visitKey: 'name' inDictionnary: fields.
		self visitKey: 'body' inDictionnary: fields.
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlVariableDeclaration: aTSNode withFields: fields [
	^{
		self visitKey: 'variable' inDictionnary: fields.
	}

]

{ #category : 'visiting' }
TreeSitterPerlVisitor >> visitPerlVarname: aTSNode withFields: fields [
	^{
	}

]
