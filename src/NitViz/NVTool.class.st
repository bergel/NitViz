Class {
	#name : #NVTool,
	#superclass : #Object,
	#instVars : [
		'tool',
		'entries'
	],
	#category : #NitViz
}

{ #category : #accessing }
NVTool >> entries [

	^ entries
]

{ #category : #accessing }
NVTool >> entries: someEntries [

	entries := someEntries
]

{ #category : #printing }
NVTool >> printOn: str [
	str nextPut: $T.
	str nextPut: $(.
	tool ifNotNil: [ str nextPutAll: tool asString ].
	str nextPut: $).
]

{ #category : #accessing }
NVTool >> tool [

	^ tool
]

{ #category : #accessing }
NVTool >> tool: aString [

	tool := aString
]
