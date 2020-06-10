Class {
	#name : #REGModule,
	#superclass : #REGObject,
	#instVars : [
		'filename',
		'functions',
		'includes'
	],
	#category : #ReportGenerator
}

{ #category : #accessing }
REGModule >> filename [
	^ filename
]

{ #category : #accessing }
REGModule >> filename: anObject [
	filename := anObject
]

{ #category : #accessing }
REGModule >> functions [
	functions ifNil: [ ^ #() ].
	^ functions
]

{ #category : #accessing }
REGModule >> functions: anObject [
	functions := anObject
]

{ #category : #accessing }
REGModule >> includes [
	^ includes
]

{ #category : #accessing }
REGModule >> includes: anObject [
	includes := anObject
]

{ #category : #'as yet unclassified' }
REGModule >> numberOfFunctions [
	functions ifNil: [ ^ 0 ].
	^ functions size
]
