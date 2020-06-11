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
	
	(xml allElementsSelect: [ :x | x name = 'cpp:include' ]) do: [ :iXML |
		m addInclude: (self createIncludeFromXML: iXML) ].
	
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

{ #category : #'private - XML' }
REGModel >> createIncludeFromXML: xml [
	| i |
	i := REGImport new.
	i name: (xml findElementNamed: 'cpp:file') nodes first string.
	^ i
]

{ #category : #examples }
REGModel >> exampleSmall [
	<script: 'self new exampleSmall inspect'>

	| m |
	m := REGModel new.
	m addSrcMLXML: REGModelTest new codeExample.
	m resolve.
	^ m
]

{ #category : #examples }
REGModel >> exampleUVent [
	<script: 'self new exampleUVent inspect'>

	| uventPath m |
	uventPath := '/Users/alexandrebergel/Dropbox/GitRepos/u-vent/example.xml'.
	
	m := REGModel new.
	m addSrcMLXML: uventPath asFileReference contents.
	m resolve.
	^ m
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

{ #category : #public }
REGModel >> resolve [

	| d |
	d := Dictionary new.
	modules, headers do: [ :unit | 
		d at: unit filename put: unit ].
	
	modules, headers do: [ :unit | 
		unit includes do: [ :i |
			i fromUnit: unit.
			(d includesKey: i rawName) ifTrue: [ i toUnit: (d at: i rawName) ]
		]
	].

]

{ #category : #visualization }
REGModel >> visualize [

	| c units eb |
	c := RSCanvas new.
	
	units := RSGroup new.
	self modules do: [ :m |
		units add: (RSBox new model: m).
	].

	self headers do: [ :m |
		units add: (RSBox new model: m; color: Color pink lighter lighter lighter).
	].

	RSNormalizer size
		shapes: units;
		from: 10; to: 50;
		normalize: #numberOfLinesOfCode.

	eb := RSEdgeBuilder arrowedLineWithOffset: 0.2.
	eb canvas: c.
	eb shapes: units.
	eb connectToAll: #outgoingUnits.

	"units @ (RSLabeled new text: [ :m | m filename ]; highlightable) @ RSDraggable."
	units @ (RSLabeled new text: [ :m | m filename ]) @ RSDraggable.
	units @ (RSHighlightable new withEdges; highlightColor: Color red).
	c addAll: units.
	
	RSGridLayout on: units.
	^ c
]
