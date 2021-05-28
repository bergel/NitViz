Class {
	#name : #NVMainTopic,
	#superclass : #NVAbstractTopic,
	#instVars : [
		'connectedTo'
	],
	#category : #NitViz
}

{ #category : #'as yet unclassified' }
NVMainTopic >> connectedKeywords [
	^ (self entries flatCollect: #keywords as: Set) asArray sortedAs: #keyword
]

{ #category : #accessing }
NVMainTopic >> connectedTo [

	^ connectedTo
]

{ #category : #accessing }
NVMainTopic >> connectedTo: anObject [

	connectedTo := anObject
]

{ #category : #'as yet unclassified' }
NVMainTopic >> connectedTopics [
	^ (self entries flatCollect: #keywords as: Set) asArray sortedAs: #keyword
]

{ #category : #visualization }
NVMainTopic >> inspectorTrend [
	<inspectorPresentationOrder: 90 title: 'Trend'>
	^ SpRoassal3InspectorPresenter new
		canvas: self trend;
		yourself
]

{ #category : #'as yet unclassified' }
NVMainTopic >> maxPub [
	"Return the hightest number of publications per year"
	
	^ ((entries groupedBy: #year) associations collect: [ :asso | asso value size ]) max
	
]

{ #category : #accessing }
NVMainTopic >> subtopics [
	^ self entries flatCollect: #subtopics
]

{ #category : #'as yet unclassified' }
NVMainTopic >> trend [
	| xData yDataRaw yData chart data |
	xData := 2015 to: 2019.
	
	yDataRaw := xData collect: [ :aYear | (entries select: [ :e | e year = aYear ]) ].
	yData := yDataRaw collect: #size.
	
	chart := RSChart new.
	data := RSLinePlot new.
	data x: xData y: yData.
	chart addPlot: data.
	
	chart addDecoration: (RSXLabelDecoration new title: 'Year'; fontSize: 12).
	chart addDecoration: (RSYLabelDecoration new title: 'Number of entries'; fontSize: 12; offset: -20 @ 0).
	chart addDecoration: RSHorizontalTick new integer.
	chart addDecoration: RSVerticalTick new integer.
	chart build.
	
	^ chart canvas
]

{ #category : #'as yet unclassified' }
NVMainTopic >> trendBarchart [
	| xData yDataRaw yData chart data |
	xData := 2015 to: 2019.
	
	yDataRaw := xData collect: [ :aYear | (entries select: [ :e | e year = aYear ]) ].
	yData := yDataRaw collect: #size.
	
	chart := RSChart new.
	chart extent: 300 @ 100.
	data := RSBarPlot new.
	data y: yData.
	chart addPlot: data.
	
	chart build.
	
	^ chart canvas
]

{ #category : #'as yet unclassified' }
NVMainTopic >> trendBarchartWithMax: aMax [
	| xData yDataRaw yData chart data |
	xData := 2015 to: 2019.
	
	yDataRaw := xData collect: [ :aYear | (entries select: [ :e | e year = aYear ]) ].
	yData := yDataRaw collect: #size.
	
	chart := RSChart new.
	chart extent: 300 @ 100.
	data := RSBarPlot new.
	data y: yData.
	chart addPlot: data.
	chart maxValueY: aMax.
	chart build.
	
	^ chart canvas
]
