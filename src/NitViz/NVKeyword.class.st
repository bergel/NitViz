Class {
	#name : #NVKeyword,
	#superclass : #Object,
	#instVars : [
		'keyword',
		'entries',
		'connectedTo'
	],
	#category : #NitViz
}

{ #category : #adding }
NVKeyword >> addEntry: anEntry [
	entries add: anEntry
]

{ #category : #'as yet unclassified' }
NVKeyword >> connectedKeywords [
	^ (self entries flatCollect: #keywords as: Set) asArray sortedAs: #keyword
]

{ #category : #accessing }
NVKeyword >> connectedTo [

	^ connectedTo
]

{ #category : #accessing }
NVKeyword >> connectedTo: anObject [

	connectedTo := anObject
]

{ #category : #accessing }
NVKeyword >> entries [

	^ entries
]

{ #category : #accessing }
NVKeyword >> entries: anObject [

	entries := anObject
]

{ #category : #adding }
NVKeyword >> initialize [
	super initialize.
	entries := OrderedCollection new
]

{ #category : #accessing }
NVKeyword >> keyword [

	^ keyword
]

{ #category : #accessing }
NVKeyword >> keyword: anObject [

	keyword := anObject
]

{ #category : #'as yet unclassified' }
NVKeyword >> numberOfEntries [
	^ entries size
]

{ #category : #printing }
NVKeyword >> printOn: str [
	keyword ifNil: [ str nextPutAll: 'UNKNOWN' ]
		ifNotNil: [ str nextPutAll: keyword ]
]
