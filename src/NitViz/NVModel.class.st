Class {
	#name : #NVModel,
	#superclass : #Object,
	#instVars : [
		'entries',
		'years',
		'tools',
		'mainTopics',
		'subTopics'
	],
	#category : #NitViz
}

{ #category : #building }
NVModel >> build [
	| dic year tool wordsTmp aMainTopic aSubTopic |
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
	
	mainTopics := OrderedCollection new.
	wordsTmp := (entries flatCollect: #mainRETopicsAsWords) removeDuplicates.
	wordsTmp do: [ :w |
		aMainTopic := NVMainTopic new.
		aMainTopic keyword: w.
		mainTopics add: aMainTopic.
		
		self entries do: [ :e |
			(e mainRETopicsAsWords includes: w)
				ifTrue: [ 
					aMainTopic addEntry: e.
					e addMainTopic: aMainTopic.
					 ] ]
		 ].
	
	subTopics := OrderedCollection new.
	wordsTmp := (entries flatCollect: #subtopicsAsWords) removeDuplicates.
	wordsTmp do: [ :w |
		aSubTopic := NVSubTopic new.
		aSubTopic keyword: w.
		subTopics add: aSubTopic.
		
		self entries do: [ :e |
			(e subtopicsAsWords includes: w)
				ifTrue: [ 
					aSubTopic addEntry: e.
					e addSubTopic: aSubTopic.
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
		canvas: self mainTopicsInteraction;
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
NVModel >> inspectorSmallMultiples [
	<inspectorPresentationOrder: 90 title: 'Multiple'>
	^ SpRoassal3InspectorPresenter new
		canvas: self smallMultiples;
		yourself
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
NVModel >> mainTopics [

	^ mainTopics
]

{ #category : #accessing }
NVModel >> mainTopics: someMainTopics [

	mainTopics := someMainTopics
]

{ #category : #visualization }
NVModel >> mainTopicsInteraction [

	| m |
	m := RSMondrian new.
	m shape label.
	m nodes: self mainTopics.
	m line
		withBorderAttachPoint;
		noBidirectional;
		moveBehind;
		connectToAll: #connectedTopics.
	m layout force.
	m build.
	^ m canvas
]

{ #category : #visualization }
NVModel >> nameCloud [
	| m lb |
	m := RSMondrian new.
	m shape label.
	m nodes: mainTopics. 
	m normalizeFontSize: #numberOfEntries from: 10 to: 25.
	m layout flow alignLabel.
	m build.
	
	m canvas nodes @ RSHighlightable red.
	
	lb := RSLegend new.
	lb onDemand.
	lb container: m canvas.
	lb title: 'Name cloud'.
	lb text: 'Each word is a main topic'.
	lb text: 'Color of each entry reflect the mainRETopic'.
	lb build.

	^ m canvas
]

{ #category : #visualization }
NVModel >> smallMultiples [

	| canvas shape allShapes maxPub |
	canvas := RSCanvas new.
	maxPub := (self mainTopics collect: #maxPub) max.
	allShapes := self mainTopics collect: [ :t | 
		             shape := (t trendBarchartWithMax: maxPub) asShape.
		             shape model: t.
		             shape @ (RSLabeled new fontSize: 25).
		             canvas add: shape.
		             shape ].
	RSGridLayout new
		gapSize: 150;
		on: allShapes.
	canvas @ RSCanvasController.
	^ canvas
]

{ #category : #visualization }
NVModel >> stack [

	| c g shape es allMainTopics scale lb |
	c := RSCanvas new.

	years do: [ :aYear | 
		g := RSGroup new.
		g addAll:
			(RSBox models: (aYear entries sortedAs: [ :en | en mainRETopicsAsString ])).
		RSGridLayout new
			lineItemsCount: 3;
			on: g.
		g @ (RSPopup text: [ :entry | entry mainRETopicsAsString ]).
		shape := g asShapeFor: aYear.
		shape padding: 5.
		shape color: Color veryVeryLightGray.
		c add: shape ].

	RSHorizontalLineLayout on: c shapes.

	c shapes @ (RSLabeled new text: #year).

	es := c deepShapesFromModels: self entries.
	allMainTopics := (es collect: [ :ss | ss model mainRETopicsAsString ]) asSet
		                 asSortedCollection asArray.
	scale := NSScale ordinalColored: allMainTopics size.
	es do: [ :aShape | 
		aShape color: (scale scale: aShape model mainRETopicsAsString) ].

	lb := RSLegend new.
	lb container: c.
	lb title: 'Stack visualization'.
	lb text: 'Each inner box is an entry'.
	lb text: 'Color of each entry reflect the mainRETopics'.
	lb build.

	^ c @ RSCanvasController
]

{ #category : #accessing }
NVModel >> tools [

	^ tools
]

{ #category : #accessing }
NVModel >> tools: anObject [

	tools := anObject
]

{ #category : #visualization }
NVModel >> treemap [
| t |
t := RSTreeMap new.
t 
	extent: 200 asPoint;
	from: self mainTopics
		using: [ :topic | topic class == NVMainTopic ifTrue: [ topic subtopics ] ifFalse: [ #() ] ];
		leafWeight: #numberOfEntries.
"t modelWeight: [ :n | n numberOfEntries ]."
t build.
t shapes 
		select: [ :box | box isSLeaf ]
		thenDo: [ :box |
			box color: (Color blue darker)].
^ t canvas
]

{ #category : #accessing }
NVModel >> years [

	^ years
]

{ #category : #accessing }
NVModel >> years: anObject [

	years := anObject
]
