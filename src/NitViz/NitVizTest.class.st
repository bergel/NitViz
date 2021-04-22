Class {
	#name : #NitVizTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #NitViz
}

{ #category : #tests }
NitVizTest >> setUp [
	super setUp.
	model := NitVizExample new model
]

{ #category : #tests }
NitVizTest >> testExample [

	self assert: model notNil.
	self assert: model entries notEmpty.
	self assert: model entries size equals: 112.

	self assert: model years notEmpty.
	self assert: model years size equals: 5.

	model years do: [ :y | 
		self assert: (y entries allSatisfy: [ :e | e year == y year ]) ]
]

{ #category : #tests }
NitVizTest >> testTopicKeywords [
	| words |
	words := model mainTopics.
	self assert: words size equals: 33.
	self assert: words asSet size equals: words size.
]

{ #category : #tests }
NitVizTest >> testVisualization [
	model inspectorNameCloud; stack; nameCloud; mainTopicsInteraction.
	
]
