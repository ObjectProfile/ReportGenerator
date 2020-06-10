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
	"xml as string
	
	Using:
	srcml *.{c,h} -o example.xml
	"
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
REGModel >> exampleSmall [
	<script: 'self new exampleSmall inspect'>

	| m |
	m := REGModel new.
	m addSrcMLXML: REGModelTest new codeExample.
	^ m
]

{ #category : #examples }
REGModel >> exampleUVent [

	| uventPath |
	uventPath := '/Users/alexandrebergel/Dropbox/GitRepos/u-vent'.
]

{ #category : #visualization }
REGModel >> gtInspectorViewIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite roassal3
		title: 'View';
		initializeCanvas: [ self visualize ]
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

{ #category : #metrics }
REGModel >> numberOfLinesOfCode [
	| units |
	units := self modules, self headers.
	units ifEmpty: [ ^ self ].
	^ (units collect: #numberOfLinesOfCode) sum
]

{ #category : #'public - metrics' }
REGModel >> numberOfModules [
	^ modules size
]

{ #category : #visualization }
REGModel >> visualize [

	| c ms |
	c := RSCanvas new.
	
	ms := RSGroup new.
	self modules do: [ :m |
		ms add: (RSBox new model: m).
	].

	RSNormalizer size
		shapes: ms;
		from: 10; to: 50;
		normalize: #numberOfLinesOfCode.

	ms @ RSLabeled @ RSDraggable.
	c addAll: ms.
	
	
	RSGridLayout on: ms.
	^ c
]
