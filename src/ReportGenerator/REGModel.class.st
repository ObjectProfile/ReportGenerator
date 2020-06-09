Class {
	#name : #REGModel,
	#superclass : #Object,
	#instVars : [
		'modules'
	],
	#category : #ReportGenerator
}

{ #category : #adding }
REGModel >> addSrcMLXML: xml [

	self halt.
]

{ #category : #'as yet unclassified' }
REGModel >> exampleUVent [

	| uventPath |
	uventPath := '/Users/alexandrebergel/Dropbox/GitRepos/u-vent'.
]

{ #category : #'as yet unclassified' }
REGModel >> initialize [
	super initialize.
	modules := OrderedCollection new
]

{ #category : #'as yet unclassified' }
REGModel >> numberOfFunctions [
	modules ifEmpty: [ ^ 0 ].
	^ (modules collect: #numberOfFunctions) sum
]

{ #category : #'as yet unclassified' }
REGModel >> numberOfModules [
	^ modules size
]
