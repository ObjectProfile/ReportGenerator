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
