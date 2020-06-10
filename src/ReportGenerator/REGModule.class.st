Class {
	#name : #REGModule,
	#superclass : #REGUnit,
	#instVars : [
		'functions'
	],
	#category : #ReportGenerator
}

{ #category : #adding }
REGModule >> addFunction: aFunction [
	self assert: [ aFunction class == REGFunction ].
	functions add: aFunction.
	aFunction module: self
]

{ #category : #accessing }
REGModule >> functions [
	functions ifNil: [ ^ #() ].
	^ functions
]

{ #category : #initialization }
REGModule >> initialize [
	super initialize.
	functions := OrderedCollection new
]

{ #category : #'as yet unclassified' }
REGModule >> numberOfFunctions [
	functions ifNil: [ ^ 0 ].
	^ functions size
]

{ #category : #'public - metrics' }
REGModule >> numberOfLinesOfCode [
	^ self metrics at: #LOC
]
