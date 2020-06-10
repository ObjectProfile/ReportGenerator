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
		descendantNodesSelect: [ :x | (x class ~~ XMLString) and: [ x name = 'unit' ] ].
		
	units do: [ :u | self addUnitAsXML: u ]
]

{ #category : #examples }
REGModel >> exampleUVent [

	| uventPath |
	uventPath := '/Users/alexandrebergel/Dropbox/GitRepos/u-vent'.
]

{ #category : #initialization }
REGModel >> initialize [
	super initialize.
	modules := OrderedCollection new.
	headers := OrderedCollection new.
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
