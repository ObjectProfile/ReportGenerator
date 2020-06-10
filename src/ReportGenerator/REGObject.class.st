Class {
	#name : #REGObject,
	#superclass : #Object,
	#instVars : [
		'metrics'
	],
	#category : #ReportGenerator
}

{ #category : #accessing }
REGObject >> metrics [
	metrics ifNil: [ metrics := Dictionary new ].
	^ metrics
]

{ #category : #accessing }
REGObject >> numberOfLinesOfCode: aNumber [
	self metrics at: #LOC put: aNumber
]
