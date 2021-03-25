Class {
	#name : #NVYear,
	#superclass : #Object,
	#instVars : [
		'year',
		'entries'
	],
	#category : #NitViz
}

{ #category : #accessing }
NVYear >> entries [

	^ entries
]

{ #category : #accessing }
NVYear >> entries: anObject [

	entries := anObject
]

{ #category : #printing }
NVYear >> printOn: str [
	str nextPut: $Y.
	str nextPut: $(.
	year ifNotNil: [ str nextPutAll: year asString ].
	str nextPut: $).
]

{ #category : #accessing }
NVYear >> year [

	^ year
]

{ #category : #accessing }
NVYear >> year: anInteger [

	year := anInteger
]
