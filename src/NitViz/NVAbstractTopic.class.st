Class {
	#name : #NVAbstractTopic,
	#superclass : #Object,
	#instVars : [
		'entries',
		'keyword'
	],
	#category : #NitViz
}

{ #category : #adding }
NVAbstractTopic >> addEntry: anEntry [
	entries add: anEntry
]

{ #category : #accessing }
NVAbstractTopic >> entries [

	^ entries
]

{ #category : #accessing }
NVAbstractTopic >> entries: anObject [

	entries := anObject
]

{ #category : #adding }
NVAbstractTopic >> initialize [
	super initialize.
	entries := OrderedCollection new
]

{ #category : #accessing }
NVAbstractTopic >> keyword [

	^ keyword
]

{ #category : #accessing }
NVAbstractTopic >> keyword: anObject [

	keyword := anObject
]

{ #category : #'as yet unclassified' }
NVAbstractTopic >> numberOfEntries [
	^ entries size
]

{ #category : #printing }
NVAbstractTopic >> printOn: str [
	keyword ifNil: [ str nextPutAll: 'UNKNOWN' ]
		ifNotNil: [ str nextPutAll: keyword ]
]
