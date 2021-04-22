Class {
	#name : #NVEntry,
	#superclass : #Object,
	#instVars : [
		'index',
		'toolIdentifier',
		'year',
		'activities',
		'subtopics',
		'otherTopics',
		'mainRETopicsAsString',
		'mainRETopics'
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
NVEntry >> addMainTopic: aMainTopic [
	self assert: [ aMainTopic class == NVMainTopic ] description: 'Wrong type'.
	mainRETopics add: aMainTopic
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
	mainRETopics := OrderedCollection new
]

{ #category : #accessing }
NVEntry >> keywords [
	^ mainRETopics
]

{ #category : #accessing }
NVEntry >> mainRETopics [

	^ mainRETopics
]

{ #category : #accessing }
NVEntry >> mainRETopicsAsString [
	^ mainRETopicsAsString
]

{ #category : #accessing }
NVEntry >> mainRETopicsAsString: aString [

	mainRETopicsAsString := aString
]

{ #category : #accessing }
NVEntry >> mainRETopicsAsWords [
	^ self mainRETopicsAsString substrings: ','
]

{ #category : #'as yet unclassified' }
NVEntry >> mainTopics [
	^ (mainRETopicsAsString substrings: ',', String crlf) collect: #asLowercase
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
NVEntry >> someMainTopics [

	^ mainRETopicsAsString
]

{ #category : #accessing }
NVEntry >> someMainTopics: aString [

	mainRETopicsAsString := aString
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

{ #category : #accessing }
NVEntry >> year [

	^ year
]

{ #category : #accessing }
NVEntry >> year: anObject [

	year := anObject
]
