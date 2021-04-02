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

{ #category : #visualization }
NVModel >> inspectorStack [
	<inspectorPresentationOrder: 90 title: 'Stack'>
	^ SpRoassal3InspectorPresenter new
		canvas: self stack;
		yourself
]

{ #category : #visualization }
NVModel >> inspectorStackContext: aContext [
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

{ #category : #visualization }
NVModel >> stack [

| c g shape es allMainTopics scale |
c := RSCanvas new.

years do: [ :aYear |
	g := RSGroup new.
	g addAll: (RSBox models: (aYear entries sortedAs: [ :en | en mainRETopics])).
	RSGridLayout new lineItemsCount: 4; on: g.
	g @ RSPopup.
	shape := g asShapeFor: aYear.
	shape padding: 5.
	shape color: Color veryVeryLightGray.
	c add: shape.
].

RSHorizontalLineLayout on: c shapes.

c shapes @ (RSLabeled new text: #year).

es := c deepShapesFromModels: self entries.
allMainTopics := (es collect: [:ss | ss model mainRETopics]) asSet asSortedCollection asArray.
scale := NSScale ordinalColored: allMainTopics size.
es do: [ :aShape | aShape color: (scale scale: aShape model mainRETopics) ].

^ c @ RSCanvasController.
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
