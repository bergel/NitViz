Class {
	#name : #NVEntry,
	#superclass : #Object,
	#instVars : [
		'index',
		'toolIdentifier',
		'year',
		'activities',
		'mainRETopics',
		'subtopics',
		'otherTopics',
		'keywords'
	],
	#category : #NitViz
}

{ #category : #accessing }
NVEntry >> activities [

	^ activities
]

{ #category : #accessing }
NVEntry >> activities: anObject [

	activities := anObject
]

{ #category : #adding }
NVEntry >> addKeyword: aKeyword [
	keywords add: aKeyword
]

{ #category : #accessing }
NVEntry >> index [

	^ index
]

{ #category : #accessing }
NVEntry >> index: anObject [

	index := anObject
]

{ #category : #initialization }
NVEntry >> initialize [
	super initialize.
	keywords := OrderedCollection new
]

{ #category : #accessing }
NVEntry >> keywords [
	^ keywords
]

{ #category : #accessing }
NVEntry >> mainRETopics [

	^ mainRETopics
]

{ #category : #accessing }
NVEntry >> mainRETopics: anObject [

	mainRETopics := anObject
]

{ #category : #accessing }
NVEntry >> otherTopics [

	^ otherTopics
]

{ #category : #accessing }
NVEntry >> otherTopics: anObject [

	otherTopics := anObject
]

{ #category : #accessing }
NVEntry >> subtopics [

	^ subtopics
]

{ #category : #accessing }
NVEntry >> subtopics: anObject [

	subtopics := anObject
]

{ #category : #accessing }
NVEntry >> toolIdentifier [

	^ toolIdentifier
]

{ #category : #accessing }
NVEntry >> toolIdentifier: anObject [

	toolIdentifier := anObject
]

{ #category : #'as yet unclassified' }
NVEntry >> topicKeywords [
	^ (mainRETopics, ' ', subtopics substrings: ' , -', String crlf) collect: #asLowercase
]

{ #category : #accessing }
NVEntry >> year [

	^ year
]

{ #category : #accessing }
NVEntry >> year: anObject [

	year := anObject
]
