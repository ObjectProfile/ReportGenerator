Class {
	#name : #REGModel,
	#superclass : #Object,
	#instVars : [
		'modules',
		'headers'
	],
	#category : #ReportGenerator
}

{ #category : #public }
REGModel >> addSrcMLXML: xml [
	
	| units |
	units := (XMLDOMParser parse: xml) document
		descendantNodesSelect: [ :x | (x class ~~ XMLString) and: [ x name = 'unit' and: [ x attributes includesKey: 'filename' ] ] ].
		
	units do: [ :u | self addUnitAsXML: u ]
]

{ #category : #'private - XML' }
REGModel >> addUnitAsXML: xml [

	| m |
	m := REGModule new.
	m filename: (xml attributeAt: 'filename').
	m includes: (xml allElementsSelect: [ :x | x name = 'cpp:include' ]).
	m metrics at: #LOC put: xml printString lines size.

	(xml allElementsSelect: [ :x | x name = 'function' ]) do: [ :fXML |
		m addFunction: (self createFunctionFromXML: fXML) ].
	
	
	(#('.C' '.c' '.cpp') anySatisfy: [ :p | m filename endsWith: p ])
		ifTrue: [ modules add: m ]
		ifFalse: [ headers add: m ]
	
]

{ #category : #'private - XML' }
REGModel >> createFunctionFromXML: xml [
	| f |
	f := REGFunction new.
	f name: (xml elementAt: 'name') nodes first string.
	f numberOfLinesOfCode: xml asString lines size.
	^ f
]

{ #category : #examples }
REGModel >> exampleUVent [

	| uventPath |
	uventPath := '/Users/alexandrebergel/Dropbox/GitRepos/u-vent'.
]

{ #category : #accessing }
REGModel >> headers [
	^ headers
]

{ #category : #initialization }
REGModel >> initialize [
	super initialize.
	modules := OrderedCollection new.
	headers := OrderedCollection new.
]

{ #category : #accessing }
REGModel >> modules [
	^ modules
]

{ #category : #'public - metrics' }
REGModel >> numberOfFunctions [
	modules ifEmpty: [ ^ 0 ].
	^ (modules collect: #numberOfFunctions) sum
]

{ #category : #'public - metrics' }
REGModel >> numberOfHeaders [
	^ headers size
]

{ #category : #'public - metrics' }
REGModel >> numberOfModules [
	^ modules size
]
