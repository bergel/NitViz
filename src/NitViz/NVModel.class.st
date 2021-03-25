Class {
	#name : #NVModel,
	#superclass : #Object,
	#instVars : [
		'entries',
		'years',
		'tools',
		'keywords'
	],
	#category : #NitViz
}

{ #category : #building }
NVModel >> build [
	| dic year tool wordsTmp aKeyword |
	dic := self entries groupedBy: #year.
	years := OrderedCollection new.
	dic associations do: [ :assoc |
		year := NVYear new.
		year year: assoc key.
		year entries: assoc value.
		years add: year ].
	
	dic := self entries groupedBy: #toolIdentifier.
	tools := OrderedCollection new.
	dic associations do: [ :assoc |
		tool := NVTool new.
		tool tool: assoc key.
		tool entries: assoc value.
		tools add: tool ].
	
	keywords := OrderedCollection new.
	wordsTmp := self topicKeywords.
	wordsTmp do: [ :w |
		aKeyword := NVKeyword new.
		keywords add: aKeyword.
		aKeyword keyword: w.
		self entries do: [ :e |
			(e topicKeywords includes: w)
				ifTrue: [ 
					aKeyword addEntry: e.
					e addKeyword: aKeyword.
					 ] ]
		 ].
	
	

]

{ #category : #accessing }
NVModel >> entries [

	^ entries
]

{ #category : #accessing }
NVModel >> entries: someEntries [

	entries := someEntries
]

{ #category : #visualization }
NVModel >> inspectorKeywordsInteraction [
	<inspectorPresentationOrder: 90 title: 'Keywords'>
	^ SpRoassal3InspectorPresenter new
		canvas: self keywordsInteraction;
		yourself
]

{ #category : #visualization }
NVModel >> inspectorKeywordsInteractionContext: aContext [
	aContext withoutEvaluator
]

{ #category : #visualization }
NVModel >> inspectorNameCloud [
	<inspectorPresentationOrder: 90 title: 'NameCloud'>
	^ SpRoassal3InspectorPresenter new
		canvas: self nameCloud;
		yourself
]

{ #category : #visualization }
NVModel >> inspectorNameCloudContext: aContext [
	aContext withoutEvaluator
]

{ #category : #accessing }
NVModel >> keywords [

	^ keywords
]

{ #category : #accessing }
NVModel >> keywords: someKeywords [

	keywords := someKeywords
]

{ #category : #visualization }
NVModel >> keywordsInteraction [

	| m |
	m := RSMondrian new.
	m shape label.
	m nodes: self keywords.
	m line
		withBorderAttachPoint;
		noBidirectional;
		moveBehind;
		connectToAll: #connectedKeywords.
	m layout force.
	m build.
	^ m canvas
]

{ #category : #visualization }
NVModel >> nameCloud [
	| m |
	m := RSMondrian new.
	m shape label.
	m nodes: keywords. 
	m normalizeFontSize: #numberOfEntries from: 10 to: 25.
	m build.
	^ m canvas
]

{ #category : #accessing }
NVModel >> tools [

	^ tools
]

{ #category : #accessing }
NVModel >> tools: anObject [

	tools := anObject
]

{ #category : #accessing }
NVModel >> topicKeywords [
	^ (self entries flatCollect: #topicKeywords) asSet asSortedCollection asArray
]

{ #category : #accessing }
NVModel >> years [

	^ years
]

{ #category : #accessing }
NVModel >> years: anObject [

	years := anObject
]
