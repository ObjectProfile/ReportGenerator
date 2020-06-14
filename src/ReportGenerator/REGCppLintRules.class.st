Class {
	#name : #REGCppLintRules,
	#superclass : #Object,
	#instVars : [
		'file',
		'lineOfCode',
		'description',
		'rules'
	],
	#category : #ReportGenerator
}

{ #category : #accessing }
REGCppLintRules >> description [
	^ description
]

{ #category : #accessing }
REGCppLintRules >> description: anObject [
	description := anObject
]

{ #category : #accessing }
REGCppLintRules >> file [
	^ file
]

{ #category : #accessing }
REGCppLintRules >> file: anObject [
	file := anObject
]

{ #category : #'instance creation' }
REGCppLintRules >> fromString: aString [
	| lines |
	lines := aString lines.
	lines do: [ :line | self processLine: line ].
	^ rules
]

{ #category : #'instance creation' }
REGCppLintRules >> initialize [
	super initialize.
	rules := OrderedCollection new.
]

{ #category : #accessing }
REGCppLintRules >> lineOfCode [
	^ lineOfCode
]

{ #category : #accessing }
REGCppLintRules >> lineOfCode: anObject [
	lineOfCode := anObject
]

{ #category : #'as yet unclassified' }
REGCppLintRules >> processLine: aLine [
	| ind tt |
	(aLine beginsWith: 'Ignoring') ifTrue: [ ^ self ].
	
	ind := aLine indexOf: $ .
	tt := (aLine first: ind) substrings: ':'.
	file := tt first.
	lineOfCode := tt second asInteger.
	
	description := aLine copyFrom: ind + 1 to: aLine size.
	
	rules add: (REGCppLintRules new file: file; lineOfCode: lineOfCode; description: description).
	
]

{ #category : #accessing }
REGCppLintRules >> rules [
	^ rules
]

{ #category : #accessing }
REGCppLintRules >> rules: anObject [
	rules := anObject
]
