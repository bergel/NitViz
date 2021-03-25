Class {
	#name : #BaselineOfNitViz,
	#superclass : #BaselineOf,
	#category : #BaselineOfNitViz
}

{ #category : #baselines }
BaselineOfNitViz >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'NeoCSV' with: [ spec repository: 'github://svenvc/NeoCSV/repository' ];
				baseline: 'Roassal3' with: [ spec repository: 'github://ObjectProfile/Roassal3/src'; loads: #('Full') ];
				package: 'NitViz';
				
				group: 'default' with: #('NeoCSV' 'Roassal3' 'NitViz') ]
]
