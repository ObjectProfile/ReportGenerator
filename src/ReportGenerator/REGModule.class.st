Class {
	#name : #REGModule,
	#superclass : #REGObject,
	#instVars : [
		'filename',
		'functions',
		'imports',
		'linesOfCode'
	],
	#category : #ReportGenerator
}

{ #category : #'as yet unclassified' }
REGModule >> numberOfFunctions [
	functions ifEmpty: [ ^ 0 ].
	^ functions size
]
